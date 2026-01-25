#include <iostream>
#include <cassert>
#include "ex5.h"


void test_symmetric_difference() {
    // Setup sets
    set<int> setA; // {1, 2, 3}
    setA.insert(1);
    setA.insert(2);
    setA.insert(3);
		setA.print();

    set<int> setB; // {3, 4, 5}
    setB.insert(3);
    setB.insert(4);
    setB.insert(5);
		setB.print();
    // Execute
    set<int> result = setA.simmetric_difference(setB);
		result.print();
    // Verify
    // Expected result: {1, 2, 4, 5} - '3' is removed because it's in the intersection
    assert(result.size() == 4);
    assert(result.contain(1) != -1);
    assert(result.contain(2) != -1);
    assert(result.contain(4) != -1);
    assert(result.contain(5) != -1);
    assert(result.contain(3) == -1);

    std::cout << "Symmetric Difference Test Passed!" << std::endl;
}

void test_identical_sets() {
    set<int> setA;
    setA.insert(10);

    set<int> result = setA.simmetric_difference(setA);

    // A sym_diff A should always be empty
    assert(result.size() == 0);
    std::cout << "Identical Sets Test Passed!" << std::endl;
}
int main() {
	test_symmetric_difference();
	test_identical_sets();
	return 0;
}
