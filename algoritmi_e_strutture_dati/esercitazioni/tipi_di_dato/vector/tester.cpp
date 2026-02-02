#include <iostream>
#include <string>
#include "vector.h"   // <-- your custom vector header


template<typename T>
void print_vector(const myvec::vector<T>& v, const std::string& name)
{
    std::cout << name << " (size=" << v.size()
              << ", cap=" << v.capacity() << "): ";

    for (const auto& x : v)
        std::cout << "[" << x << "]";


    std::cout << "\n";
}

void test_int_vector() {
    std::cout << "\n===== TEST int vector =====\n";
    myvec::vector<int> v1;
		v1.push_back(10);
    v1.push_back(20);
    v1.push_back(30);
    print_vector(v1, "v1 after push_back");

    v1.pop_back();
    print_vector(v1, "v1 after pop_back");

    v1.insert(v1.begin() + 1, 99);
    print_vector(v1, "v1 after insert");

    v1.erase(v1.begin());
    print_vector(v1, "v1 after erase first");

    v1.erase(v1.begin(), v1.end());
    print_vector(v1, "v1 after erase all");
}

void test_string_vector()
{
    std::cout << "\n===== TEST string vector =====\n";

    myvec::vector<std::string> vs{"Hello", "World", "Vector"};
    print_vector(vs, "vs initial");

    vs.push_back("Test");
    print_vector(vs, "vs after push_back");

    vs.insert(vs.begin() + 1, "Insert");
    print_vector(vs, "vs after insert");

    vs.erase(vs.begin() + 2);
    print_vector(vs, "vs after erase middle");

    vs.erase(vs.begin(), vs.begin() + 2);
    print_vector(vs, "vs after erase(first, first+2)");

    vs.resize(5, "Fill");
    print_vector(vs, "vs after resize(5, Fill)");

    vs.resize(2);
    print_vector(vs, "vs after resize(2)");

    vs.clear();
    print_vector(vs, "vs after clear()");
}

void test_comparison()
{
    std::cout << "\n===== TEST comparison =====\n";

    myvec::vector<int> a{1,2,3};
    myvec::vector<int> b{1,2,3};
    myvec::vector<int> c{1,2,4};

    std::cout << "a == b? " << (a == b) << "\n";
    std::cout << "a != c? " << (a != c) << "\n";
    std::cout << "b != c? " << (b != c) << "\n";
}

int main()
{
    test_int_vector();
    test_string_vector();
    test_comparison();

    std::cout << "\nAll tests completed.\n";
    return 0;
}

