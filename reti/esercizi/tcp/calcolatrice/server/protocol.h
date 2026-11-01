#ifndef PROTOCOL_H_
#define PROTOCOL_H_

#define BUFSIZE 512
#define PROTOPORT 57015
#define QLEN 6
#define OP_RESULT_SIZE 5
#define MSG_SIZE 9

typedef struct {
	int operand1;
	int operand2;
	char operator_type;
} type_msg;

typedef enum  {
	INVALID_OPERATOR = 0,
	STATUS_OK = 1,
	STATUS_DIV_ZERO = 2
} operation_status;

typedef struct {
	operation_status status;
	float result;
} type_op_result;

#endif
