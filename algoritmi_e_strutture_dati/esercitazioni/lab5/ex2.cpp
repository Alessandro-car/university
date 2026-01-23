#include "list.h"
#include <iostream>
#include <string>

using std::string;
using std::cout;
using std::endl;

template <class T>
void print_list(const list<T>& l) {
	size_t i = l.begin();
	while (!l.end(i)) {
		cout << l.read(i) << " ";
		i = l.next(i);
	}
	cout << endl;
}

int main() {
	list<int> l;
	l.insert_linear(2);
	l.insert_linear(4);
	l.insert_linear(3);
	print_list(l);

	list<int> l2;
	l2.insert_linear(5);
	l2.insert_linear(7);
	l2.insert_linear(6);
	l2.insert_linear(3);
	print_list(l2);
	l.merge(l2);
	print_list(l);

	list<string> l3;
	l3.insert_linear("Alessandro");
	l3.insert_linear("Davide");
	l3.insert_linear("Ciao");
	print_list(l3);

	list<string> l4;
	l4.insert_linear("Alessandro");
	l4.insert_linear("Babbo");
	l4.insert_linear("Mamma");
	print_list(l4);
	l3.merge(l4);
	print_list(l3);
}
