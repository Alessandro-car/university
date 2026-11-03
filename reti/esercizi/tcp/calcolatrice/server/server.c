#include <stdint.h>
#if defined _WIN32
#include <winsock2.h>
#include <ws2tcpip.h> // getaddrinfo(), getnameinfo(); link with ws2_32
#else
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netdb.h>
#define closesocket close
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "protocol.h"

int recv_all(int socket, char *buf, int len) {
	int total = 0;
	while (total < len) {
		int n = recv(socket, buf + total, len - total, 0);
		if (n <= 0) {
			return n;
		}
		total += n;
	}
	return total;
}


void deserialize_msg(const uint8_t buffer[sizeof(type_msg)], type_msg* msg) {
	size_t offset = 0;

	uint32_t operand1;
	memcpy(&operand1, &buffer[offset], sizeof(operand1));
	msg->operand1 = (int)ntohl(operand1);
	offset += sizeof(operand1);

	uint32_t operand2;
	memcpy(&operand2, &buffer[offset], sizeof(operand2));
	msg->operand2 = (int)ntohl(operand2);
	offset += sizeof(operand2);

	msg->operator_type = (char) buffer[offset];
	offset += sizeof(char);
}

void serialize_msg(const type_op_result* result_msg, uint8_t buf[sizeof(type_op_result)]) {
	size_t offset = 0;
	buf[offset] = (uint8_t) result_msg->status;
	offset += sizeof(uint8_t);

	uint32_t bits;
	memcpy(&bits, &result_msg->result, sizeof(bits));
	uint32_t net_bits = htonl(bits);
	memcpy(&buf[offset], &net_bits, sizeof(net_bits));
	offset += sizeof(net_bits);
}

void errorhandler(char* errormsg) {
	printf("%s", errormsg);
}

void clearwinsock() {
#if defined _WIN32
	WSACleanup();
#endif
}

void handle_client(const type_msg* msg, type_op_result* result_msg) {
	int op1 = msg->operand1;
	int op2 = msg->operand2;
	switch (msg->operator_type) {
		case '+':
			result_msg->status = STATUS_OK;
			result_msg->result = op1 + op2;
			break;
		case '*':
			result_msg->status = STATUS_OK;
			result_msg->result = op1 * op2;
			break;
		case '-':
			result_msg->status = STATUS_OK;
			result_msg->result = op1 - op2;
			break;
		case '/':
			if (op2 == 0) {
				result_msg->status = STATUS_DIV_ZERO;
			} else {
				result_msg->status = STATUS_OK;
				result_msg->result = (float) op1 / op2;
			}
			break;
		default:
			result_msg->status = INVALID_OPERATOR;
			break;
	}
}

int main(int argc, char *argv[]) {
#if defined _WIN32
	// Initialize Winsock
	WSADATA wsa_data;
	int result = WSAStartup(MAKEWORD(2,2), &wsa_data);
	if (result != 0) {
		printf("Error at WSAStartup()\n");
		return EXIT_FAILURE;
	}
#endif
	int my_socket;
	my_socket = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (my_socket < 0) {
		errorhandler("socket creation failed.\n");
		clearwinsock();
		return -1;
	}

	//set connection settings
	struct sockaddr_in sad;
	memset(&sad, 0, sizeof(sad)); // ensures that extra bytes contain 0
	sad.sin_family = AF_INET;
	sad.sin_addr.s_addr = inet_addr("127.0.0.1");
	sad.sin_port = htons(PROTOPORT);
	if (bind(my_socket, (struct sockaddr*) &sad, sizeof(sad)) < 0) {
		errorhandler("bind() failed.\n");
		closesocket(my_socket);
		clearwinsock();
		return -1;
	}

	// listen
	if (listen(my_socket, QLEN) < 0) {
		errorhandler("listen() failed.\n");
		closesocket(my_socket);
		clearwinsock();
		return -1;
	}

	// accept new connection
	struct sockaddr_in cad; // structure for the client address
	int client_socket;       // socket descriptor for the client
	socklen_t client_len;          // the size of the client address
	printf("Waiting for a client to connect...\n\n");
	fflush(stdout);
	while (1) {
		client_len = sizeof(cad); // set the size of the client address
		if ((client_socket = accept(my_socket, (struct sockaddr*) &cad,
				&client_len)) < 0) {
			errorhandler("accept() failed.\n");
			closesocket(my_socket);
			clearwinsock();
			continue;
		}

		printf("Handling client %s\n", inet_ntoa(cad.sin_addr));
		fflush(stdout);

		// send the welcome message
		char *s = "Connessione avvenuta";
		int len = strlen(s);
		if (send(client_socket, s, len, 0) != len) {
			errorhandler("send() sent a different number of bytes than expected\n");
			closesocket(client_socket);
			continue; // keep serving other clients
		}

		type_msg msg;
		uint8_t* buf = (uint8_t*) calloc(sizeof(type_msg), sizeof(uint8_t));
		if (recv_all(client_socket, (char*) buf, sizeof(type_msg)) <= 0) {
			errorhandler("recv() failed or connection closed prematurely.\n");
			closesocket(my_socket);
			clearwinsock();
			return -1;
		}
		deserialize_msg(buf, &msg);
		free(buf);
		buf = (uint8_t*) calloc(sizeof(type_op_result), sizeof(uint8_t));
		type_op_result result_msg;
		memset(&result_msg, 0, sizeof(result_msg));
		handle_client(&msg, &result_msg);
		serialize_msg(&result_msg, buf);
		if (send(client_socket, (char*) buf, sizeof(type_op_result), 0) != sizeof(type_op_result)) {
			errorhandler("send() sent a different number of bytes than expected\n");
			closesocket(my_socket);
			clearwinsock();
			return -1;
		}
	}

	closesocket(my_socket);
	clearwinsock();
	return 1;
} // main end
