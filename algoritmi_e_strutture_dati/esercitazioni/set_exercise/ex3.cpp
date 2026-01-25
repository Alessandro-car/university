#include <iostream>
#include <cassert>
#include "ex3.h"

using std::cout;
using std::endl;

void test_basics() {
    cout << "--- Testing Basic Functionality ---" << endl;
    set<int> s;

    // Test Insertion
    s.insert(10);
    s.insert(20);
    s.insert(10); // Duplicate

    cout << "Set after inserting 10, 20, 10: ";
    s.print();

    // Test Contain
    assert(s.contain(10) != -1);
    assert(s.contain(99) == -1);
}

void test_set_theory() {
    cout << "\n--- Testing Set Operations ---" << endl;
    set<int> A;
    set<int> B;

    A.insert(1); A.insert(2); A.insert(3);
    B.insert(3); B.insert(4); B.insert(5);

    cout << "Set A: "; A.print();
    cout << "Set B: "; B.print();

    set<int> inter = A.intersection(B);
    cout << "Intersection (A n B): "; inter.print();

    set<int> uni = A.union_set(B);
    cout << "Union (A u B): "; uni.print();

    set<int> diff = A.difference(B);
    cout << "Difference (A - B): "; diff.print();
}

int main() {
    test_basics();
    test_set_theory();

    cout << "\nTests complete." << endl;
    return 0;
}
