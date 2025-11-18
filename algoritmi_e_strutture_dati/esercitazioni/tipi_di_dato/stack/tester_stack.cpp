#include <iostream>
#include "stack.h"

using std::cout;
using std::endl;

template <class T>
void print_stack(const stack<T>& s);

int main() {
	stack<int> s;
	s.push(5);
	s.push(3);
	s.push(2);
	s.push(1);
	s.print();
	stack<int> s2(s);
	cout << (s2 == s) << endl;
	cout << s2.top() << endl;
	cout << s2.empty() << endl;
	cout << s2.size() << endl;
	s2.print();

	cout << "-----------------" << endl;
	cout << s.top() << endl;
	cout << s.size() << endl;
	cout << s.empty() << endl;
	s.print();
	s.pop();
	s.print();
	return 0;
}

