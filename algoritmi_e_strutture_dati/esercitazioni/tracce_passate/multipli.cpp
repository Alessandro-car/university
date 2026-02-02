#include <iostream>
#include "../tipi_di_dato/bin_tree/bin_tree.h"
#include "../tipi_di_dato/queue/queue.h"

size_t count_even_node(const bin_tree<int>& bt, node<int>& n) {
	size_t count = 0;
	if (bt.read(n) % 2 == 0)
		++count;
	if (!bt.left_empty(n))
		count += count_even_node(bt, *bt.left(n));
	if (!bt.right_empty(n))
		count += count_even_node(bt, *bt.right(n));
	return count;
}

void multipli(bin_tree<int>& bt) {
	queue<node<int>*> q;
	q.push(bt.root());
	while (!q.empty()) {
		node<int>* n = q.front();
		q.pop();

		bt.write(count_even_node(bt, *n), *n);

		if (!bt.left_empty(*n))
			q.push(bt.left(*n));
		if (!bt.right_empty(*n))
			q.push(bt.right(*n));
	}
}

void invisita(bin_tree<int>& bt, node<int>& n) {
	if (bt.left_empty(n) && bt.right_empty(n))
		std::cout << bt.read(n) << std::endl;
	else {
		node<int>* left;
		if (!bt.left_empty(n))
			invisita(bt, *bt.left(n));
		std::cout << bt.read(n) << std::endl;
		if (!bt.right_empty(n))
			invisita(bt, *bt.right(n));
	}
}

int main() {
	bin_tree<int> t1;
	t1.insert_root();
	t1.write(10, *t1.root());
	t1.insert_left(t1.root());
	t1.write(5, *t1.left(*t1.root()));
	t1.insert_right(t1.root());
	t1.write(15, *t1.right(*t1.root()));
	t1.insert_left(t1.left(*t1.root()));
	t1.write(12, *t1.left(*t1.left(*t1.root())));
	t1.insert_right(t1.left(*t1.root()));
	t1.write(14, *t1.right(*t1.left(*t1.root())));
	t1.insert_left(t1.right(*t1.root()));
	t1.write(11, *t1.left(*t1.right(*t1.root())));
	t1.insert_right(t1.right(*t1.root()));
	t1.write(13, *t1.right(*t1.right(*t1.root())));
	t1.print(t1.root());
	std::cout << "Invisita:" << std::endl;
	invisita(t1, *t1.root());
	std::cout << "Even nodes: ";
	std::cout << count_even_node(t1, *t1.root()) << std::endl;
	multipli(t1);
	t1.print(t1.root());
	return 0;
}
