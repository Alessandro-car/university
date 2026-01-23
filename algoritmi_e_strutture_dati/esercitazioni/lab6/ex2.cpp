#include "ex2.h"
#include <iostream>
#include <string>
#include <cassert>

using std::cout;
using std::endl;

void testMultipleStack() {
    std::cout << "Avvio test MultipleStack..." << std::endl;

    size_t n = 5;
    MultipleStack<int> ms(n);

    ms.push(10, 0); // Stack 0: [10]
    ms.push(20, 0); // Stack 0: [10, 20]
    ms.push(50, 4); // Stack 4: [50]

    assert(ms.top(0) == 20);
    assert(ms.top(4) == 50);

    ms.pop(0);      // Stack 0: [10]
    assert(ms.top(0) == 10);

    MultipleStack<std::string> ms_str(2);
    ms_str.push("Primo", 1);
    ms_str.push("Secondo", 1);
    assert(ms_str.top(1) == "Secondo");

    bool exceptionCaught = false;
    try {
        ms.top(10); // Indice inesistente
    } catch (const std::out_of_range& e) {
        exceptionCaught = true;
    }
    assert(exceptionCaught);

    std::cout << "--- Tutti i test sono stati superati con successo! ---" << std::endl;
}

int main() {
    testMultipleStack();
    return 0;
}
