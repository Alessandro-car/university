#ifndef _ESAME_H
#define _ESAME_H

#include <string>
using std::string;
class esame {
	public:
		esame();
		esame(string);
		esame(string, int);
		string get_esame() const;
		void set_esame(string);
		int get_voto() const;
		void set_voto(int);
		bool is_sostenuto() const;
	private:
		string m_nome_esame;
		bool m_sostenuto;
		int m_voto;
};

#endif

