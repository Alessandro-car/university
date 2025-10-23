#include <iostream>
#include "studente.h"

void input_nome(string& n);
void input_cognome(string& c);
void input_matricola(string& m);
void input_eta(int& e);

int main() {
	studente s;
	string nome;
	string cognome;
	string matricola;
	int eta;

	input_nome(nome);
	input_cognome(cognome);
	input_matricola(matricola);
	input_eta(eta);

	s.set_matricola(matricola);
	s.set_nome(nome);
	s.set_cognome(cognome);
	s.set_eta(eta);

	cout << s.get_matricola() << endl;
	cout << s.get_nome() << endl;
	cout << s.get_cognome() << endl;
	cout << s.get_eta() << endl;
}

void input_nome(string& n) {
	do {
		cout << "Inserisci il nome dello studente (max 30 caratteri): ";
		cin >> n;
		if (n.length() > 30) {
			cout << "Il nome deve essere di massimo 30 caratteri!" << endl;
		}
	} while (n.length() > 30);
}


void input_cognome(string& c) {
	do {
		cout << "Inserisci il cognome dello studente (max 30 caratteri): ";
		cin >> c;
		if (c.length() > 30) {
			cout << "Il cognome deve essere di massimo 30 caratteri!" << endl;
		}
	} while (c.length() > 30);
}

void input_matricola(string& m) {
	do {
		cout << "Inserisci la matricola dello studente (Compreso tra 255312 e 499999): ";
		cin >> m;
		if (m.length() != 6) {
			cout << "La matricola deve avere 6 caratteri!" << endl;
		}
		if (stoi(m) < 255312 || stoi(m) > 499999) {
			cout << "La matricola deve essere compresa tra 255312 e 499999!" << endl;
		}
	} while (m.length() !=  6 || stoi(m) < 255312 || stoi(m) > 499999);
}

void input_eta(int& e) {
	do {
		cout << "Inserisci l'eta' dello studente: ";
		cin >> e;
		if (e < 12 || e > 105) {
			cout << "L'eta' deve essere compresa tra 12 e 105!" << endl;
		}
	} while (e < 12 || e > 105);
}



