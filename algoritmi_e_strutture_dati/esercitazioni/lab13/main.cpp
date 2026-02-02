#include <iostream>
#include "graph.h"
using namespace std;


int main() {
	graph<string> g;
	auto roma = g.ins_node("Roma");
	auto milano = g.ins_node("Milano");
	auto ny = g.ins_node("New York");
	auto bari = g.ins_node("Bari");
	auto frank = g.ins_node("Francoforte");

	g.ins_bow(roma, milano, 10);
	g.ins_bow(roma, bari, 5);
	g.ins_bow(milano, ny, 25);
	g.ins_bow(bari, frank, 15);
	g.ins_bow(frank, milano, 15);
	g.ins_bow(ny, frank, 22);
	cout << g.out_degree(roma) << endl;
	cout << g.in_degree(frank) << endl;
	cout << g.mean_out_degree() << endl;
	g.find_path(milano, frank);

	return 0;
}

