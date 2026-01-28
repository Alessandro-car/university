#include <iostream>
#include "../tipi_di_dato/ntree/ntree.h"
#include "../tipi_di_dato/queue/queue.h"

using namespace std;

template <class T>
void print_tree(const ntree<T>& t, node<T>* n, int depth = 0) {
	if (n == nullptr) return;

	// Crea l'indentazione
	for (int i = 0; i < depth; ++i) std::cout << "  ";

	// Stampa il valore del nodo
	std::cout << "|-- " << t.read(*n) << std::endl;

	// Ricorsione sui figli
	node<T>* child = t.first_son(*n);
	while (child != nullptr) {
			print_tree(t, child, depth + 1);
			child = t.next_sibling(*child);
	}
}

//DFS Algorithm
template <class T>
size_t depth(const ntree<T>& t, node<string> n) {
	size_t max_level = 0;
	node<string>* v = t.first_son(n);

	while (v != nullptr) {
		size_t cur_depth = depth(t, *v);
		if (cur_depth > max_level)
			max_level = cur_depth;

		v = t.next_sibling(*v);
	}
	return max_level + 1;
}

//BFS Algorithm
template <class T>
size_t width(const ntree<T>& t) {
	queue<node<string>*> q;
	q.push(t.root());
	size_t max = 0;
	while (!q.empty()) {
		size_t n_nodes = q.size();
		if (n_nodes > max)
			max = n_nodes;
		for (size_t i = 0; i < n_nodes; ++i) {
			node<string>* n = q.front();
			q.pop();

			node<string>* child = t.first_son(*n);
			while (child != nullptr) {
				q.push(child);
				child = t.next_sibling(*child);
			}
		}
	}
	return max;
}

typedef struct {
	size_t parent;
	size_t child;
} bow;

//BFS: Use BFS to identify the node to attach the subtree
void update_tree(ntree<size_t>& t1, ntree<size_t>& t2, size_t parent) {
	if (t1.empty()) {
		t1.insert_root();
		t1.write(parent, *t1.root());
		t1.insert_subtree(t1.root(), t1.root(), t2);
		return;
	}

	queue<node<size_t>*> q;
	q.push(t1.root());
	while (!q.empty()) {
		size_t n_nodes = q.size();
		for (size_t i = 0; i < n_nodes; ++i) {
			node<size_t>* n = q.front();
			q.pop();
			if (t1.read(*n) == parent) {
				if (t1.first_son(*n) != nullptr) {
					node<size_t>* last = t1.first_son(*n);
					while (t1.next_sibling(*last) != nullptr)
						last = t1.next_sibling(*last);
					t1.insert_subtree(last, n, t2);
				} else {
					t1.insert_subtree(n, n, t2);
				}
				return;
			}
			node<size_t>* child = t1.first_son(*n);
			while (child != nullptr) {
				q.push(child);
				child = t1.next_sibling(*child);
			}
		}
	}
}

ntree<size_t> create_tree(const myvec::vector<bow>& bows) {
//Get parent, get bow of that parent, skip and go to the next parent
	ntree<size_t> t;
	for (const auto& p_bow : bows) {
		ntree<size_t> child;
		child.insert_root();
		child.write(p_bow.child, *child.root());

		update_tree(t, child, p_bow.parent);
	}
	return t;
}


int main() {
	ntree<std::string> tree;

	// 1. Create the root
	tree.insert_root();
	node<std::string>* root = tree.root();
	tree.write("Root (L1)", *root);

	// 2. Add children to Root (Level 2)
	ntree<std::string> child1;
	child1.insert_root();
	child1.write("Child A (L2)", *child1.root());

	// Insert child1 into root
	tree.insert_subtree(root, root, child1);

	ntree<std::string> child2;
	child2.insert_root();
	child2.write("Child B (L2)", *child2.root());

	// Insert child2 as a sibling to Child A
	tree.insert_subtree(tree.first_son(*root), root, child2);

	// 3. Add a grandchild (Level 3)
	ntree<std::string> grandchild;
	grandchild.insert_root();
	grandchild.write("Grandchild (L3)", *grandchild.root());

	// Attach to Child A
	node<std::string>* childA_ptr = tree.first_son(*root);
	tree.insert_subtree(childA_ptr, childA_ptr, grandchild);

	// 4. Calculate Width and Depth
	std::cout << "Calculated Width: " << width(tree) << std::endl;
	std::cout << "Calculated Depth: " << depth(tree, *tree.root()) << std::endl;
	// Expected Output: 3 for depth and 2 for width
	myvec::vector<bow> edges = {
        {0, 1}, {0, 2}, // Figli della radice 0
        {1, 3}, {1, 4}, // Figli di 1
        {2, 5},         // Figlio di 2
        {4, 6}          // Figlio di 4
    };

	std::cout << "Costruzione dell'albero in corso..." << std::endl;
	ntree<size_t> my_tree = create_tree(edges);

	std::cout << "\nStruttura dell'albero generato:" << std::endl;
	if (!my_tree.empty()) {
			print_tree(my_tree, my_tree.root());
	} else {
			std::cout << "L'albero e' vuoto." << std::endl;
	}

  return 0;
}
