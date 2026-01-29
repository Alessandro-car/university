#include <iostream>
#include <string>
#include <stdexcept>
#include "graph.h"

void print_separator(const std::string& title) {
    std::cout << "\n--- " << title << " ---" << std::endl;
}

int main() {
    try {
        print_separator("Testing Dynamic Node Insertion");
        graph<std::string> flight_plan;

        // Inseriamo i nodi
        flight_plan.ins_node("Bari");   // Diventerà indice 0
        flight_plan.ins_node("Rome");   // Diventerà indice 1
        flight_plan.ins_node("London"); // Diventerà indice 2
        flight_plan.ins_node("Paris");  // Diventerà indice 3

        // Poiché le label non sono univoche, recuperiamo i nodi dalla lista interna
        // che garantisce di puntare agli oggetti corretti tramite il loro ID/posizione.
        myvec::vector<Node<std::string>> nodes = flight_plan.list_node();

        Node<std::string> n_bari   = nodes[0];
        Node<std::string> n_rome   = nodes[1];
        Node<std::string> n_london = nodes[2];
        Node<std::string> n_paris  = nodes[3];

        print_separator("Testing Edge (Bow) Creation");
        // Ora passiamo gli oggetti Node, non le stringhe
        flight_plan.ins_bow(n_bari, n_rome, 450);
        flight_plan.ins_bow(n_rome, n_london, 1400);
        flight_plan.ins_bow(n_london, n_paris, 340);
        flight_plan.ins_bow(n_bari, n_london, 1800);

        flight_plan.print_mat();

        std::cout << "Weight Bari -> Rome: " << flight_plan.read_weight(n_bari, n_rome) << " (Expected: 450)" << std::endl;

        print_separator("Testing Adjacent Nodes");
        // Adiacenti di Bari
        auto adj_to_bari = flight_plan.adjacent(n_bari);
        std::cout << "Finding cities reachable from Bari (" << n_bari.get_label() << "):" << std::endl;
        for (size_t i = 0; i < adj_to_bari.size(); ++i) {
            std::cout << " - " << flight_plan.read_label(adj_to_bari[i]) << " (ID: " << adj_to_bari[i].get_id() << ")" << std::endl;
        }

        print_separator("Testing Non-Unique Labels");
        flight_plan.ins_node("Bari"); // Ora è permesso!
        std::cout << "Total nodes: " << flight_plan.n_nodes() << " (Expected: 5)" << std::endl;

    } catch (const std::exception& e) {
        std::cerr << "Standard Exception: " << e.what() << std::endl;
    } catch (...) {
        std::cerr << "An unknown error occurred." << std::endl;
    }

    print_separator("Testing Finished");
    return 0;
}
