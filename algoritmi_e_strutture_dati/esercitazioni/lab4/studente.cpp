#include "studente.h"
#include <iostream>

using std::cout;
using std::endl;

studente::studente() {
	m_esami = new esame[MAX_N_ESAMI];
	m_num_esami = 0;
	m_nome = "";
	m_matricola = "";
	for (size_t i = 0; i < MAX_N_ESAMI; i++) {
		esame e(m_def_esami[i]);
		m_esami[i] = e;
	}
}

studente::studente(string* esami, string nome, string matricola) {
	m_esami = new esame[MAX_N_ESAMI];
	m_nome = nome;
	m_matricola = matricola;
	m_num_esami = 0;
	for (size_t i = 0; i < MAX_N_ESAMI; i++) {
		esame e(esami[i]);
		m_esami[i] = e;
	}
}

string studente::get_matricola() const {
	return m_matricola;
}

void studente::set_matricola(string m) {
	m_matricola = m;
}

string studente::get_nome() const {
	return m_nome;
}

void studente::set_nome(string n) {
	m_nome = n;
}

void studente::set_esame(int v, size_t i) {
	if (get_sostenuto(i) == false)
		m_num_esami++;
	m_esami[i].set_voto(v);
}

int studente::get_voto_esame(size_t i) const {
	return m_esami[i].get_voto();
}

string studente::get_nome_esame(size_t i) const {
	return m_esami[i].get_esame();
}

bool studente::get_sostenuto(size_t i) const {
	return m_esami[i].is_sostenuto();
}

int studente::get_num_esami() const {
	return MAX_N_ESAMI;
}

float studente::get_media() {
	int sum = 0;
	for (size_t i = 0; i < m_num_esami; i++) {
		sum += get_voto_esame(i);
	}
	return sum / m_num_esami;
}

void studente::print_studente() {
	cout << "Nome: " << get_nome();
	cout << endl;
	cout << "Matricola: " << get_matricola();
	cout << endl;
	cout << "Numero esami sostenuti: " << m_num_esami;
	cout << endl;
	for (size_t i = 0; i < get_num_esami(); i++) {
		if (get_sostenuto(i))
			cout << "Esame: " << get_nome_esame(i) << " " << get_voto_esame(i) << endl;
	}
	if (m_num_esami > 0)
		cout << "Media: " << get_media();
}

