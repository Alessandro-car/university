#include "studente.h"
string studente::get_matricola() const {
	return matricola;
}

string studente::get_nome() const {
	return nome;
}

string studente::get_cognome() const {
	return cognome;
}

int studente::get_eta() const {
	return eta;
}

void studente::set_matricola(string m) {
	matricola = m;
}

void studente::set_nome(string n) {
	nome = n;
}

void studente::set_cognome(string c) {
	cognome = c;
}

void studente::set_eta(int e) {
	eta = e;
}
