#include <iostream>
#include <cassert>
#include <stdexcept>
#include "stack.h"

void test_unique_stack() {
    std::cout << "Starting Unique Stack Tests..." << std::endl;

    stack<int> s;

    // 1. Test Initial State
    assert(s.empty());
    assert(s.size() == 0);

    // 2. Test Basic Push & Top
    s.push(10);
    s.push(20);
    s.push(30);
    assert(s.size() == 3);
    assert(s.top() == 30); // LIFO: Last in is at the top

    // 3. Test Duplicate Prevention (The Core Feature)
    bool exceptionThrown = false;
    try {
        s.push(20); // 20 is already in the stack
    } catch (const std::runtime_error& e) {
        exceptionThrown = true;
        std::cout << "Caught expected duplicate error: " << e.what() << std::endl;
    }
    assert(exceptionThrown);
    assert(s.size() == 3); // Size should not have increased

    // 4. Test Pop
    s.pop();
    assert(s.top() == 20);
    assert(s.size() == 2);

    // 5. Test Re-insertion after Pop
    // Now that 30 is gone, we should be able to push it again
    s.push(30);
    assert(s.top() == 30);
    assert(s.size() == 3);

    // 6. Test Assignment and Equality
    stack<int> s2;
    s2 = s;
    assert(s2 == s);
    assert(s2.top() == 30);

    std::cout << "All Unique Stack tests passed!" << std::endl;
}

int main() {
    test_unique_stack();
    return 0;
}
