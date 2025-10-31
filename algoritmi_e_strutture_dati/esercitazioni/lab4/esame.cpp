#include "esame.h"

esame::esame() {
	m_nome_esame = "";
	m_sostenuto = false;
	m_voto = 0;
}

esame::esame(string nome) {
	m_nome_esame = nome;
	m_sostenuto = false;
	m_voto = 0;
}

esame::esame(string nome, int voto) {
	m_nome_esame = nome;
	m_sostenuto = true;
	m_voto = voto;
}

string esame::get_esame() const {
	return m_nome_esame;
}

void esame::set_esame(string nome) {
	m_nome_esame = nome;
}

int esame::get_voto() const {
	return m_voto;
}

void esame::set_voto(int v) {
	m_voto = v;
	m_sostenuto = true;
}

bool esame::is_sostenuto() const {
	return m_sostenuto;
}
