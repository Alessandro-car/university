#include <iostream>
#include <cassert>
#include "dequeue.h" // Assuming your class is in this file

void test_dequeue() {
    std::cout << "Starting Dequeue Tests..." << std::endl;

    dequeue<int> dq;

    // 1. Test Initial State
    assert(dq.empty());
    assert(dq.size() == 0);

    // 2. Test Push Back
    dq.push_back(10);
    dq.push_back(20);
    // State: [10, 20]
    assert(dq.size() == 2);
    assert(dq.front() == 10);
    assert(dq.back() == 20);

    // 3. Test Push Front
    dq.push_front(5);
    dq.push_front(1);
    // State: [1, 5, 10, 20]
    assert(dq.size() == 4);
    assert(dq.front() == 1);
    assert(dq.back() == 20);

    // 4. Test Pop Front
    dq.pop_front();
    // State: [5, 10, 20]
    assert(dq.size() == 3);
    assert(dq.front() == 5);

    // 5. Test Pop Back
    dq.pop_back();
    // State: [5, 10]
    assert(dq.size() == 2);
    assert(dq.back() == 10);

    // 6. Test Equality Operator & Copy Constructor
    dequeue<int> dq2 = dq; // Copy constructor
    assert(dq2 == dq);
    assert(dq2.front() == 5);

    // 7. Test Assignment Operator
    dequeue<int> dq3;
    dq3 = dq;
    assert(dq3 == dq);

    // 8. Emptying the Deque
    dq.pop_front();
    dq.pop_front();
    assert(dq.empty());
    assert(dq.size() == 0);

    std::cout << "All tests passed successfully!" << std::endl;
}

int main() {
    test_dequeue();
    return 0;
}
