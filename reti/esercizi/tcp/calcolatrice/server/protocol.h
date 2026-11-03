#ifndef PROTOCOL_H_
#define PROTOCOL_H_

#define BUFSIZE 512
#define PROTOPORT 57015
#define QLEN 6

typedef struct __attribute__((packed)) {
	int operand1;
	int operand2;
	char operator_type;
} type_msg;

typedef enum  {
	INVALID_OPERATOR = 0,
	STATUS_OK = 1,
	STATUS_DIV_ZERO = 2
} operation_status;

typedef struct __attribute__((packed)) {
	operation_status status;
	float result;
} type_op_result;

#endif
