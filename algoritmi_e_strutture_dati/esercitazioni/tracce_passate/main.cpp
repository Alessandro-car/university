#include <iostream>
#include "../tipi_di_dato/list/list.h"
#include "../tipi_di_dato/vector/vector.h"
#include "../tipi_di_dato/ntree/ntree.h"
#include "../tipi_di_dato/queue/queue.h"
// Restituire il numero di occorrenze dei multipli di k in l
int freq(list<int>& l, int k) {
	size_t i = l.begin();
	int count = 0;
	while (!l.end(i)) {
		if (l.read(i) % k == 0) {
			std::cout << l.read(i) << std::endl;
			++count;
		}
		i = l.next(i);
	}
	return count;
}

// Conta le occorrenze di un elemento nella lista
size_t count_el(const list<int>& l, int el) {
	size_t i = l.begin();
	size_t count = 0;
	while (!l.end(i)) {
		if (el == l.read(i))
			++count;
		i = l.next(i);
	}
	return count;
}

bool contain(const myvec::vector<int> v, int k) {
	for (int el : v)
		if (k == el)
			return true;
	return false;
}

// Stampa la frequenza di ogni elemento presente nella lista
void hist(list<int>& l) {
	myvec::vector<int> visited;
	size_t i = l.begin();
	while (!l.end(i)) {
		if (!contain(visited, l.read(i))) {
			visited.push_back(l.read(i));
			std::cout << "The number " << l.read(i) << " appears " << count_el(l, l.read(i)) << " times in the list." << std::endl;
		}
		i = l.next(i);
	}
}

// Rimuove dalla lista tutti gli elementi seguiti da un numero dispari
void remp(list<int>& l) {
	size_t i = l.begin();
	while (!l.end(i)) {
		if (i != l.last()) {
			if (l.read(l.next(i)) % 2 != 0)
				l.erase(i);
		}
		i = l.next(i);
	}
	return;
}
// Restituisce il livello del nodo nel quale la somma dei nodi e' massima
// BFS Algorithm
int max_level(ntree<int>& nt) {
	queue<node<int>*> q;
	q.push(nt.root());
	int level = 1;
	int max_sum = -1;
	int max_level = 1;
	while (!q.empty()) {
		size_t n_nodes = q.size();
		int sum = 0;
		for (size_t i = 0; i < n_nodes; ++i) {
			node<int>* n = q.front();
			q.pop();
			sum += nt.read(*n);

			node<int>* child = nt.first_son(*n);
			while (child != nullptr) {
				q.push(child);
				child = nt.next_sibling(*child);
			}
		}
		if (sum > max_sum) {
			max_sum = sum;
			max_level = level;
		}
		level++;
	}
	return max_level;
}

int main() {
	list<int> l;
	l.insert(2, l.begin());
	l.insert(2, l.last());
	l.insert(3, l.last());
	l.insert(4, l.last());
	l.insert(5, l.last());
	l.insert(6, l.last());
	l.insert(8, l.last());
	l.insert(10, l.last());
	l.insert(8, l.last());
	l.insert(5, l.last());
	std::cout << freq(l, 5) << std::endl;
	hist(l);
	remp(l);
	l.print();

	ntree<int> tree;

	// 1. Create the root
	tree.insert_root();
	node<int>* root = tree.root();
	tree.write(10, *root);

	// 2. Add children to Root (Level 2)
	ntree<int> child1;
	child1.insert_root();
	child1.write(40, *child1.root());

	// Insert child1 into root
	tree.insert_subtree(root, root, child1);

	ntree<int> child2;
	child2.insert_root();
	child2.write(1, *child2.root());

	// Insert child2 as a sibling to Child A
	tree.insert_subtree(tree.first_son(*root), root, child2);

	// 3. Add a grandchild (Level 3)
	ntree<int> grandchild;
	grandchild.insert_root();
	grandchild.write(40, *grandchild.root());

	// Attach to Child A
	node<int>* childA_ptr = tree.first_son(*root);
	tree.insert_subtree(childA_ptr, childA_ptr, grandchild);

	tree.print(tree.root());
	std::cout << max_level(tree) << std::endl;
	return 0;
}
