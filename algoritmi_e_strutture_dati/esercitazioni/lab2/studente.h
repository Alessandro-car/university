#include <string>
using namespace std;
class studente {
	public:
		studente();
		~studente();

		string get_matricola() const;
		string get_nome() const;
		string get_cognome() const;
		int get_eta() const;
		void set_matricola(string m);
		void set_nome(string n);
		void set_cognome(string c);
		void set_eta(int e);

	private:
		string matricola;
		string nome;
		string cognome;
		int eta;
};

