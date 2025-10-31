#include "vector_list.h"
#include <iostream>
#include <stdexcept>

using namespace std;

template <class T>
void print_list(const vector_list<T>& l, int dim);

int main() {
	vector_list<int> list(5);
	list.insert(1, 1);
	list.insert(2, 2);
	list.insert(3, 3);
	list.insert(4, 4);
	list.insert(5, 5);
	print_list(list, 5);
	list.write(7, 5);
	print_list(list, 5);
	list.insert(10, 2);
	print_list(list, 6);
	list.erase(3);
	print_list(list, 5);
	return 0;
}

template <class T>
void print_list(const vector_list<T>& l, int dim) {
	try {
		for (int i = 0; i < dim; i++) {
			cout << l.read(i + 1) << " ";
		}
		cout << endl;
	} catch (const std::out_of_range& exception) {
		std::cerr << "Error" << exception.what() << endl;
	}
}

