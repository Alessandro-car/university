#include <iostream>
#include <iterator>
#include "../tipi_di_dato/vector_list/vector_list.h"

using std::cout;
using std::endl;

template <class T>
size_t list_length(const vector_list<T>& l);

template <class T>
void reverse_list(vector_list<T>* l);

template <class T>
bool list_palindrome(const vector_list<T>& l);

int main() {
	vector_list<int> list;
	list.insert(1, 1);
	list.insert(2, 2);
	list.insert(2, 3);
	list.insert(1, 4);

	reverse_list(&list);
	size_t len_list = list_length(list);
	size_t p = list.begin();
	while (!list.end(p)) {
		cout << list.read(p) << endl;
		p = list.next(p);
	}

	cout << list_palindrome(list) << endl;

	return 0;
}

template <class T>
size_t list_length(const vector_list<T>& l) {
	size_t length = 0;
	size_t pos = l.begin();
	while (!l.end(pos)) {
		pos = l.next(pos);
		length++;
	}
	return length;
}

template <class T>
void reverse_list(vector_list<T>* l) {
	if (!l->empty()) {
		size_t len = list_length(*l);
		for (size_t i = 0; i < len / 2; i++) {
			int tmp = l->read(i + 1);
			l->write(l->read(len - i), i + 1);
			l->write(tmp, len - i);
		}
	}
}

template <class T>
bool list_palindrome(const vector_list<T>& l) {
	vector_list<T> tmp(l);
	reverse_list(&tmp);
	return l == tmp;
}

