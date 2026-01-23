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
size_t lunghezza(const list<T>& l) {
	size_t i = l.begin();
	while (!l.end(i)) {
		i = l.next(i);
	}
	return i;
}

template <class T>
void inverti(list<T>& l) {
	size_t end = lunghezza(l) - 1;
	for (size_t i = 0; i < lunghezza(l) / 2; ++i) {
		T tmp = l.read(i);
		l.write(l.read(end), i);
		l.write(tmp, end);
		--end;
	}
}

template <class T>
bool palindrome(const list<T>& l) {
	size_t end = lunghezza(l) - 1;
	for (size_t i = 0; i < lunghezza(l) / 2; ++i) {
		if (l.read(i) != l.read(end))
			return false;
		--end;
	}
	return true;
}

int main() {
	list<int> l;
	l.insert(1, 0);
	l.insert(2, 1);
	l.insert(3, 2);
	l.insert(2, 3);
	l.insert(1, 4);
	cout << lunghezza(l) << endl;
	list<int> l_reverse(l);
	inverti(l_reverse);
	print_list(l_reverse);
	cout << palindrome(l_reverse) << endl;
}
