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
size_t count_element(const list<T>& l, T el) {
	size_t i = l.begin();
	size_t count = 0;
	while (!l.end(i)) {
		if (l.read(i) == el)
			++count;
		i = l.next(i);
	}
	return count;
}

template <class T>
void multiple_erase(list<T>& l, T el) {
	size_t i = l.begin();
	while (!l.end(i)) {
		if (l.read(i) == el)
			l.erase(i);
		i = l.next(i);
	}
}

template <class T>
list<T> epurazione(const list<T>& l) {
	list<T> new_l(l);
	size_t i = new_l.begin();
	while (!new_l.end(i)) {
		if (count_element(new_l, new_l.read(i)) == 2)
			multiple_erase(new_l, new_l.read(i));
		i = l.next(i);
	}
	return new_l;
}

int main() {
	list<int> l;
	l.insert(5, 0);
	l.insert(7, 1);
	l.insert(3, 2);
	l.insert(2, 3);
	l.insert(2, 4);
	l.insert(1, 5);
	l.insert(2, 6);
	l.insert(3, 7);
	print_list(epurazione(l));
}
