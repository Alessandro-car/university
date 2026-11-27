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
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define HOSTNAME_LEN 1025
#define ECHOMAX 		 255
#define PORT_LEN 		 16
#define TARGET_MAX   (HOSTNAME_LEN + PORT_LEN + 8)
#define MIN_PORT     1024
#define MAX_PORT     65535

typedef struct {
	char name[HOSTNAME_LEN + 1];
	char port_str[PORT_LEN + 1];
	int  port;
} server_udp;

void errorHandler(char* errorMsg) {
	printf("%s", errorMsg);
}

void clearWinSock() {
#if defined _WIN32
	WSACleanup();
#endif
}

int parse_server_udp(const char* raw_input, server_udp* out) {
	if (raw_input == NULL || out == NULL) return -1;

	char buf[TARGET_MAX];
	size_t raw_len = strlen(raw_input);
	if (raw_len == 0 || raw_len >= sizeof(buf)) return -1;

	memcpy(buf, raw_input, raw_len + 1);
	buf[strcspn(buf, "\r\n")] = '\0';
	char* colon = strrchr(buf, ':');
	if (colon == NULL || colon == buf || *(colon + 1) == '\0') return -1;
	*colon = '\0';
	const char* host_part = buf;
	const char* port_part = colon + 1;

	size_t host_len = strlen(host_part);
	size_t port_len = strlen(port_part);
	if (host_len == 0 || host_len > HOSTNAME_LEN || port_len == 0 || port_len > PORT_LEN)			return -1;
	errno = 0;
	char* end_ptr = NULL;
	long parsed = strtol(port_part, &end_ptr, 10);
	if (errno != 0 || end_ptr == port_part || *end_ptr != '\0')
		return -1;
	if (parsed < MIN_PORT || parsed > MAX_PORT)
		return -1;
	memset(out, 0, sizeof(*out));
	memcpy(out->name, host_part, host_len + 1);
	memcpy(out->port_str, port_part, port_len + 1);
	out->port = (int) parsed;
	return 0;
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
	server_udp server;
	char raw_target[TARGET_MAX];
	printf("Inserisci server e porta UDP [nome:porta]: ");
	fflush(stdout);
	if (fgets(raw_target, sizeof(raw_target), stdin) == NULL) {
		fprintf(stderr, "Errore nenlla lettura di server:porta\n");
		return EXIT_FAILURE;
	}

	if (parse_server_udp(raw_target, &server) != 0) {
		fprintf(stderr, "Input non valido o porta non > 1023\n");
		return EXIT_FAILURE;
	}
	struct addrinfo hints, *res, *p;
	memset(&hints, 0, sizeof(hints));
	hints.ai_family = AF_INET;
	hints.ai_socktype = SOCK_DGRAM;
	hints.ai_protocol = IPPROTO_UDP;
	int err = getaddrinfo(server.name, server.port_str, &hints, &res);
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
	sa.sin_port = htons(server.port);
	sa.sin_addr.s_addr = ((struct sockaddr_in* ) p->ai_addr)->sin_addr.s_addr;
	char* start_msg = "Helo";
	if (sendto(sock, start_msg, (int) strlen(start_msg), 0, (struct sockaddr*) &sa, sizeof(sa)) != (int) strlen(start_msg)) {
		errorHandler("sendto() sent different number of bytes than expected\n");
		closesocket(sock);
		freeaddrinfo(res);
		clearWinSock();
		return EXIT_FAILURE;
	}
	char echoBuffer[ECHOMAX + 1];
	memset(echoBuffer, 0, sizeof(echoBuffer));
	int recvMsgSize;
	printf("Inserisci la stringa da inviare al server: ");
	scanf("%255s", echoBuffer);
	int queryLen = (int) strlen(echoBuffer);
	if (sendto(sock, echoBuffer, queryLen, 0, (struct sockaddr*) &sa, sizeof(sa)) != (int) queryLen) {
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
	printf("Stringa '%s' ricevuta dal server nome: %s indirizzo: %s\n", echoBuffer, server.name, ip);
	char host[HOSTNAME_LEN];
	err = getnameinfo((struct sockaddr*) &sa, sizeof(sa), host, sizeof(host), NULL, 0, NI_NAMEREQD);
	if (err != 0) {
		fprintf(stderr, "getnameinfo() failed: %s\n", gai_strerror(err));
	}
	freeaddrinfo(res);
	closesocket(sock);
	clearWinSock();
	return EXIT_SUCCESS;
}
