#include <iostream>
#include <string>
#include "ntree.h"

void test_ntree() {
    std::cout << "=== N-ary Tree Tester ===" << std::endl << std::endl;

    // Test 1: Constructor and empty()
    std::cout << "Test 1: Constructor and empty()" << std::endl;
    ntree<int> tree1;
    std::cout << "Tree is empty: " << (tree1.empty() ? "YES" : "NO") << std::endl;
    std::cout << "Root is null: " << (tree1.root() == nullptr ? "YES" : "NO") << std::endl;
    std::cout << std::endl;

    // Test 2: Insert root
    std::cout << "Test 2: Insert root" << std::endl;
    tree1.insert_root();
    std::cout << "Tree is empty after insert_root: " << (tree1.empty() ? "YES" : "NO") << std::endl;
    node<int>* root = tree1.root();
    std::cout << "Root is null: " << (root == nullptr ? "YES" : "NO") << std::endl;
    std::cout << std::endl;

    // Test 3: Write and read
    std::cout << "Test 3: Write and read" << std::endl;
    tree1.write(10, *root);
    std::cout << "Root value: " << tree1.read(*root) << std::endl;
    std::cout << std::endl;

    // Test 4: Leaf test
    std::cout << "Test 4: Leaf test" << std::endl;
    std::cout << "Root is leaf: " << (tree1.leaf(*root) ? "YES" : "NO") << std::endl;
    std::cout << std::endl;

    // Test 5: Build a more complex tree
    std::cout << "Test 5: Building complex tree structure" << std::endl;
    ntree<int> subtree1, subtree2, subtree3;

    subtree1.insert_root();
    subtree1.write(20, *subtree1.root());

    subtree2.insert_root();
    subtree2.write(30, *subtree2.root());

    subtree3.insert_root();
    subtree3.write(40, *subtree3.root());

    tree1.insert_subtree(root, root, subtree1);
    tree1.insert_subtree(tree1.first_son(*root), root, subtree2);
    tree1.insert_subtree(tree1.next_sibling(*tree1.first_son(*root)), root, subtree3);

    std::cout << "Root is now leaf: " << (tree1.leaf(*root) ? "YES" : "NO") << std::endl;
    std::cout << std::endl;

    // Test 6: Navigate children
    std::cout << "Test 6: Navigate children" << std::endl;
    node<int>* first_child = tree1.first_son(*root);
    if (first_child) {
        std::cout << "First child value: " << tree1.read(*first_child) << std::endl;
        std::cout << "First child is last sibling: " << (tree1.last_sibling(*first_child) ? "YES" : "NO") << std::endl;

        node<int>* second_child = tree1.next_sibling(*first_child);
        if (second_child) {
            std::cout << "Second child value: " << tree1.read(*second_child) << std::endl;

            node<int>* third_child = tree1.next_sibling(*second_child);
            if (third_child) {
                std::cout << "Third child value: " << tree1.read(*third_child) << std::endl;
                std::cout << "Third child is last sibling: " << (tree1.last_sibling(*third_child) ? "YES" : "NO") << std::endl;
            }
        }
    }
    std::cout << std::endl;

    // Test 7: Parent test
    std::cout << "Test 7: Parent test" << std::endl;
    if (first_child) {
        node<int>* parent_node = tree1.parent(*first_child);
        if (parent_node) {
            std::cout << "Parent of first child: " << tree1.read(*parent_node) << std::endl;
        }
    }
    std::cout << std::endl;

    // Test 8: Copy constructor
    std::cout << "Test 8: Copy constructor" << std::endl;
    ntree<int> tree2(tree1);
    std::cout << "Copied tree root value: " << tree2.read(*tree2.root()) << std::endl;
    std::cout << "Trees are equal: " << (tree1 == tree2 ? "YES" : "NO") << std::endl;
    std::cout << std::endl;

    // Test 9: Assignment operator
    std::cout << "Test 9: Assignment operator" << std::endl;
    ntree<int> tree3;
    tree3 = tree1;
    std::cout << "Assigned tree root value: " << tree3.read(*tree3.root()) << std::endl;
    std::cout << "Trees are equal: " << (tree1 == tree3 ? "YES" : "NO") << std::endl;
    std::cout << std::endl;

    // Test 10: Delete subtree
    std::cout << "Test 10: Delete subtree" << std::endl;
    node<int>* child_to_delete = tree1.first_son(*tree1.root());
    if (child_to_delete) {
        std::cout << "Deleting subtree with value: " << tree1.read(*child_to_delete) << std::endl;
        tree1.delete_subtree(child_to_delete);
        std::cout << "First child after deletion: " << tree1.read(*tree1.first_son(*tree1.root())) << std::endl;
    }
    std::cout << std::endl;

    // Test 11: Test with strings
    std::cout << "Test 11: Testing with strings" << std::endl;
    ntree<std::string> string_tree;
    string_tree.insert_root();
    string_tree.write("Root", *string_tree.root());
    std::cout << "String tree root: " << string_tree.read(*string_tree.root()) << std::endl;
    std::cout << std::endl;

    std::cout << "=== All tests completed ===" << std::endl;
}

int main() {
    try {
        test_ntree();
    } catch (const std::exception& e) {
        std::cerr << "Exception caught: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}
