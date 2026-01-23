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

void rimpiazza_pari(list<int>& l) {
	size_t i = l.begin();
	size_t count_p = 0;
	while (!l.end(i)) {
		if (l.read(i) % 2 == 0) {
			l.erase(i);
			++count_p;
		} else {
			for (size_t j = 0; j < count_p; ++j) {
				l.insert(l.read(i), i);
				i = l.next(i);
			}
			i = l.next(i);
		}
	}
}

int main() {
	list<int> l;
	l.insert(4, 0);
	l.insert(6, 1);
	l.insert(7, 2);
	l.insert(3, 3);
	l.insert(2, 4);
	l.insert(5, 5);
	print_list(l);
	rimpiazza_pari(l);
	print_list(l);
	return 0;
}
