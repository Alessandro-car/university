#include "studente.h"

int main() {
	studente s;
	s.set_matricola("825199");
	s.set_nome("Alessandro Carella");
	s.set_esame(30, 1);
	s.set_esame(24, 3);
	s.set_esame(25, 4);
	s.print_studente();
	s.set_esame(27, 4);
	s.print_studente();
	return 0;
}
