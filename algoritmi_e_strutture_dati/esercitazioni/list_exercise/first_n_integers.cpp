#include <iostream>
#include "../tipi_di_dato/list/list.h"

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

template <class T>
size_t size(const list<T>& l) {
	size_t i = l.begin();
	while (!l.end(i)) {
		i = l.next(i);
	}
	return i;
}

void first_n(list<int>* l1, list<int>* l2, int n) {
	int second_count = 1;
	while (n > 0) {
		l1->insert(n, size(*l1));
		l2->insert(second_count, size(*l2));
		--n;
		++second_count;
	}
}

int main() {
	list<int> l1;
	list<int> l2;
	first_n(&l1, &l2, 10);
	print_list(l1);
	print_list(l2);
}
