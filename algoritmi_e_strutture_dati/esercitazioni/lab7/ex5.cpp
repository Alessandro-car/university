#include <iostream>
#include <sstream>
#include <cassert>
#include "ex5.h"

void run_polynomial_test() {
    std::cout << "--- Testing Polynomial Class ---\n";

    // Scenario: P1 = 2x^2 + 3x + 4
    // Format: [Degree] [coeff_x^0] [coeff_x^1] [coeff_x^2] ...
    // Note: Your input loop inserts into m_pol using index i,
    // implying index 0 is the constant term.

    std::stringstream input1("2 4 3 2");
    polynomial p1;
    p1.input(input1);

    std::stringstream input2("1 1 5"); // P2 = 5x + 1
    polynomial p2;
    p2.input(input2);
		p2.output(std::cout);
		std::cout << std::endl;
    // --- Test 1: Degree Check ---
    assert(p1.grado() == 2);
    std::cout << "Test 1: Degree logic correct.\n";

    // --- Test 2: Output Formatting ---
    std::cout << "P1 Output: ";
    p1.output(std::cout);
    std::cout << "\n";

    // --- Test 3: Value Retrieval ---
    // Coefficient of x^1 in p1 should be 3
    assert(p1.valore(1) == 3);
    std::cout << "Test 3: Coefficient retrieval correct.\n";

    // --- Test 4: Addition ---
    // (2x^2 + 3x + 4) + (5x + 1) = 2x^2 + 8x + 5
    polynomial pSum = p1.somma(p2);
    std::cout << "Sum (P1 + P2): ";
    pSum.output(std::cout);
    std::cout << "\n";

		//TODO: Vedere moltiplicazione
		polynomial mul = p1.moltiplica(p2);
		std::cout << "Mul (P1 * P2): ";
		mul.output(std::cout);
    std::cout << std::endl;
		std::cout << "--- All Tests Passed! ---\n\n";
}

int main() {
    run_polynomial_test();
    return 0;
}
