# Macros

PROGRAM = testcoda
COMPILER = g++
FLAGS = -g

# Explicit rules

testcoda: testcoda.o codavt.o
	$(COMPILER) $(FLAGS) testcoda.cpp codavt.o -o $(PROGRAM)

codavt.o: codavt.cpp
	${COMPILER} ${FLAGS} -c codavt.cpp


