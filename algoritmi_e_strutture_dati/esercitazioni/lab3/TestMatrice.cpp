#include "matrice.h"
using namespace std;
int main() {
	matrice<int> prova(3, 2);

	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 2; j++) {
			prova.scrivimatrice(i, j, 2);
		}
	}
	matrice<int> prod_scalare = prova.prodottoscalare(3);
	prod_scalare.stampamatrice();

	matrice<int> trasposta = prova.trasposta();
	trasposta.stampamatrice();
	try {
		matrice<int> prodotto_matrici = prod_scalare.prodotto(trasposta);
		prodotto_matrici.stampamatrice();

	} catch (const std::invalid_argument& e) {
		cerr << e.what() << endl;
		return 1;
	}
	return 0;
}
