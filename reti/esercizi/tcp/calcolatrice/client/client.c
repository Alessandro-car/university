#include <stdint.h>
#if defined _WIN32
#include <winsock2.h>
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

void clearwinsock() {
	#if defined _WIN32
		WSACleanup();
	#endif
}

void errorhandler(char* errormsg) {
	printf("%s", errormsg);
}

int recv_all(int socket, char* buf, int len) {
	int total = 0;
	while (total < len) {
		int n = recv(socket, buf + total, len - total, 0);
		if (n <= 0) return n;
		total += n;
	}
	return total;
}

size_t serialize_msg(const type_msg* msg, uint8_t buffer[MSG_SIZE]) {
	size_t offset = 0;

	uint32_t op1 = htonl((uint32_t) msg->operand1);
	memcpy(&buffer[offset], &op1, sizeof(op1));
	offset += sizeof(op1);

	uint32_t op2 = htonl((uint32_t) msg->operand2);
	memcpy(&buffer[offset], &op2, sizeof(op2));
	offset += sizeof(op2);

	buffer[offset] = msg->operator_type;
	offset += sizeof(char);

	return offset;
}

void deserialize_msg(const uint8_t buf[OP_RESULT_SIZE], type_op_result* msg) {
	size_t offset = 0;

	uint8_t raw_status = buf[offset];
	msg->status = (operation_status) raw_status;
	offset += sizeof(uint8_t);

	uint32_t net_bits;
	memcpy(&net_bits, &buf[offset], sizeof(net_bits));
	uint32_t bits = ntohl(net_bits);
	memcpy(&msg->result, &bits, sizeof(msg->result));

	offset += sizeof(net_bits);
}

int main(void) {
	#if defined _WIN32
		// Initialize Winsock
		WSADATA wsa_data;
		int result = WSAStartup(MAKEWORD(2,2), &wsa_data);
		if (result != 0) {
			printf("Error at WSAStartup()\n");
			return EXIT_FAILURE;
		}
	#endif

	int c_socket;
	c_socket = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (c_socket < 0) {
		errorhandler("socket creation failed.\n");
		clearwinsock();
		return EXIT_FAILURE;
	}

	struct sockaddr_in sad;
	memset(&sad, 0, sizeof(sad));
	sad.sin_family = AF_INET;
	sad.sin_addr.s_addr = inet_addr("127.0.0.1"); // IP del server
	sad.sin_port = htons(PROTOPORT); // Server port

	// connection
	if (connect(c_socket, (struct sockaddr*) &sad, sizeof(sad)) < 0) {
		errorhandler("Failed to connect.\n");
		closesocket(c_socket);
		clearwinsock();
		return EXIT_FAILURE;
	}

	// receive the welcome message from server
	char buffer[BUFSIZE];
	memset(buffer, '\0', BUFSIZE);
	if (recv(c_socket, buffer, BUFSIZE - 1, 0) <= 0) {
		errorhandler("recv() failed or connection closed prematurely\n");
		closesocket(c_socket);
		clearwinsock();
		return EXIT_FAILURE;
	}
	printf("%s\n", buffer);
	type_msg msg;
	memset(&msg, '\0', sizeof(msg));
	printf("Enter the first number: ");
	scanf("%d", &msg.operand1);
	printf("Enter the second number: ");
	scanf("%d", &msg.operand2);
	printf("Enter the symbol of the operation: ");
	scanf(" %c", &msg.operator_type);

	uint8_t buf[MSG_SIZE];
	serialize_msg(&msg, buf);
	if (send(c_socket, (char*) buf, MSG_SIZE, 0) != MSG_SIZE) {
		errorhandler("send() sent a different number of bytes than expected\n");
		closesocket(c_socket);
		clearwinsock();
		return -1;
	}

	type_op_result result;
	uint8_t res_buf[OP_RESULT_SIZE];
	memset(res_buf, '\0', OP_RESULT_SIZE);
	if (recv_all(c_socket, (char*) res_buf, OP_RESULT_SIZE) <= 0) {
		errorhandler("recv() failed or connection was closed prematurely\n");
		closesocket(c_socket);
		clearwinsock();
		return -1;
	}
	deserialize_msg(res_buf, &result);
	switch(result.status) {
		case INVALID_OPERATOR:
			printf("Unknown operator: %c\n", msg.operator_type);
			break;
		case STATUS_DIV_ZERO:
			printf("Can't divide by zero!\n");
			break;
		case STATUS_OK:
			printf("%d %c %d = %f", msg.operand1, msg.operator_type, msg.operand2, result.result);
	}
	closesocket(c_socket);
	clearwinsock();
	return 0;
}
