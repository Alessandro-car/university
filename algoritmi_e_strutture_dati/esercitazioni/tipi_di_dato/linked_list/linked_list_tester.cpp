#include <iostream>
#include <stdexcept>

#include "linked_list.h"

using std::cout;
using std::cin;

int main() {
	linked_list<int> l;
	l.insert(1, l.begin());
	l.insert(2, l.begin());
	l.insert(3, l.begin());
	l.insert(4, l.last());
	try {
		list_node<int>* p = l.begin();
		while (!l.end(p)) {
			cout << l.read(p) << std::endl;
			p = l.next(p);
		}
	} catch (const std::out_of_range& e) {
		std::cerr << "Exception caught: " << e.what() << std::endl;
	}
}
