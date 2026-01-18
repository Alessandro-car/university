#include <iostream>
#include <string>
#include <stdexcept>
#include "hash_table.h"

int main() {
    // 1. Setup and Initialization
    hash_table<std::string, int> scores;
    std::cout << std::boolalpha; // Prints true/false instead of 1/0
    std::cout << "--- HASH TABLE INTEGRATION TEST ---" << std::endl;

    try {
        // 2. Test Empty and Initial State
        std::cout << "Table empty? " << scores.empty() << std::endl;

        // 3. Test Insertion
        std::cout << "\nInserting elements..." << std::endl;
        bucket<std::string, int> b1;
				b1.key = "Alice";
				b1.value = 95;

				bucket<std::string, int> b2;
				b2.key = "Bob";
				b2.value = 82;

				bucket<std::string, int> b3;
				b3.key = "Charlie";
				b3.value = 70;

        scores.insert(b1);
        scores.insert(b2);
        scores.insert(b3);

        std::cout << "Table empty now? " << scores.empty() << std::endl;
        std::cout << "Contains Alice? " << scores.contains("Alice") << std::endl;
        std::cout << "Alice Score: " << scores.find("Alice") << std::endl;

        // 4. Test Modify
        std::cout << "\nModifying Bob's score..." << std::endl;
        scores.modify("Bob", 88);
        std::cout << "Bob's New Score: " << scores.find("Bob") << std::endl;

        // 5. Test Erase (The 'Boolean Flag' check)
        // Erasing Bob creates a "hole" in the linear probing chain.
        // Charlie is likely located further down. If erase breaks the chain,
        // we won't be able to find Charlie.
        std::cout << "\nErasing Bob..." << std::endl;
        scores.erase("Bob");
        std::cout << "Contains Bob? " << scores.contains("Bob") << std::endl;
        std::cout << "Contains Charlie (Chain Check)? " << scores.contains("Charlie") << std::endl;

        // 6. Test Re-insertion into the "Deleted" slot
        std::cout << "\nRe-inserting Bob into the old slot..." << std::endl;
        bucket<std::string, int> b4;
				b4.key = "Bob"; b4.value = 50;
        scores.insert(b4);
        std::cout << "Bob's Re-inserted Score: " << scores.find("Bob") << std::endl;

        // 7. Test Exception Handling
        std::cout << "\nTesting error handling for missing key 'Dave'..." << std::endl;
        try {
            scores.find("Dave");
        } catch (const std::runtime_error& e) {
            std::cout << "Caught expected error: " << e.what() << std::endl;
        }

        std::cout << "\n--- ALL TESTS COMPLETED ---" << std::endl;

    } catch (const std::exception& e) {
        std::cerr << "CRITICAL ERROR during testing: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}
