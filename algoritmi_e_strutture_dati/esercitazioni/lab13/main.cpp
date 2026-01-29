#include <iostream>
#include "graph.h"
using namespace std;


int main() {
	graph<string> g;
	g.ins_node("Roma");
	g.ins_node("Milano");
	g.ins_node("New York");
	g.ins_node("Bari");
	g.ins_node("Francoforte");

	g.ins_bow("Roma", "Milano", 10);
	g.ins_bow("Roma", "Bari", 5);
	g.ins_bow("Milano", "New York", 25);
	g.ins_bow("Bari", "Francoforte", 15);
	g.ins_bow("Francoforte", "Milano", 15);
	g.ins_bow("New York", "Francoforte", 22);
	const string& label = "Milano";
	cout << g.out_degree(label) << endl;
	cout << g.in_degree(label) << endl;
	cout << g.mean_out_degree() << endl;
	g.find_path("Milano", "Francoforte");
	return 0;
}
