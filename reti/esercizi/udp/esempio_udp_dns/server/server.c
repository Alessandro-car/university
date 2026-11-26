/*
 ============================================================================
 Name        : server_udp.c
 Author      : Alessandro Carella
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */


#if defined _WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#define closesocket close
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <unistd.h>
#endif
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ECHOMAX 255
#define PORT    48000

void errorHandler(char* errorMsg) {
	printf("%s", errorMsg);
}

void clearWinSock() {
	#if defined _WIN32
	WSACleanup();
	#endif
}

int main() {
	#if defined _WIN32
	WSADATA wsaData;
	int iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);
	if (iResult != 0) {
		printf("error at WSAStartup\n");
		return EXIT_FAILURE;
	}
	#endif

	int sock;
	struct sockaddr_in echoServAddr;
	struct sockaddr_in echoClntAddr;
	socklen_t cliAddrLen;
	char echoBuffer[ECHOMAX + 1];
	int recvMsgSize;
	// CREAZIONE DELLA SOCKET
	if ((sock = socket(PF_INET, SOCK_DGRAM, IPPROTO_UDP)) < 0) {
		errorHandler("socket() failed\n");
		clearWinSock();
		return EXIT_FAILURE;
	}
	// COSTRUZIONE DELL'INDIRIZZO DEL SERVER
	memset(&echoServAddr, 0, sizeof(echoServAddr));
	echoServAddr.sin_family = AF_INET;
	echoServAddr.sin_port = htons(PORT);
	echoServAddr.sin_addr.s_addr = inet_addr("127.0.0.1");

	// BIND DELLA SOCKET
	if ((bind(sock, (struct sockaddr*) &echoServAddr, sizeof(echoServAddr))) < 0) {
		errorHandler("bind() failed");
		closesocket(sock);
		clearWinSock();
		return EXIT_FAILURE;
	}

	// RICEZIONE DELLA STRINGA ECHO DAL CLIENT
	while (1) {
		cliAddrLen = sizeof(echoClntAddr);
		recvMsgSize = recvfrom(sock, echoBuffer, ECHOMAX, 0, (struct sockaddr*) &echoClntAddr, &cliAddrLen);
		if (recvMsgSize < 0) {
			errorHandler("recvfrom() failed\n");
			continue;
		}
		echoBuffer[recvMsgSize] = '\0';
		printf("Handling client %s\n", inet_ntoa(echoClntAddr.sin_addr));
		printf("Received: %s\n", echoBuffer);
		fflush(stdout);

		// RINVIA LA STRINGA ECHO AL CLIENT
		if (sendto(sock, echoBuffer, recvMsgSize, 0, (struct sockaddr*) &echoClntAddr, sizeof(echoClntAddr)) != recvMsgSize)
			errorHandler("sendto() sent different number of bytes than expected\n");

	}
	return EXIT_SUCCESS;
}
