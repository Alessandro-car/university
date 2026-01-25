#include <iostream>
#include <string>
#include "ex1.h" // Ensure this matches your filename

int main() {
    // 1. Initialization and Insertion
    cout << "--- Testing Insertion and Uniqueness ---" << endl;
    set<int> setA;
    setA.insert(10);
    setA.insert(20);
    setA.insert(30);
    setA.insert(20); // Duplicate: should not be added

    cout << "Set A (should be 10, 20, 30): ";
    setA.print();
    cout << "Size of A: " << setA.size() << " (Expected: 3)" << endl;

    // 2. Testing Contains and Erase
    cout << "\n--- Testing Search and Erase ---" << endl;
    if (setA.contain(20)) {
        cout << "20 is in the set." << endl;
    }
    setA.erase(20);
    cout << "Set A after erasing 20: ";
    setA.print();

    // 3. Set Operations Setup
    set<int> setB;
    setB.insert(30);
    setB.insert(40);
    setB.insert(50);

    cout << "\n--- Set Operations ---" << endl;
    cout << "Set A: "; setA.print(); // {10, 30}
    cout << "Set B: "; setB.print(); // {30, 40, 50}

    // Union
    set<int> u = setA.union_set(setB);
    cout << "Union (A U B): "; u.print(); // {10, 30, 40, 50}

    // Intersection
    set<int> i = setA.intersection(setB);
    cout << "Intersection (A n B): "; i.print(); // {30}

    // Difference
    set<int> d = setA.difference(setB);
    cout << "Difference (A - B): "; d.print(); // {10}

    // 4. Subset and Equality
    cout << "\n--- Boolean Operations ---" << endl;
    set<int> setC;
    setC.insert(30);

    cout << "Set C: "; setC.print();
    cout << "Is C subset of A? " << (setC.is_subset(setA) ? "Yes" : "No") << endl;
    cout << "Is B subset of A? " << (setB.is_subset(setA) ? "Yes" : "No") << endl;

    // 5. Template check with Strings
    cout << "\n--- Testing with Strings ---" << endl;
    set<std::string> setStr;
    setStr.insert("Apple");
    setStr.insert("Banana");
    setStr.insert("Apple");
    setStr.print();

    return 0;
}
