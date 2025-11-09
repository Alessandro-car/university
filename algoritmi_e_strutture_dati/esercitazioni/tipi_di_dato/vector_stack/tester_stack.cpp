#include <iostream>
#include "vector_stack.h"

using std::cout;
using std::endl;

template <class T>
void print_stack(const vector_stack<T>& s);

int main() {
	vector_stack<int> s;
	s.push(5);
	s.push(3);
	s.push(2);
	s.push(1);

	try {
		vector_stack<int> s2(s);
		cout << (s2 == s) << endl;
		cout << s2.top() << endl;
		cout << s2.empty() << endl;
		cout << s2.size() << endl;

		cout << "-----------------" << endl;
		cout << s.top() << endl;
		cout << s.size() << endl;
		cout << s.empty() << endl;
		s.pop();
		cout << s.top();
	} catch(const std::out_of_range& e) {
		cout << e.what() << endl;
	}
	return 0;
}

