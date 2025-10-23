/*
 ============================================================================
 Name        : 5_dicembre.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>


#define RIGHE 5
#define COLONNE 5


void somma_matrice(int matrice_1[RIGHE][COLONNE], int matrice_2[RIGHE][COLONNE], int matrice_somma[RIGHE][COLONNE]);
void prodotto_scalare(int matrice[RIGHE][COLONNE], int scalare, int prodotto_scalare[RIGHE][COLONNE]);
void trasposta_matrice(int matrice[RIGHE][COLONNE], int matrice_trasposta[COLONNE][RIGHE]);
void prodotto_matrice(int matrice_1[RIGHE][COLONNE], int matrice_2[RIGHE][COLONNE], int prodotto_matrice[RIGHE][COLONNE]);
void stampa_matrice(int matrice[RIGHE][COLONNE]);

int main(void) {
	int matrice_1[RIGHE][COLONNE] = {
			{1, 2, 3, 4, 5},
			{6, 7, 8, 9, 10},
			{1, 2, 3, 4, 5},
			{6, 7, 8, 9, 2},
			{5, 6, 7, 2, 20}
	};
	int matrice_2[RIGHE][COLONNE] = {
				{5, 4, 3, 2, 1},
				{10, 9, 8, 7, 6},
				{15, 14, 13, 12, 11},
				{20, 19, 18, 17, 16},
				{25, 24, 23, 22, 21}
		};

	int matrice_somma[RIGHE][COLONNE];
	somma_matrice(matrice_1, matrice_2, matrice_somma);
	printf("Somma: \n");
	stampa_matrice(matrice_somma);
	printf("Prodotto di matrice con uno scalare: \n");
	int scalare;
	scalare = 5;
	int matrice_scalare[RIGHE][COLONNE];
	prodotto_scalare(matrice_1, scalare, matrice_scalare);
	stampa_matrice(matrice_scalare);
	printf("Matrice trasposta: \n");
	int matrice_trasposta[COLONNE][RIGHE];
	trasposta_matrice(matrice_2, matrice_trasposta);
	stampa_matrice(matrice_trasposta);
	printf("Prodotto tra matrici: \n");
	int prodotto_matrici[RIGHE][COLONNE];
	prodotto_matrice(matrice_1, matrice_2, prodotto_matrici);
	stampa_matrice(prodotto_matrici);
	system("pause");
	return EXIT_SUCCESS;
}

void somma_matrice(int matrice_1[RIGHE][COLONNE], int matrice_2[RIGHE][COLONNE], int matrice_somma[RIGHE][COLONNE])
{
	int i = 0;
	while (i < RIGHE) {
		int j = 0;
		while (j < COLONNE) {
			matrice_somma[i][j] = matrice_1[i][j] + matrice_2[i][j];
			j = j + 1;
		}
		i = i + 1;
	}
}

void stampa_matrice(int matrice[RIGHE][COLONNE]) {
	int i = 0;
	while (i < RIGHE) {
		int j = 0;
		while (j < COLONNE){
			printf("[%d]", matrice[i][j]);
			j = j + 1;
		}
		printf("\n");
		i = i + 1;
	}
}

void prodotto_scalare(int matrice[RIGHE][COLONNE], int scalare, int prodotto_scalare[RIGHE][COLONNE]) {
	int i = 0;
	while (i < RIGHE) {
		int j = 0;
		while (j < COLONNE) {
			prodotto_scalare[i][j] = matrice[i][j] * scalare;
			j = j + 1;
		}
		i = i + 1;
	}
}

void trasposta_matrice(int matrice[RIGHE][COLONNE], int matrice_trasposta[COLONNE][RIGHE]) {
	int i = 0;
	while (i < COLONNE) {
		int j = 0;
		while (j < RIGHE) {
			matrice_trasposta[i][j] = matrice[j][i];
			j =  j + 1;
		}
		i = i + 1;
	}
}

void prodotto_matrice(int matrice_1[RIGHE][COLONNE], int matrice_2[RIGHE][COLONNE], int matrice_prodotto[RIGHE][COLONNE]) {
	//Riga prima matrice uguale a colonna seconda matrice
	//dimensione nuova matrice: righe di prima matrice e colonne seconda matrice
	int i = 0;
	while (i < RIGHE) {
		int j = 0;
		while (j < COLONNE) {
			matrice_prodotto[i][j] = 0;
			int k = 0;
			while (k < COLONNE) {
				matrice_prodotto[i][j] = matrice_prodotto[i][j] + matrice_1[i][k] * matrice_2[k][j];
				k = k + 1;
			}
			j = j + 1;
		}
		i = i + 1;
	}
}
