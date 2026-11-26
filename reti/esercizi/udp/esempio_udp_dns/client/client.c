#if defined _WIN32
#include <winsock2.h>
#include <ws2tcpip.h>
#else
#define closesocket close
#include <sys/socket.h>
#include <sys/types.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <unistd.h>
#endif
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define HOSTNAME_LEN 1025
#define ECHOMAX 		 255
#define PORT    		 48000

void errorHandler(char* errorMsg) {
	printf("%s", errorMsg);
}

void clearWinSock() {
#if defined _WIN32
	WSACleanup();
#endif
}

int main(void) {
#if defined _WIN32
	WSADATA wsaData;
	int iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);
	if (iResult != 0) {
		printf("error at WSAStartup\n");
		return EXIT_FAILURE;
	}
#endif

	const char* name = "localhost";
	char port[16];
	snprintf(port, sizeof(port), "%d", PORT);
	struct addrinfo hints, *res, *p;
	memset(&hints, 0, sizeof(hints));
	hints.ai_family = AF_INET;
	hints.ai_socktype = SOCK_DGRAM;
	hints.ai_protocol = IPPROTO_UDP;
	int err = getaddrinfo(name, port, &hints, &res);
	if (err != 0) {
		fprintf(stderr, "getaddrinfo() failed: %s\n", gai_strerror(err));
		return EXIT_FAILURE;
	}
	int sock = -1;
	for (p = res; p != NULL; p = p->ai_next) {
		sock = socket(p->ai_family, p->ai_socktype, p->ai_protocol);
		if (sock >= 0)
			break;
	}
	if (sock < 0 || p == NULL) {
		errorHandler("socket() failed\n");
		freeaddrinfo(res);
		clearWinSock();
		return EXIT_FAILURE;
	}
	struct sockaddr_in sa;
	memset(&sa, 0, sizeof(sa));
	sa.sin_family = AF_INET;
	sa.sin_port = htons(PORT);
	sa.sin_addr.s_addr = ((struct sockaddr_in* ) p->ai_addr)->sin_addr.s_addr;

	char echoBuffer[ECHOMAX + 1];
	memset(echoBuffer, 0, sizeof(echoBuffer));
	int recvMsgSize;
	printf("Inserisci la stringa da inviare al server: ");
	scanf("%255s", echoBuffer);
	int queryLen = (int) strlen(echoBuffer);
	if (sendto(sock, echoBuffer, queryLen, 0, (struct sockaddr*) &sa, sizeof(sa)) != (ssize_t) queryLen) {
		errorHandler("sendto() sent different number of bytes than expected\n");
		closesocket(sock);
		freeaddrinfo(res);
		clearWinSock();
		return EXIT_FAILURE;
	}

	struct sockaddr_in echoClntAddr;
	socklen_t cliAddrLen = sizeof(echoClntAddr);
	recvMsgSize = (int) recvfrom(sock, echoBuffer, ECHOMAX, 0, (struct sockaddr*) &echoClntAddr, &cliAddrLen);
	if (recvMsgSize < 0) {
		errorHandler("recvfrom() failed\n");
		closesocket(sock);
		freeaddrinfo(res);
		clearWinSock();
		return EXIT_FAILURE;
	}
	echoBuffer[recvMsgSize] = '\0';

	char ip[INET_ADDRSTRLEN];
	getnameinfo(p->ai_addr, p->ai_addrlen, ip, sizeof(ip), NULL, 0, NI_NUMERICHOST);
	printf("Risultato di getaddrinfo(%s): %s\n", name, ip);
	char host[HOSTNAME_LEN];
	err = getnameinfo((struct sockaddr*) &sa, sizeof(sa), host, sizeof(host), NULL, 0, NI_NAMEREQD);
	if (err != 0) {
		fprintf(stderr, "getnameinfo() failed: %s\n", gai_strerror(err));
	} else {
		printf("Risultato di getnameinfo(127.0.0.1): %s\n", host);
	}
	freeaddrinfo(res);
	closesocket(sock);
	clearWinSock();
	return EXIT_SUCCESS;
}
