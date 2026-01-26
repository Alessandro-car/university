#include <iostream>
#include <string>
#include "../tipi_di_dato/bin_tree/bin_tree.h"

using namespace std;

template <class T>
void print_tree(const bin_tree<T>& tree, node<T>* n) {
    if (n == nullptr) return;
    print_tree(tree, tree.left(*n));
    std::cout << tree.read(*n) << " ";
    print_tree(tree, tree.right(*n));
}
// DFS Algorithm
void erase_even_leafs(bin_tree<int>& tree, node<int>& n) {
	if (tree.left_empty(n) && tree.right_empty(n) && tree.read(n) % 2 == 0) {
		tree.delete_subtree(&n);
		return;
	}
	if (!tree.left_empty(n))
		erase_even_leafs(tree, *tree.left(n));
	if (!tree.right_empty(n))
		erase_even_leafs(tree, *tree.right(n));
}

template <class T>
void mutation(bin_tree<T>& t1, bin_tree<T>& t2, node<T>* u, node<T>* v) {
	node<T>* u_parent = t1.parent(*u);
	node<T>* v_parent = t2.parent(*v);
}

bin_tree<string> parse_tree(const string& exp) {
	bin_tree<string> p_tree;
	return p_tree;
}

int main() {
	// --- Setup Tree 1 ---
	bin_tree<int> t1;
	t1.insert_root();
	t1.write(10, *t1.root());
	t1.insert_left(t1.root());
	t1.write(5, *t1.left(*t1.root()));
	t1.insert_right(t1.root());
	t1.write(15, *t1.right(*t1.root()));

	// --- Setup Tree 2 ---
	bin_tree<int> t2;
	t2.insert_root();
	t2.write(100, *t2.root());
	t2.insert_left(t2.root());
	t2.write(200, *t2.left(*t2.root()));

	std::cout << "--- Testing Mutation ---" << std::endl;
	std::cout << "Tree 1 before: "; print_tree(t1, t1.root()); std::cout << std::endl;
	std::cout << "Tree 2 before: "; print_tree(t2, t2.root()); std::cout << std::endl;

	// Swap the '5' node from T1 with the '200' node from T2
	mutation(t1, t2, t1.left(*t1.root()), t2.left(*t2.root()));

	std::cout << "Tree 1 after mutation: "; print_tree(t1, t1.root()); std::cout << std::endl;
	std::cout << "Tree 2 after mutation: "; print_tree(t2, t2.root()); std::cout << std::endl;

	std::cout << "\n--- Testing Erase Even Leafs ---" << std::endl;
	// Current T1 is [200, 10, 15]. 200 is a leaf and even. 15 is a leaf and odd.
	// Let's add an even leaf to T1
	t1.insert_left(t1.left(*t1.root())); // Add leaf under 200
	t1.write(4, *t1.left(*t1.left(*t1.root())));

	std::cout << "T1 before erase: "; print_tree(t1, t1.root()); std::cout << std::endl;
	erase_even_leafs(t1, *t1.root());
	std::cout << "T1 after erase:  "; print_tree(t1, t1.root()); std::cout << " (4 and 200 should be gone)" << std::endl;

	return 0;
}
