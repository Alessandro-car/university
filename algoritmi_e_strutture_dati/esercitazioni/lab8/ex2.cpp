#include <iostream>
#include "math.h"
#include "../tipi_di_dato/dictionary/hash_table.h"
#include "../tipi_di_dato/insiemi/set.h"

bool check_subset(set<int> s1, set<int> s2) {
	hash_table<int, bool> d;
	size_t i = s2.begin();
	while (!s2.end(i)) {
		bucket<int, bool> b;
		b.key = s2.read(i);
		b.value = true;
		b.active = true;
		d.insert(b);
		i = s2.next(i);
	}

	i = s1.begin();
	while (!s1.end(i)) {
		if (!d.contains(s1.read(i)))
			return false;
		i = s1.next(i);
	}
	return true;
}

int main() {
	set<int> s1;
	s1.insert(10);
	s1.insert(20);
	s1.insert(31);

	set<int> s2;
	s2.insert(10);
	s2.insert(20);
	s2.insert(30);
	if (s1.size() == s2.size() && check_subset(s1, s2))
		std::cout << "I due insiemi sono identici" << std::endl;
	else if (check_subset(s1, s2))
		std::cout << "S1 e' un sottinsieme di S2" << std::endl;
	else
		std::cout << "S1 non e' un sottinsieme di S2" << std::endl;
	return 0;
}
