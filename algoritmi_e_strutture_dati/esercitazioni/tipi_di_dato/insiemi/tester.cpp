#include <iostream>
#include <cassert>
#include "set.h" // Ensure this path is correct

using std::cout;
using std::endl;

void test_basic_logic() {
    cout << "--- Testing Basics (Insert, Erase, Size) ---" << endl;
    set<int> s;
    assert(s.empty());

    s.insert(1);
    s.insert(2);
    s.insert(3);
    s.insert(1); // Duplicate - should fail silently or return false

    cout << "Set S (expected [1][2][3]): ";
    s.print();
    assert(s.size() == 3);

    s.erase(2);
    cout << "Set S after erasing 2: ";
    s.print();
    assert(s.size() == 2);
    assert(s.contain(2) == -1);
}

void test_set_operations() {
    cout << "\n--- Testing Set Theory Operations ---" << endl;
    set<int> A;
    set<int> B;

    // A = {1, 2, 3}
    A.insert(1);
		A.insert(2);
		A.insert(3);
		cout << "Set A: ";
		A.print();
    // B = {3, 4, 5}
    B.insert(3);
		B.insert(4);
		B.insert(5);
		cout << "Set B: ";
		B.print();

    // Union: {1, 2, 3, 4, 5}
    set<int> U = A.union_set(B);
    cout << "Union (A U B): "; U.print();
    assert(U.size() == 5);

    // Intersection: {3}
    set<int> I = A.intersection(B);
    cout << "Intersection (A n B): ";
		I.print();
    assert(I.size() == 1);
    assert(I.contain(3) != -1);

    // Difference: {1, 2}
    set<int> D = A.difference(B);
    cout << "Difference (A - B): "; D.print();
    assert(D.size() == 2);
    assert(D.contain(1) != -1 && D.contain(3) == -1);
}

void test_boolean_logic() {
    cout << "\n--- Testing Subsets and Equality ---" << endl;
    set<int> A;
    set<int> B;

    A.insert(10);
		A.insert(20);
    cout << "Set A: ";
		A.print();

		B.insert(10);
		B.insert(20);
		cout << "Set B: ";
		B.print();
    assert(A == B);

    B.insert(30);
    // A is subset of B, but B is not subset of A
    assert(A.is_subset(B) == true);
    assert(B.is_subset(A) == false);
    assert(!(A == B));

    cout << "Boolean logic tests passed!" << endl;
}

int main() {
    try {
        test_basic_logic();
        test_set_operations();
        test_boolean_logic();

        cout << "\nALL TESTS PASSED SUCCESSFULLY!" << endl;
    } catch (const std::exception& e) {
        std::cerr << "Test failed with exception: " << e.what() << endl;
    }
    return 0;
}
