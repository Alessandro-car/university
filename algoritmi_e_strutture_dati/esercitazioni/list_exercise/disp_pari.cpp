#include "../tipi_di_dato/list/list.h"
#include <iostream>

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

void disp_pari(list<int>& l) {
	size_t i = l.begin();
	while (!l.end(i)) {
		if (l.read(i) % 2 == 0) {
			int val = l.read(i);
			l.erase(i);
			l.insert(val, size(l));
		}
		i = l.next(i);
	}
}

int main() {
	list<int> l;
	l.insert(3, 0);
	l.insert(7, 1);
	l.insert(8, 2);
	l.insert(1, 3);
	l.insert(4, 4);
	print_list(l);
	disp_pari(l);
	print_list(l);

	return 0;
}
