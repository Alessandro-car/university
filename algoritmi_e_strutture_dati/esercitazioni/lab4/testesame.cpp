#include "esame.h"
#include <string>
#include <iostream>

using std::cout;
using std::endl;
using std::cin;
using std::string;

int main() {
	esame esame1("ASD", 24);
	cout << esame1.get_voto() << endl;
	cout << esame1.is_sostenuto() << endl;
	cout <<  esame1.get_esame() << endl;
	esame1.set_esame("AESO");
	esame1.set_voto(30);
	cout << esame1.get_voto() << endl;
	cout << esame1.is_sostenuto() << endl;
	cout <<  esame1.get_esame() << endl;
	return 0;
}
