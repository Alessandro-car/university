#include <iostream>
#include <stdexcept>

#include "linked_list.h"

using std::cout;
using std::cin;
using std::endl;

int main() {
	linked_list<int> l;
	l.insert(1, l.begin());
	l.insert(2, l.begin());
	try {
		list_node<int>* p = l.begin();
		for (size_t i = 0; i < l.size(); i++) {
			cout << l.read(p) << endl;
			p = l.next(p);
		}

	} catch (const std::out_of_range& e) {
		std::cerr << "Exception caught: " << e.what() << endl;
	}
}
