/*
 ============================================================================
 Name        : 19_dicembre.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

void stampa_sequenza(int *sequenza_voti, int dim_sequenza);
void leggi_file(FILE *file_voti, int *dim_sequenza, int *sequenza_voti);
float calcola_media(int *sequenza_voti, int dim_sequenza);
int voto_maggiore(int *sequenza_voti, int dim_sequenza);

int main(void) {
	FILE *file_voti;
	if ((file_voti = fopen("C:/Users/carel/Desktop/Universita/Programmazione/Esercitazioni_giovedi/19_dicembre/voti.txt", "r")) == NULL) {
		printf("Impossibile aprire il file\n");

	} else {
		int *sequenza_voti = malloc(100 * sizeof(int));
		int dim_sequenza;
		leggi_file(file_voti, &dim_sequenza, sequenza_voti);
		sequenza_voti = realloc(sequenza_voti, dim_sequenza * sizeof(int));
		if (dim_sequenza > 0) {
			stampa_sequenza(sequenza_voti, dim_sequenza);
			float media;
			media = calcola_media(sequenza_voti, dim_sequenza);
			printf("La media dei voti da e': %f\n", media);
			int voto_max;
			voto_max = voto_maggiore(sequenza_voti, dim_sequenza);
			printf("Il voto massimo e': %d\n", voto_max);
		} else {
			printf("Non c'erano voti nel file\n");
		}
		fclose(file_voti);
	}

	system("pause");
	return EXIT_SUCCESS;
}

void leggi_file(FILE *file_voti, int *dim_sequenza, int *sequenza_voti) {
	int ch;
	int voto;
	voto = 0;
	ch = fgetc(file_voti);
	int i;
	i = 0;
	while (!feof(file_voti)) {
		if ((ch >= 48) && (ch <= 57)) {
			voto = voto * 10 + ch - 48;
		}
		if (ch == ';' && voto >= 0 && voto <= 30) {
			*(sequenza_voti + i) = voto;
			voto = 0;
			i = i + 1;

		}

		ch = fgetc(file_voti);
	}
	*dim_sequenza = i;
	return;
}

float calcola_media(int *sequenza_voti, int dim_sequenza) {
	float media = 0;
	float somma_voti = 0;
	int i = 0;
	while (i < dim_sequenza) {
		somma_voti = somma_voti + *(sequenza_voti + i);
		i = i + 1;
	}
	media = somma_voti / dim_sequenza;
	return media;
}

int voto_maggiore(int *sequenza_voti, int dim_sequenza) {
	int voto_max = sequenza_voti[0];
	int i = 1;
	while (i < dim_sequenza) {
		if (*(sequenza_voti + i) > voto_max) {
			voto_max = *(sequenza_voti + i);
		}
		i = i + 1;
	}

	return voto_max;
}

void stampa_sequenza(int *sequenza_voti, int dim_sequenza) {
	printf("I voti dello studente da 0 a 30 sono: ");
	int i = 0;
	while(i < dim_sequenza) {
		printf("%d, ", (*sequenza_voti + i));
		i = i + 1;
	}
	printf("\n");
}

