#ifndef _STUDENTE_H
#define _STUDENTE_H

#include "esame.h"
#include <string>

using std::string;

#define MAX_N_ESAMI 5


class studente {
	public:
		studente();
		studente(string*, string, string);
		string get_matricola() const;
		void set_matricola(string);
		string get_nome() const;
		void set_nome(string);
		void set_esame(int, size_t);
		int get_voto_esame(size_t) const;
		string get_nome_esame(size_t) const;
		bool get_sostenuto(size_t) const;
		int get_num_esami() const;
		float get_media();
		void print_studente();

	private:
		string m_def_esami[MAX_N_ESAMI] = {"AESO", "LDP", "ASD", "Analisi 1", "CPS"};
		string m_matricola;
		string m_nome;
		esame* m_esami;
		size_t m_num_esami;
};

#endif
