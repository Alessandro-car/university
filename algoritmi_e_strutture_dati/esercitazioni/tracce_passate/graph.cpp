#include <iostream>
#include "graph.h"
using namespace std;


int main() {
	graph<int> g;
	auto roma = g.ins_node(10);
	auto milano = g.ins_node(5);
	auto ny = g.ins_node(11);
	auto bari = g.ins_node(3);
	auto frank = g.ins_node(12);

	g.ins_edge(roma, milano, 10);
	g.ins_edge(roma, bari, 5);
	g.ins_edge(milano, ny, 25);
	g.ins_edge(bari, frank, 15);
	g.ins_edge(frank, milano, 15);
	g.ins_edge(ny, frank, 22);
	cout << g.sum_path(28, milano, frank) << endl;
	return 0;
}
