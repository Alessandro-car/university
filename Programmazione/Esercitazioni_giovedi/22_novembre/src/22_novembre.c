/*
 ============================================================================
 Name        : 22_novembre.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int controllaCarattere(char insieme[], int dim_insieme, char carattere);
int controllaSequenza(char sequenza[], int dim_sequenza, char insieme_b[], int b);
int controllaMassimo(char sequenza[], int dim_sequenza, char insieme_b[], int b);

int main(void) {
	int dim_sequenza; // dimensione della sequenza data
	dim_sequenza = 12;
	char sequenza[] = "499-84-9-354"; //sequenza di caratteri composta da numeri in base b intervallati da '-'
	int b; //base dei numeri
	b = 10;
	char insieme_b[] = "0123456789"; //insieme di caratteri che rappresentano le cifre dei numeri ammessi

	int massimo; //massimo del numero nella sequenza, se quest'ultima è errata massimo vale -1
	massimo = controllaMassimo(sequenza, dim_sequenza, insieme_b, b);
	if (massimo > -1) {
		printf("Numero massimo trovato nella sequenza: %d\n", massimo);
	} else {
		printf("L'input e' errato: %d\n", massimo);
	}

	system("pause");
	return EXIT_SUCCESS;
}

//funzione che controlla un carattere dato in un insieme
int controllaCarattere(char insieme[], int dim_insieme, char carattere) {
	int trovato;
	trovato = 0;
	int i;
	i = 0;
	while ((i < dim_insieme) && (trovato == 0)) {
		if (carattere == insieme[i]) {
			trovato = 1;
		}
		i = i + 1;
	}
	return trovato;
}

//funzione che controlla se la sequenza data contiene solo caratteri ammessi
int controllaSequenza(char sequenza[], int dim_sequenza, char insieme_b[], int b) {
	int errata;
	errata = 0;
	int i;
	i = 0;
	while ((i < dim_sequenza) && (errata == 0)) {
		if ((sequenza[i] != '-') && (controllaCarattere(insieme_b, b, sequenza[i]) == 0)) {
			errata = 1;
		}
		i = i + 1;
	}
	return errata;
}

//funzione che mi controlla il numero maggiore all'interno della sequenza
int controllaMassimo(char sequenza[], int dim_sequenza, char insieme_b[], int b) {
	int massimo;
	massimo = 0;
	if (controllaSequenza(sequenza, dim_sequenza, insieme_b, b) == 1)
		massimo = -1;
	int i;
	i = 0;
	int temp;
	temp = 0;
	while ((i <= dim_sequenza) && (massimo != -1)) {
		if ((sequenza[i] != '-') && (i < dim_sequenza)) {
			temp = temp * 10 + (sequenza[i] - 48);

		} else {
			if (temp > massimo) {

				massimo = temp;
			}

			temp = 0;
		}
		i = i + 1;

	}
	return massimo;
}

