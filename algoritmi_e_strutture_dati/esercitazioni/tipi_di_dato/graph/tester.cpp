#include <iostream>
#include <stdexcept>
#include <string>
#include "graph.h"

void print_separator(const std::string& title) {
    std::cout << "\n--- " << title << " ---" << std::endl;
}

int main() {
    try {
        // 1. Test Constructor and n_nodes
        print_separator("Testing Constructor");
        graph<std::string> g(3);
        std::cout << "Graph(3) created. Nodes: " << g.n_nodes() << " (Expected: 3)" << std::endl;

        // 2. Test Node Insertion (Dynamic Growth)
        print_separator("Testing Dynamic Node Insertion");
        graph<std::string> flight_plan;
        flight_plan.ins_node("Bari");
        flight_plan.ins_node("Rome");
        flight_plan.ins_node("London");
        flight_plan.ins_node("Paris");
        std::cout << "Nodes added: " << flight_plan.n_nodes() << " (Expected: 4)" << std::endl;

        // 3. Test Edge (Bow) Insertion
        print_separator("Testing Edge (Bow) Creation");
        // Connecting cities with distances (weights)
        flight_plan.ins_bow("Bari", "Rome", 450);
        flight_plan.ins_bow("Rome", "London", 1400);
        flight_plan.ins_bow("London", "Paris", 340);
        flight_plan.ins_bow("Bari", "London", 1800);

				flight_plan.print_mat();

        std::cout << "Weight Bari -> Rome: " << flight_plan.read_weight("Bari", "Rome") << " (Expected: 450)" << std::endl;
        std::cout << "Weight Rome -> London: " << flight_plan.read_weight("Rome", "London") << " (Expected: 1400)" << std::endl;

        // 4. Test Adjacency
        print_separator("Testing Adjacent Nodes");
        std::cout << "Finding cities reachable from Bari..." << std::endl;
        auto adj_to_bari = flight_plan.adjacent("Bari");
        for (size_t i = 0; i < adj_to_bari.size(); ++i) {
            // Note: read_label takes a node object
            std::cout << " - " << flight_plan.read_label(adj_to_bari[i]) << std::endl;
        }

        // 5. Test Copy Constructor (Deep Copy Verification)
        print_separator("Testing Deep Copy");
        graph<std::string> network_copy(flight_plan);
        std::cout << "Copy n_nodes: " << network_copy.n_nodes() << " (Expected: 4)" << std::endl;

        if (network_copy == flight_plan) {
            std::cout << "Equality Check: SUCCESS (Copy matches original)" << std::endl;
        }

        // 6. Test Error Handling
        print_separator("Testing Error Handling");
        try {
            flight_plan.ins_node("Bari"); // Duplicate
        } catch (const char* e) {
            std::cout << "Caught expected error: " << e << std::endl;
        }

        try {
            flight_plan.read_weight("Bari", "New York"); // Missing node
        }	catch (const char* e) {
            std::cout << "Caught expected error: " << e << std::endl;
        }

    } catch (const std::exception& e) {
        std::cerr << "Standard Exception: " << e.what() << std::endl;
    } catch (...) {
        std::cerr << "An unknown error occurred. (Likely a memory/pointer issue)" << std::endl;
    }

    print_separator("Testing Finished");
    return 0;
}
