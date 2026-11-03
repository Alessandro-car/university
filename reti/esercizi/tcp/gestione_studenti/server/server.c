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
#include <stdint.h>
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


void deserialize_msg(const uint8_t* buffer, student_record* student) {
	size_t offset = 0;

	uint32_t net_len_name;
	memcpy(&net_len_name, &buffer[offset], sizeof(uint32_t));
	int len_name = (int) ntohl(net_len_name);
	offset += sizeof(uint32_t);

	student->name = calloc(len_name + 1, sizeof(char));
	memcpy(student->name, &buffer[offset], (size_t) len_name);
	student->name[len_name] = '\0';
	offset += len_name;


	uint32_t net_len_course;
	memcpy(&net_len_course, &buffer[offset], sizeof(uint32_t));
	int len_course = (int) ntohl(net_len_course);
	offset += sizeof(uint32_t);

	student->course = calloc(len_course + 1, sizeof(char));
	memcpy(student->course, &buffer[offset], (size_t) len_course);
	student->course[len_course] = '\0';
	offset += len_course;

	memcpy(&student->num_grades, &buffer[offset], sizeof(uint8_t));
	offset += sizeof(uint8_t);

	student->grades = (int32_t*) calloc(student->num_grades, sizeof(int32_t));
	for (size_t i = 0; i < student->num_grades; i++) {
		uint32_t net_grade;
		memcpy(&net_grade, &buffer[offset], sizeof(uint32_t));
		student->grades[i] = (int32_t) ntohl(net_grade);
		offset += sizeof(uint32_t);
	}
}

void serialize_msg(const student_record* student, float mean_grade) {

}

void errorhandler(char* errormsg) {
	printf("%s", errormsg);
}

void clearwinsock() {
#if defined _WIN32
	WSACleanup();
#endif
}

float handle_client(int32_t* grades, uint8_t num_grades) {
	float sum = 0;
	for (size_t i = 0; i < num_grades; i++) {
		sum += grades[i];
	}
	return sum / num_grades;
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
	char* buf = calloc(BUFSIZE, sizeof(char));
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
		int len = strlen(s) + 1;
		if (send(client_socket, s, len, 0) != len) {
			errorhandler("send() sent a different number of bytes than expected\n");
			closesocket(client_socket);
			continue; // keep serving other clients
		}
		free(buf);
		buf = calloc(sizeof(uint32_t), sizeof(char));
		if (recv_all(client_socket, buf, sizeof(uint32_t)) <= 0) {
			errorhandler("recv() failed.");
			closesocket(client_socket);
			continue;
		}
		uint32_t net_len;
		memcpy(&net_len, buf, sizeof(uint32_t));
		int len_student_record = ntohl(net_len);
		printf("Message size: %d\n", len_student_record);
		free(buf);
		buf = calloc(len_student_record, sizeof(char));
		if (recv_all(client_socket, buf, len_student_record) <= 0) {
			errorhandler("recv() failed");
			closesocket(client_socket);
			continue;
		}
		student_record student = { 0 };
		deserialize_msg((uint8_t*) buf, &student);
		printf("%s - %s - %d\n", student.name, student.course, student.num_grades);
		//Handle client
		//Send data
		closesocket(client_socket);
		free(buf);
		free(student.name);
		free(student.course);
		free(student.grades);
	}
	closesocket(my_socket);
	clearwinsock();
	return 1;
} // main end
