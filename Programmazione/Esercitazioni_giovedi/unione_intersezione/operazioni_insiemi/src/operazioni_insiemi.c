/*
 ============================================================================
 Name        : operazioni_insiemi.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int cercareElemento(int insieme[], int elemento);
int * intersezione(int insieme1[], int insieme2[]);
int * unione(int insieme1[], int insieme2[]);
void stampaInsieme(int insieme[]);

int main(void) {
	int A[100]; //primo insieme con cui giocare
	int B[100]; //secondo insieme con cui giocare
	int C[100]; //terzo insieme con cui giocare
	int D[100]; //quarto insieme con cui giocare

	A[0] = 5;
	A[1] = 1;
	A[2] = 18;
	A[3] = 160;
	A[4] = 0;
	A[5] = 127;

	B[0] = 7;
	B[1] = 18;
	B[2] = 7;
	B[3] = 14;
	B[4] = 21;
	B[5] = 28;
	B[6] = 35;
	B[7] = 42;

	C[0] = 3;
	C[1] = 12;
	C[2] = 18;
	C[3] = 14;

	D[0] = 4;
	D[1] = 1;
	D[2] = 18;
	D[3] = 127;
	D[4] = 69;

	int* I1 = calloc(100, sizeof(int));
	int* I2 = calloc(100, sizeof(int));
	int* I3 = calloc(100, sizeof(int));
	int* I4 = calloc(100, sizeof(int));
	int* E = calloc(100, sizeof(int));

	stampaInsieme(A);
	stampaInsieme(B);
	stampaInsieme(C);
	stampaInsieme(D);
	printf("-------------------------------------\n");
	I1 = unione(A, C);
	I2 = intersezione(A,B);
	I3 = intersezione(D, I2);
	I4 = unione(B, I3);
	stampaInsieme(I1);
	stampaInsieme(I2);
	stampaInsieme(I3);
	stampaInsieme(I4);
	E = unione(I1, I4);

	int i = 1;
	printf("{");
	while(i <= E[0]) {
		printf("%d, ", E[i]);
		i = i + 1;
	}

	printf("}\n");

	system("pause");
	return EXIT_SUCCESS;
}

void stampaInsieme(int insieme[]) {
	int i = 1;
	printf("{");
	while (i <= insieme[0]) {
		printf("%d, ", insieme[i]);
		i = i + 1;
	}
	printf("}\n");
}

int cercareElemento(int insieme[], int elemento) {
	int trovato; // indica se 'elemento' appartiene ad 'insieme', booleano
	int i; //indica le posizioni di 'insieme', naturale > 0
	trovato = 0;
	i = 1;
	while ((i <= insieme[0]) && (trovato == 0)) {
		if (elemento == insieme[i]) {
			trovato = 1;
		}
		i = i + 1;
	}

	return trovato;
}

int * intersezione(int insieme1[], int insieme2[]){
	int i;
	int j;

	int* I = calloc(100, sizeof(int));
	i = 1;
	j = 1;

	while (i <= insieme1[0]) {
		if (cercareElemento(insieme2, insieme1[i]) == 1) {
			I[j] = insieme1[i];
			j = j + 1;
		}
		i = i + 1;
	}
	I[0] = j - 1;

	return I;
}

int * unione(int insieme1[], int insieme2[]) {
	int* U = calloc(100, sizeof(int));
	int i;
	int j;

	i = 1;
	while (i <= insieme1[0]) {
		U[i] = insieme1[i];

		i = i + 1;
	}


	i = 1;
	j = insieme1[0] + 1;

	while (i <= insieme2[0]) {

		if (cercareElemento(insieme1, insieme2[i]) == 0) {
			U[j] = insieme2[i];
			j = j + 1;
		}
		i = i + 1;
	}

	U[0] = j - 1;
	return U;
}
