#include <iostream>
using namespace std;

template <class T>

class matrice {
	public:
		matrice(int, int);
		~matrice();
		matrice(const matrice<T>&);
		matrice<T>& operator=(const matrice<T>&);
		T leggimatrice(int, int) const;
		void scrivimatrice(int, int, T);
		void stampamatrice() const;
		matrice<T> prodotto(matrice<T>);
		matrice<T> trasposta();
		matrice<T> prodottoscalare(T);
	private:
		int righe;
		int colonne;
		T** elementi;
};

template <class T>
matrice<T>::matrice(int r, int c) {
	colonne = c;
	righe = r;
	int i;
	elementi = new T* [righe];
	for (i = 0; i < righe; i++) {
		elementi[i] = new T[colonne];
	}
}

template <class T>
matrice<T>::~matrice() {
	for (int i = 0; i < righe; i++) {
		delete []elementi[i];
	}
	delete[] elementi;
}

template <class T>
matrice<T>::matrice(const matrice<T>& new_m) {
	righe = new_m.righe;
	colonne = new_m.colonne;
	elementi = new T*[righe];
	for (int i = 0; i < righe; i++) {
		elementi[i] = new T[colonne];
	}

	for (int i = 0; i < righe; i++) {
		for (int j = 0; j < colonne; j++) {
			elementi[i][j] = new_m.elementi[i][j];
		}
	}
}

template <class T>
matrice<T>& matrice<T>::operator=(const matrice<T>& new_m) {
	if (&new_m == this) {
		return *this;
	} else {
		int i, j;
		if (colonne != new_m.colonne || righe != new_m.righe) {
			this->~matrice();
			colonne = new_m.colonne;
			righe = new_m.righe;
			elementi = new T* [righe];
			for (int i = 0; i < righe; i++) {
				elementi[i] = new T[colonne];
			}
		}
		for (int i = 0; i < righe; i++) {
			for (int j = 0; j < colonne; j++) {
				elementi[i][j] = new_m.elementi[i][j];
			}
		}
	}
	return *this;
}

template <class T>
T matrice<T>::leggimatrice(int r, int c) const{
	return elementi[r][c];
}

template <class T>
void matrice<T>::scrivimatrice(int r, int c, T e) {
	elementi[r][c] = e;
}

template <class T>
void matrice<T>::stampamatrice() const{
	for (int i = 0; i < righe; i++) {
		for (int j = 0; j < colonne; j++) {
			cout << this->leggimatrice(i, j) << " ";
		}
		cout << endl;
	}
}

template <class T>
matrice<T> matrice<T>::prodotto(matrice<T> m1) {
	if (colonne != m1.righe) {
		throw std::invalid_argument(
                "Il numero di colonne della prima matrice (" +
                std::to_string(colonne) +
                ") deve essere uguale al numero di righe della seconda matrice (" +
                std::to_string(m1.righe) + ")"
          );
	}
	matrice<T> prodotto_matrici(righe, m1.colonne);
	for (int i = 0; i < righe; i++) {
		for (int j = 0; j < m1.colonne; j++) {
			prodotto_matrici.scrivimatrice(i, j, 0);
			for (int k = 0; k < colonne; k++) {
				T e = prodotto_matrici.leggimatrice(i, j) + this->leggimatrice(i, k) * m1.leggimatrice(k, j);
				prodotto_matrici.scrivimatrice(i, j, e);
			}
		}
	}
	return prodotto_matrici;
}

template <class T>
matrice<T> matrice<T>::trasposta() {
	matrice<T> trasposta(colonne, righe);

	for (int i = 0; i < trasposta.righe; i++) {
		for (int j = 0; j < trasposta.colonne; j++) {
			T e = this->leggimatrice(j, i);
			trasposta.scrivimatrice(i, j, e);
		}
	}
	return trasposta;
}

template <class T>
matrice<T> matrice<T>::prodottoscalare(T scalare) {
	matrice<T> prod_scalare(*this);
	for (int i = 0; i < righe; i++) {
		for (int j = 0; j < colonne; j++) {
			T e = prod_scalare.leggimatrice(i, j);
			prod_scalare.scrivimatrice(i, j, e * scalare);
		}
	}
	return prod_scalare;
}
