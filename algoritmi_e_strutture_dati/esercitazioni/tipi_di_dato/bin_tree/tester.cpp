#include <iostream>
#include "bin_tree.h"
using namespace std;

// Helper function to print tree in-order
template <class T>
void print_inorder(bin_tree<T>& tree, node<T>* n) {
    if (n == nullptr) return;

    if (!tree.left_empty(*n)) {
        print_inorder(tree, tree.left(*n));
    }

    cout << tree.read(*n) << " ";

    if (!tree.right_empty(*n)) {
        print_inorder(tree, tree.right(*n));
    }
}

// Helper function to print tree structure
template <class T>
void print_tree(bin_tree<T>& tree, node<T>* n, int level = 0) {
    if (n == nullptr) return;

    if (!tree.right_empty(*n)) {
        print_tree(tree, tree.right(*n), level + 1);
    }

    for (int i = 0; i < level; i++) cout << "    ";
    cout << tree.read(*n) << endl;

    if (!tree.left_empty(*n)) {
        print_tree(tree, tree.left(*n), level + 1);
    }
}

int main() {
    cout << "=== Binary Tree Tester ===" << endl << endl;

    // Test 1: Create empty tree
    cout << "Test 1: Create empty tree" << endl;
    bin_tree<int> tree1;
    cout << "Tree is empty: " << (tree1.empty() ? "YES" : "NO") << endl << endl;

    // Test 2: Insert root
    cout << "Test 2: Insert root with value 10" << endl;
    tree1.insert_root();
    tree1.write(10, *tree1.root());
    cout << "Tree is empty: " << (tree1.empty() ? "YES" : "NO") << endl;
    cout << "Root value: " << tree1.read(*tree1.root()) << endl << endl;

    // Test 3: Insert left and right children
    cout << "Test 3: Insert left child (5) and right child (15)" << endl;
    tree1.insert_left(tree1.root());
    //node<int> left_node = *tree1.left(*tree1.root());
    tree1.write(5, *tree1.left(*tree1.root()));
    tree1.insert_right(tree1.root());
		//node<int> right_node = *tree1.right(*tree1.root());
    tree1.write(15, *tree1.right(*tree1.root()));

    cout << "Root: " << tree1.read(*tree1.root()) << endl;
    cout << "Left child: " << tree1.read(*tree1.left(*tree1.root())) << endl;
    cout << "Right child: " << tree1.read(*tree1.right(*tree1.root())) << endl;
    cout << "Tree structure:" << endl;
    print_tree(tree1, tree1.root());
    cout << endl;

    //Test 4: Copy constructor
    cout << "Test 4: Copy constructor" << endl;
    bin_tree<int> tree2(tree1);
    cout << "Copied tree root: " << tree2.read(*tree2.root()) << endl;
    cout << "Original and copy are equal: " << (tree1 == tree2 ? "YES" : "NO") << endl << endl;

    // Test 5: Create another tree for insert_subtree
    cout << "Test 5: Create second tree" << endl;
    bin_tree<int> tree3;
    tree3.insert_root();
    tree3.write(10, *tree3.root());

    tree3.insert_left(tree3.root());
    tree3.write(5, *tree3.left(*tree3.root()));
    tree3.insert_right(tree3.root());
		tree3.write(12, *tree3.right(*tree3.root()));

    cout << "Tree3 structure:" << endl;
    print_tree(tree3, tree3.root());
    cout << endl;

		cout << "Check if trees are equal: ";
		cout << (tree1 == tree3) << endl;

    // Test 6: Insert subtree
    cout << "Test 6: Insert subtree (tree1 left, tree3 right)" << endl;
    tree1.insert_subtree(std::move(tree3));
    cout << "New tree structure after insert_subtree:" << endl;
    print_tree(tree1, tree1.root());
    cout << "In-order traversal: ";
    print_inorder(tree1, tree1.root());
    cout << endl << endl;

    // Test 7: Assignment operator
    cout << "Test 7: Assignment operator" << endl;
    bin_tree<int> tree4;
    tree4 = tree1;
		print_tree(tree4, tree4.root());
		print_tree(tree1, tree1.root());
    cout << "Assigned tree equals original: " << (tree4 == tree1 ? "YES" : "NO") << endl << endl;

    // Test 8: Check parent relationships
    cout << "Test 8: Parent relationships" << endl;
    const node<int>* current_root = tree1.root();
    if (!tree1.left_empty(*current_root)) {
        const node<int>* left_child = tree1.left(*current_root);
        const node<int>* parent_of_left = tree1.parent(*left_child);
        cout << "Left child value: " << tree1.read(*left_child) << endl;
        cout << "Parent of left child: " << tree1.read(*parent_of_left) << endl;
    }
    cout << endl;

    // Test 9: Delete subtree
    cout << "Test 9: Delete left subtree" << endl;
    node<int>* to_delete = tree1.left(*tree1.root());
    tree1.delete_subtree(to_delete);
    cout << "After deleting left subtree:" << endl;

    print_tree(tree1, tree1.root());
    cout << endl;

    cout << "=== All tests completed ===" << endl;

    return 0;
}
