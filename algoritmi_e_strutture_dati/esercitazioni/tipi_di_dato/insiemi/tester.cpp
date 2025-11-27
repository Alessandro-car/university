#include "set.h"
#include <iostream>

int main() {
    // Test 1: Basic insert and contains
    std::cout << "Test 1: Basic insert and contains" << std::endl;
    set<int> set1;
    set1.insert(1);
    set1.insert(2);
    set1.insert(3);
    std::cout << "set 1: ";
    set1.print();
    // Test 2: Duplicate insert
    std::cout << "Test 2: Duplicate insert" << std::endl;
    bool inserted = set1.insert(2);
    std::cout << "Inserting duplicate 2: " << (inserted ? "Success" : "Failed (already exists)") << std::endl;
    std::cout << "Size after duplicate: " << set1.size() << "\n" << std::endl;

    // Test 3: Remove element
    std::cout << "Test 3: Remove element" << std::endl;
    set1.erase(2);
    std::cout << "After removing 2: ";
    set1.print();
    std::cout << "Size: " << set1.size() << "\n" << std::endl;

    // Test 4: Create second set
    std::cout << "Test 4: Create second set" << std::endl;
    set<int> set2;
    set2.insert(3);
    set2.insert(4);
    set2.insert(5);
    std::cout << "set 2: ";
    set2.print();

		//TODO: Check union, intersection, difference and subset

    // Test 5: Union
    std::cout << "\nTest 5: Union" << std::endl;
    set<int> unionset = set1.union_set(set2);
    std::cout << "set 1: ";
    set1.print();
    std::cout << "set 2: ";
    set2.print();
    std::cout << "Union: ";
    unionset.print();

    // Test 6: Intersection
    std::cout << "\nTest 6: Intersection" << std::endl;
    set<int> intersectionset = set1.intersection(set2);
    std::cout << "Intersection: ";
    intersectionset.print();

    // Test 7: Difference
    std::cout << "\nTest 7: Difference" << std::endl;
    set<int> differenceset = set1.difference(set2);
    std::cout << "Difference (set1 - set2): ";
    differenceset.print();

    // Test 8: Subset check
    std::cout << "\nTest 8: Subset check" << std::endl;
    set<int> set3;
    set3.insert(3);
    set3.insert(4);
    std::cout << "set 3: ";
    set3.print();
    std::cout << "Is set 3 subset of set 2? " << (set3.is_subset(set2) ? "Yes" : "No") << std::endl;
    std::cout << "Is set 2 subset of set 3? " << (set2.is_subset(set3) ? "Yes" : "No") << std::endl;

    // Test 9: Clear
    std::cout << "\nTest 9: Clear" << std::endl;
    std::cout << "set 3 before clear: ";
    set3.print();
    set3.clear();
    std::cout << "set 3 after clear: ";
    set3.print();
    std::cout << "Is empty? " << (set3.empty() ? "Yes" : "No") << std::endl;

    // Test 11: String set
    std::cout << "\nTest 11: String set" << std::endl;
    set<std::string> stringset;
    stringset.insert("apple");
    stringset.insert("banana");
    stringset.insert("cherry");
    std::cout << "String set: ";
    stringset.print();
    std::cout << "Contains 'banana': " << (stringset.contain("banana") ? "Yes" : "No") << std::endl;

    std::cout << "\n======================================" << std::endl;
    std::cout << "All tests completed!" << std::endl;
    std::cout << "======================================" << std::endl;

    return 0;
}
