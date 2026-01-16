#include <iostream>
#include <vector>
#include "bst.h"

void print_test_result(std::string name, bool condition) {
    std::cout << "[TEST] " << name << ": " << (condition ? "PASSED ✅" : "FAILED ❌") << std::endl;
}


int main() {
    bst<int> tree;

    // 1. Test Empty
    print_test_result("Tree initially empty", tree.empty() == true);

    // 2. Test Insertions
    // Creating a tree: 50 (root), 30 (left), 70 (right), 20, 40, 60, 80
    std::vector<int> keys = {50, 30, 70, 20, 40, 60, 80};
    for (int k : keys) {
        tree.insert(k);
    }
    print_test_result("Tree not empty after insert", tree.empty() == false);

    // 3. Test Search
    int val = 40;
    node<int>* found = tree.search(val);
    print_test_result("Search for existing key 40", found != nullptr && tree.read(*found) == 40);

    int missing = 99;
    print_test_result("Search for non-existing key 99", tree.search(missing) == nullptr);

    // 4. Test Min/Max
    print_test_result("Minimum is 20", tree.read(*tree.minimum()) == 20);
    print_test_result("Maximum is 80", tree.read(*tree.maximum()) == 80);

    // 5. Test Erase Case 1: Leaf Node (20)
    int leaf = 20;
    tree.erase(leaf);
    print_test_result("Erase leaf node 20", tree.search(leaf) == nullptr);
    print_test_result("Min updated to 30", tree.read(*tree.minimum()) == 30);

    // 6. Test Erase Case 2: One Child (30)
    // After 20 is gone, 30 only has child 40
    int one_child = 30;
    tree.erase(one_child);
    print_test_result("Erase node with one child 30", tree.search(one_child) == nullptr);
    print_test_result("Child 40 still exists", tree.search(val) != nullptr);

    // 7. Test Erase Case 3: Two Children (Root: 50)
    int root_val = 50;
    tree.erase(root_val);
    print_test_result("Erase root with two children 50", tree.search(root_val) == nullptr);

    // Check if new root/structure is valid (successor 60 should have taken its place)
    auto new_min = tree.minimum();
    print_test_result("Tree structure intact after root erase", tree.read(*new_min) == 40);

    std::cout << "\nAll tests completed." << std::endl;

    return 0;
}
