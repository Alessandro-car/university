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

template <class T>
list<T> rango(const list<T>& l) {
	list<T> rango_list(l);
	size_t i = l.begin();
	while (!l.end(i)) {

		T el = 0;
		size_t j = i;
		while (!l.end(j)) {
			el += l.read(j);
			j = l.next(j);
		}
		rango_list.write(el, i);
		i = l.next(i);
	}

	return rango_list;
}


int main() {
	list<int> l;
	l.insert(3, 0);
	l.insert(2, 1);
	l.insert(5, 2);
	list<int> l_rango = rango(l);
	print_list(l_rango);
}
