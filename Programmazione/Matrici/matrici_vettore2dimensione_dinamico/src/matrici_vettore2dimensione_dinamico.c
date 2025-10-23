/*
 ============================================================================
 Name        : matrici_vettore2dimensione_dinamico.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

#define MAX_RIGHE 50
#define MAX_COLONNE 50

typedef struct{
	int righe;
	int colonne;
	int **valori;
} matrice;

int leggi_numero_righe(matrice mat);
int leggi_numero_colonne(matrice mat);
int leggi_valore(matrice mat, int riga, int colonna);
void scrivi_numero_righe(matrice *mat, int new_righe);
void scrivi_numero_colonne(matrice *mat, int new_colonne);
void scrivi_valore(matrice *mat, int riga, int colonna, int valore);
void inizializza_matrice(matrice *mat);
void stampa_matrice(matrice mat);

void alloca_memoria_matrice(matrice *mat, int n_righe, int n_colonne);
void realloca_memoria_matrice(matrice *mat, int n_righe, int n_colonne);
void dealloca_memoria_matrice(matrice *mat);


void somma_matrice(matrice mat1, matrice mat2, matrice *mat_somma);
void prodotto_scalare(matrice mat, int scalare, matrice *mat_scalata);
void trasposta_matrice(matrice mat, matrice *mat_trasposta);
void prodotto_matrice(matrice mat1, matrice mat2, matrice *mat_prodotto);

int main(void) {
	matrice mat1;
	int n_righe_mat1;
	printf("Inserisci il numero di righe della prima matrice:");
	scanf("%d", &n_righe_mat1);
	scrivi_numero_righe(&mat1, n_righe_mat1);
	int n_colonne_mat1;
	printf("Inserisci il numero di colonne della seconda matrice:");
	scanf("%d", &n_colonne_mat1);
	scrivi_numero_colonne(&mat1, n_colonne_mat1);
	inizializza_matrice(&mat1);

	matrice mat2;
	int n_righe_mat2;
	printf("Inserisci il numero di righe della prima matrice:");
	scanf("%d", &n_righe_mat2);
	scrivi_numero_righe(&mat2, n_righe_mat2);
	int n_colonne_mat2;
	printf("Inserisci il numero di colonne della seconda matrice:");
	scanf("%d", &n_colonne_mat2);
	scrivi_numero_colonne(&mat2, n_colonne_mat2);
	inizializza_matrice(&mat2);
	printf("Prima matrice:\n");
	stampa_matrice(mat1);
	printf("Seconda matrice:\n");
	stampa_matrice(mat2);

	matrice mat_somma;
	alloca_memoria_matrice(&mat_somma, MAX_RIGHE, MAX_COLONNE);
	somma_matrice(mat1, mat2, &mat_somma);
	int n_righe_matSomma = leggi_numero_righe(mat_somma);
	int n_colonne_matSomma = leggi_numero_colonne(mat_somma);
	realloca_memoria_matrice(&mat_somma, n_righe_matSomma, n_colonne_matSomma);
	printf("Matrice somma: \n");
	stampa_matrice(mat_somma);
	dealloca_memoria_matrice(&mat_somma);

	matrice mat_scalare;
	alloca_memoria_matrice(&mat_scalare, MAX_RIGHE, MAX_COLONNE);
	int scalare = 5;
	prodotto_scalare(mat1, scalare, &mat_scalare);
	int n_righe_matScalare = leggi_numero_righe(mat_scalare);
	int n_colonne_matScalare = leggi_numero_colonne(mat_scalare);
	realloca_memoria_matrice(&mat_scalare, n_righe_matScalare, n_colonne_matScalare);
	printf("Prima matrice scalata con il valore %d:\n", scalare);
	stampa_matrice(mat_scalare);
	dealloca_memoria_matrice(&mat_scalare);

	matrice mat_trasposta;
	alloca_memoria_matrice(&mat_trasposta, MAX_RIGHE, MAX_COLONNE);
	trasposta_matrice(mat2, &mat_trasposta);
	int n_righe_matTrasposta = leggi_numero_righe(mat_trasposta);
	int n_colonne_matTrasposta = leggi_numero_colonne(mat_trasposta);
	realloca_memoria_matrice(&mat_trasposta, n_righe_matTrasposta, n_colonne_matTrasposta);
	printf("Seconda matrice trasposta:\n");
	stampa_matrice(mat_trasposta);

	matrice mat_prodotto;
	alloca_memoria_matrice(&mat_prodotto, MAX_RIGHE, MAX_COLONNE);
	prodotto_matrice(mat1, mat2, &mat_prodotto);
	int n_righe_matProd = leggi_numero_righe(mat_prodotto);
	int n_colonne_matProd = leggi_numero_colonne(mat_prodotto);
	realloca_memoria_matrice(&mat_prodotto, n_righe_matProd, n_colonne_matProd);
	printf("Matrice prodotto delle due matrici:\n");
	stampa_matrice(mat_prodotto);
	dealloca_memoria_matrice(&mat_prodotto);

	system("pause");
	return 0;
}

int leggi_numero_righe(matrice mat) {
	int n_righe;
	n_righe = mat.righe;
	return n_righe;
}

int leggi_numero_colonne(matrice mat) {
	int n_colonne;
	n_colonne = mat.colonne;
	return n_colonne;
}

int leggi_valore(matrice mat, int riga, int colonna) {
	int valore;
	valore = *(*(mat.valori + riga) + colonna);

	return valore;
}

void scrivi_numero_righe(matrice *mat, int new_righe) {
	mat->righe = new_righe;
	return;
}

void scrivi_numero_colonne(matrice *mat, int new_colonne) {
	mat->colonne = new_colonne;
	return;
}

void scrivi_valore(matrice *mat, int riga, int colonna, int valore) {
	*(*(mat->valori + riga) + colonna) = valore;
	return;
}

void inizializza_matrice(matrice *mat) {
	int n_righe;
	n_righe = leggi_numero_righe(*mat);
	int n_colonne;
	n_colonne = leggi_numero_colonne(*mat);
	alloca_memoria_matrice(mat, n_righe, n_colonne);
	int i = 0;
	while (i < n_righe) {
		int j = 0;
		while (j < n_colonne) {
			int valore;
			printf("Inserisci il valore dell'elemento della matrice nella riga %d colonna %d:", (i + 1), (j + 1));
			scanf("%d", &valore);
			scrivi_valore(mat, i, j, valore);
			j = j + 1;
		}
		printf("\n");
		i = i + 1;
	}
}

void stampa_matrice(matrice mat) {
	int n_righe;
	n_righe = leggi_numero_righe(mat);
	int n_colonne;
	n_colonne = leggi_numero_colonne(mat);
	int i = 0;
	while (i < n_righe) {
		int j = 0;
		while (j < n_colonne) {
			printf("[%d]", leggi_valore(mat, i, j));
			j = j + 1;
		}
		printf("\n");
		i = i + 1;
	}
}


void alloca_memoria_matrice(matrice *mat, int n_righe, int n_colonne) {
	mat->valori = malloc(n_righe * sizeof(int));

	int i = 0;
	while (i < n_righe) {
		*(mat->valori + i) = malloc(n_colonne * sizeof(int));
		i = i + 1;
	}
}

void realloca_memoria_matrice(matrice *mat, int n_righe, int n_colonne) {
	mat->valori = realloc(mat->valori,  n_righe * sizeof(int));

	int i = 0;
	while (i < n_righe) {
		*(mat->valori + i) = realloc(*(mat->valori + i), n_colonne * sizeof(int));
		i = i + 1;
	}
}

void dealloca_memoria_matrice(matrice *mat) {
	int n_righe;
	n_righe = leggi_numero_righe(*mat);
	free(mat->valori);
	int i = 0;
	while (i < n_righe) {
		free(*(mat->valori + i));
		i = i + 1;
	}

}

void somma_matrice(matrice mat1, matrice mat2, matrice *mat_somma) {
	int n_righe_mat1 = leggi_numero_righe(mat1);
	int n_colonne_mat1 = leggi_numero_colonne(mat1);

	int n_righe_mat2 = leggi_numero_righe(mat2);
	int n_colonne_mat2 = leggi_numero_colonne(mat2);

	int i = 0;
	if ((n_righe_mat1 == n_righe_mat2) && (n_colonne_mat1 == n_colonne_mat2)) {
		scrivi_numero_righe(mat_somma, n_righe_mat1);
		scrivi_numero_colonne(mat_somma, n_colonne_mat1);
		while (i < n_righe_mat1) {
			int j = 0;
			while (j < n_colonne_mat1) {
				int elemento_mat1 = leggi_valore(mat1, i, j);
				int elemento_mat2 = leggi_valore(mat2, i, j);
				int valore = elemento_mat1 + elemento_mat2;
				scrivi_valore(mat_somma, i, j, valore);
				j = j + 1;
			}
			i = i + 1;
		}
	} else {
		printf("Le matrici non hanno stesso numero di righe e di colonne pertanto non è possibile effettuare la somma!\n");
	}
}

void prodotto_scalare(matrice mat, int scalare, matrice *mat_scalata) {
	int n_righe = leggi_numero_righe(mat);
	int n_colonne = leggi_numero_colonne(mat);

	scrivi_numero_righe(mat_scalata, n_righe);
	scrivi_numero_colonne(mat_scalata, n_colonne);
	int i = 0;
	while (i < n_righe) {
		int j = 0;
		while (j < n_colonne) {
			int elemento_matrice = leggi_valore(mat, i, j);
			int valore_scalato = elemento_matrice * scalare;
			scrivi_valore(mat_scalata, i, j, valore_scalato);
			j = j + 1;
		}
		i = i + 1;
	}
}

void trasposta_matrice(matrice mat, matrice *mat_trasposta) {
	int n_righe = leggi_numero_righe(mat);
	int n_colonne = leggi_numero_colonne(mat);

	scrivi_numero_righe(mat_trasposta, n_colonne);
	scrivi_numero_colonne(mat_trasposta, n_righe);
	int i = 0;
	while (i < n_colonne) {
		int j = 0;
		while (j < n_righe) {
			int elemento = leggi_valore(mat, j, i);
			scrivi_valore(mat_trasposta, i, j, elemento);
			j =  j + 1;
		}
		i = i + 1;
	}
}

void prodotto_matrice(matrice mat1, matrice mat2, matrice *mat_prodotto) {
	//Colonne prima matrice uguale a righe seconda matrice
	//dimensione nuova matrice: righe di prima matrice e colonne seconda matrice
	int n_righe_mat1 = leggi_numero_righe(mat1);
	int n_colonne_mat1 = leggi_numero_colonne(mat1);

	int n_righe_mat2 = leggi_numero_righe(mat2);
	int n_colonne_mat2 = leggi_numero_colonne(mat2);

	if (n_colonne_mat1 == n_righe_mat2) {
		scrivi_numero_righe(mat_prodotto, n_righe_mat1);
		scrivi_numero_colonne(mat_prodotto, n_colonne_mat2);
		int i = 0;
		while (i < n_righe_mat1) {
			int j = 0;
			while (j < n_colonne_mat2) {
				scrivi_valore(mat_prodotto, i, j, 0);
				int k = 0;
				while (k < n_colonne_mat1) {
					int val_mat1 = leggi_valore(mat1, i, k);
					int val_mat2 = leggi_valore(mat2, k, j);
					int val_mat_prodotto = leggi_valore(*mat_prodotto, i, j);
					int nuovo_valore = val_mat_prodotto + val_mat1 * val_mat2;
					scrivi_valore(mat_prodotto, i, j, nuovo_valore);
					k = k + 1;
				}
				j = j + 1;
			}
			i = i + 1;
		}
	} else {
		printf("Non è possibile effettuare il prodotto tra le matrici in quanto non rispecchiano le condizioni tali da effettuare il prodotto tra esse.\n");
	}
}


