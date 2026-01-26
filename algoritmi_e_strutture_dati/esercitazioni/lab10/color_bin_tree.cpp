#include <iostream>
#include <string>
#include "../tipi_di_dato/bin_tree/bin_tree.h"
#include "../tipi_di_dato/queue/queue.h"

using namespace std;

// BFS Algorithm
size_t level_red(bin_tree<string> tree) {
		queue<node<string>> q;
		q.push(*tree.root());
		size_t count = 0;
		size_t level = 0;
		while (!q.empty()) {
			size_t n_nodes = q.size();
			for (size_t i = 0; i < n_nodes; ++i) {
				node<string> n = q.front();
				q.pop();
				if (level % 2 == 0 && tree.read(n) == "rosso") {
					bool white_child = false;
					if (!tree.left_empty(n) && tree.read(*tree.left(n)) == "bianco")
						white_child = true;
					if (!tree.right_empty(n) && tree.read(*tree.right(n)) == "bianco")
						white_child = true;
					if (white_child)
						++count;
				}
				if (!tree.left_empty(n))
					q.push(*tree.left(n));
				if (!tree.right_empty(n))
					q.push(*tree.right(n));
			}
			++level;
		}

	return count;
}

// DFS Algorithm
size_t green_leafs(bin_tree<string> tree, const node<string>& n) {
	size_t count = 0;
	if (tree.left_empty(n) && tree.right_empty(n) && tree.read(n) == "verde")
		++count;
	if (!tree.left_empty(n))
		count += green_leafs(tree, *tree.left(n));
	if (!tree.right_empty(n))
		count += green_leafs(tree, *tree.right(n));
	return count;
}

int main() {
	bin_tree<string> tree;
	tree.insert_root();
	tree.write("rosso" , *tree.root());
	// Level 1 (Odd)
	tree.insert_left(tree.root());
	tree.write("bianco", *tree.left(*tree.root()));
	tree.insert_right(tree.root());
	tree.write("rosso" , *tree.right((*tree.root())));
	// Level 2 (Even)
	tree.insert_left(tree.left(*tree.root()));
	tree.write("rosso", *tree.left(*tree.left(*tree.root())));
	tree.insert_left(tree.left(*tree.left(*tree.root())));
	tree.write("verde", *tree.left(*tree.left(*tree.left(*tree.root()))));
	tree.insert_right(tree.left(*tree.left(*tree.root())));
	tree.write("verde", *tree.right(*tree.left(*tree.left(*tree.root()))));

	cout << "Nodes found: " << level_red(tree) << " (Expected: 1)" << endl;
	cout << "Green leafs: " << green_leafs(tree, *tree.root()) << " (Expected: 2)" << endl;
	return 0;
}
