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

size_t serialize_msg(const student_record* student, uint8_t* buffer) {
	int len = strlen(student->name) + sizeof(uint32_t)
		+ strlen(student->course) + sizeof(uint32_t)
		+ sizeof(student->num_grades) + (student->num_grades * sizeof(uint32_t));

	uint32_t net_len = htonl((uint32_t) len);
	size_t offset = 0;
	memcpy(&buffer[offset], &net_len, sizeof(net_len));
	offset += sizeof(net_len);


	uint32_t net_len_name = htonl((uint32_t) strlen(student->name));
	memcpy(&buffer[offset], &net_len_name, sizeof(uint32_t));
	offset += sizeof(uint32_t);

	memcpy(&buffer[offset], student->name, strlen(student->name));
	offset += strlen(student->name);

	uint32_t net_len_course = htonl((uint32_t) strlen(student->course));
	memcpy(&buffer[offset], &net_len_course, sizeof(uint32_t));
	offset += sizeof(uint32_t);

	memcpy(&buffer[offset], student->course, strlen(student->course));
	offset += strlen(student->course);

	memcpy(&buffer[offset], &student->num_grades, sizeof(student->num_grades));
	offset += sizeof(student->num_grades);

	for (size_t i = 0; i < student->num_grades; i++) {
		uint32_t net_grade = htonl((uint32_t) student->grades[i]);
		memcpy(&buffer[offset], &net_grade, sizeof(net_grade));
		offset += sizeof(net_grade);
	}

	return offset;
}

void deserialize_msg() {}

int main(void) {
	#if defined _WIN32
		// Initialize Winsock
		WSADATA wsa_data;
		int result = WSAStartup(MAKEWORD(2,2), &wsa_data);
		if (result != 0) {
			printf("Error at WSAStartup()\n");
			return -1;
		}
	#endif
	char* buffer = calloc(BUFSIZE, sizeof(char));
	student_record student = { 0 };
	char* name = calloc(BUFSIZE, sizeof(char));
	char* course = calloc(BUFSIZE, sizeof(char));
	int num_grades = 0;
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
		return -1;
	}

	// receive the welcome message from server
	if (recv(c_socket, buffer, BUFSIZE - 1, 0) <= 0) {
		errorhandler("recv() failed or connection closed prematurely\n");
		closesocket(c_socket);
		clearwinsock();
		return -1;
	}
	printf("%s\n", buffer);

	printf("Insert the name of the student: ");
	if (scanf("%511s", name) == 1) {
		student.name = (char*) calloc(strlen(name) + 1, sizeof(char));
		strcpy(student.name, name);
	}

	printf("Insert the course of the student: ");
	if (scanf("%511s", course) == 1) {
		student.course = (char*) calloc(strlen(course) + 1, sizeof(char));
		strcpy(student.course, course);
	}
	printf("Insert the number of grades of the student: ");
	scanf("%d", &num_grades);
	student.num_grades = num_grades;
	student.grades = (int32_t*) calloc(num_grades, sizeof(int32_t));
	for (size_t i = 0; i < num_grades; i++) {
		printf("Insert the %d-ith grade of the student: ", (int)(i + 1));
		scanf("%d", &student.grades[i]);
	}
	size_t total_len_record = sizeof(uint32_t)
		+ strlen(student.name) + sizeof(uint32_t)
		+ strlen(student.course) + sizeof(uint32_t)
		+ sizeof(student.num_grades) + (student.num_grades * sizeof(uint32_t));

	free(buffer);
	buffer = calloc(total_len_record, sizeof(char));
	size_t dim_buffer = serialize_msg(&student, (uint8_t*) buffer);
	if (send(c_socket, buffer, dim_buffer, 0) != (int) dim_buffer) {
		errorhandler("send() failed");
		closesocket(c_socket);
		clearwinsock();
		return -1;
	}


	//TODO: Read server response
	closesocket(c_socket);
	clearwinsock();
	free(buffer);
	return 0;
}
