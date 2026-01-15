#include <iostream>
#include "priority_queue.h"

int main() {
    // 1. Initialize a Priority Queue of Integers
    priority_queue<int> pq;

    std::cout << "--- Testing Insertion ---" << std::endl;
    int values[] = {50, 10, 20, 5, 30};
    for(int v : values) {
        std::cout << "Inserting: " << v << std::endl;
        pq.insert(v);
    }
		pq.print();
    // 2. Test top() and empty()
    if (!pq.empty()) {
        std::cout << "\nTop element (should be 5): " << pq.top() << std::endl;
    }

    // 3. Test Pop and Order (Should output in ascending order)
    std::cout << "\n--- Testing Pop (Min-Heap Order) ---" << std::endl;
    while (!pq.empty()) {
        std::cout << "Popping: " << pq.top() << std::endl;
        pq.pop();
    }

    // 4. Test Assignment
    std::cout << "\n--- Testing Assignmnt ---" << std::endl;
    pq.insert(100);
    pq.insert(50);

    priority_queue<int> pq_copy = pq; // Copy constructor
    std::cout << "Copy Top: " << pq_copy.top() << " (Expected 50)" << std::endl;

    if (pq == pq_copy) {
        std::cout << "Equality operator works!" << std::endl;
    }

		pq_copy.print();
		std::cout << std::endl;
		pq.print();

		priority_queue<int> p2(pq);
		std::cout << "\nTesting copy constructor" << std::endl;
		p2.print();
		std::cout << std::endl;
		pq.print();
    return 0;
}
