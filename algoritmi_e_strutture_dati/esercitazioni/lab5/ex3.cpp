#include "list.h"
#include <iostream>

using std::cout;
using std::endl;

template <class T>
void print_list(const list<T>& l) {
	size_t i = l.begin();
	while (!l.end(i)) {
		cout << l.read(i);
		i = l.next(i);
	}
}

void visualize_integer(const list<list<int>>& l) {
	size_t i = l.begin();
	while (!l.end(i)) {
		print_list(l.read(i));
		cout << " - ";
		i = l.next(i);
	}
	cout << endl;
}

int sum_integers(const list<list<int>>& l) {
	int sum = 0;
	size_t i = l.begin();
	while (!l.end(i)) {
		list<int> sub_list = l.read(i);
		size_t j = sub_list.begin();
		int num = 0;
		while (!sub_list.end(j)) {
			num = (num * 10) + sub_list.read(j);
			j = sub_list.next(j);
		}
		sum += num;
		i = l.next(i);
	}

	return sum;
}

int main() {
	list<list<int>> l;
	list<int> l1;
	l1.insert(12345);
	list<int> l2;
	l2.insert(324);
	l.insert(l1, 0);
	l.insert(l2, 1);
	visualize_integer(l);
	cout << sum_integers(l) << endl;
}

