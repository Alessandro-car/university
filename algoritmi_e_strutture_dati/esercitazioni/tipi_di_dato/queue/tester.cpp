#include <iostream>
#include <string>
#include <cassert>

#include "queue.h"

void test_default_constructor() {
    std::cout << "\n=== Testing Default Constructor ===" << std::endl;
    queue<int> q;
    assert(q.empty() == true);
    assert(q.size() == 0);
    std::cout << "✓ Default constructor works" << std::endl;
}

void test_constructor_with_size() {
    std::cout << "\n=== Testing Constructor with Size ===" << std::endl;
    queue<int> q(20);
    assert(q.empty() == true);
    assert(q.size() == 0);
    std::cout << "✓ Constructor with size works" << std::endl;
}

void test_push_and_size() {
    std::cout << "\n=== Testing Push and Size ===" << std::endl;
    queue<int> q;

    q.push(10);
    assert(q.size() == 1);
    assert(q.empty() == false);

    q.push(20);
    q.push(30);
    assert(q.size() == 3);

    std::cout << "✓ Push and size work correctly" << std::endl;
}

void test_front_and_back() {
    std::cout << "\n=== Testing Front and Back ===" << std::endl;
    queue<int> q;

    q.push(10);
    q.push(20);
    q.push(30);

    assert(q.front() == 10);
    assert(q.back() == 30);

    std::cout << "✓ Front: " << q.front() << ", Back: " << q.back() << std::endl;
}

void test_pop() {
    std::cout << "\n=== Testing Pop ===" << std::endl;
    queue<int> q;

    q.push(10);
    q.push(20);
    q.push(30);
		q.print();
    std::cout << "Before pop - Size: " << q.size() << ", Front: " << q.front() << std::endl;

    q.pop();
    q.print();
		assert(q.size() == 2);
    assert(q.front() == 20);

    std::cout << "After pop - Size: " << q.size() << ", Front: " << q.front() << std::endl;

    q.pop();
    assert(q.size() == 1);
    assert(q.front() == 30);

    q.pop();
    assert(q.empty() == true);

    std::cout << "✓ Pop works correctly" << std::endl;
}

void test_copy_constructor() {
    std::cout << "\n=== Testing Copy Constructor ===" << std::endl;
    queue<int> q1;

    q1.push(10);
    q1.push(20);
    q1.push(30);

    queue<int> q2(q1);

    assert(q2.size() == q1.size());
    assert(q2.front() == q1.front());
    assert(q2.back() == q1.back());

    // Verify deep copy - modifying q2 shouldn't affect q1
    q2.push(40);
    assert(q2.size() == 4);
    assert(q1.size() == 3);

    std::cout << "✓ Copy constructor works (deep copy verified)" << std::endl;
}

void test_assignment_operator() {
    std::cout << "\n=== Testing Assignment Operator ===" << std::endl;
    queue<int> q1;
    q1.push(10);
    q1.push(20);
    q1.push(30);

    queue<int> q2;
    q2.push(100);

    q2 = q1;

    assert(q2.size() == q1.size());
    assert(q2.front() == q1.front());
    assert(q2.back() == q1.back());

    // Test self-assignment
    q2 = q2;
    assert(q2.size() == 3);

    std::cout << "✓ Assignment operator works" << std::endl;
}

void test_equality_operator() {
    std::cout << "\n=== Testing Equality Operator ===" << std::endl;
    queue<int> q1;
    q1.push(10);
    q1.push(20);
    q1.push(30);

    queue<int> q2;
    q2.push(10);
    q2.push(20);
    q2.push(30);

    assert(q1 == q2);

    q2.push(40);
    assert(!(q1 == q2));

    std::cout << "✓ Equality operator works" << std::endl;
}

void test_with_strings() {
    std::cout << "\n=== Testing with Strings ===" << std::endl;
    queue<std::string> q;

    q.push("Hello");
    q.push("World");
    q.push("Queue");

    assert(q.size() == 3);
    assert(q.front() == "Hello");
    assert(q.back() == "Queue");
		q.print();
    q.pop();
		q.print();
    assert(q.front() == "World");

    std::cout << "✓ Queue works with strings" << std::endl;
}

void test_print() {
    std::cout << "\n=== Testing Print ===" << std::endl;
    queue<int> q;

    std::cout << "Empty queue: ";
    q.print();

    q.push(10);
    q.push(20);
    q.push(30);
    q.push(40);

    std::cout << "Queue with elements: ";
    q.print();
}

void test_fifo_behavior() {
    std::cout << "\n=== Testing FIFO Behavior ===" << std::endl;
    queue<int> q;

    // Push elements 1 to 5
    for (int i = 1; i <= 5; ++i) {
        q.push(i * 10);
    }

    std::cout << "Pushed: 10, 20, 30, 40, 50" << std::endl;
    std::cout << "Popping in FIFO order: ";

    // Pop and verify FIFO order
    for (int i = 1; i <= 5; ++i) {
        assert(q.front() == i * 10);
        std::cout << q.front() << " ";
        q.pop();
    }
    std::cout << std::endl;

    assert(q.empty());
    std::cout << "✓ FIFO behavior verified" << std::endl;
}

void test_stress() {
    std::cout << "\n=== Stress Test ===" << std::endl;
    queue<int> q;

    // Push many elements
    for (int i = 0; i < 1000; ++i) {
        q.push(i);
    }

    assert(q.size() == 1000);
    assert(q.front() == 0);
    assert(q.back() == 999);

    // Pop half
    for (int i = 0; i < 500; ++i) {
        q.pop();
    }

    assert(q.size() == 500);
    assert(q.front() == 500);

    std::cout << "✓ Stress test passed (1000 elements)" << std::endl;
}

int main() {
    std::cout << "========================================" << std::endl;
    std::cout << "      QUEUE CLASS TESTER" << std::endl;
    std::cout << "========================================" << std::endl;

    try {
        test_default_constructor();
        test_constructor_with_size();
        test_push_and_size();
        test_front_and_back();
        test_pop();
        test_copy_constructor();
        test_assignment_operator();
        test_equality_operator();
        test_with_strings();
        test_print();
        test_fifo_behavior();
        test_stress();

        std::cout << "\n========================================" << std::endl;
        std::cout << "   ✓ ALL TESTS PASSED SUCCESSFULLY!" << std::endl;
        std::cout << "========================================" << std::endl;

    } catch (const std::exception& e) {
        std::cerr << "\n✗ TEST FAILED: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}
