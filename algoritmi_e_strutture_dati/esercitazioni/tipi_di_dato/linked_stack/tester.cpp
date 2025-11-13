#include "linked_stack.h"

using std::cout;
using std::endl;

int main() {
	linked_stack<int> s1;
	s1.push(5);
	s1.push(4);
	s1.push(3);
	s1.push(2);
	s1.push(1);

	linked_stack<int> s2(s1);
	s1.push(6);
	s1.push(10);
	s2 = s1;
	s2.pop();
	s2.print();
	return 0;
}
