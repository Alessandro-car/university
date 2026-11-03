#ifndef PROTOCOL_H_
#define PROTOCOL_H_

#define BUFSIZE 512
#define PROTOPORT 57015

typedef struct __attribute__((packed)) {
	char* name;
	char* course;
	uint8_t num_grades;
	int32_t* grades;
} student_record;

#endif
