/*
 ============================================================================
 Name        : 29_novembre.c
 Author      : 
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int multiplo_di_k(int numero, int k);
void sposta_elementi_sinistra(int *numeri, int *n, int pos);
void elimina_multipli_k(int *numeri, int *n, int k);

int main() {
   int n = 6;
   int *numeri = malloc(n * sizeof(int));
   numeri[0] = 0;
   numeri[1] = 4;
   numeri[2] = 8;
   numeri[3] = 17;
   numeri[4] = 11;
   numeri[5] = 10;
   int k = 2;
   elimina_multipli_k(numeri, &n, k);

   int j = 0;
   while (j < n) {
	   printf("%d\n", numeri[j]);
	   j = j + 1;
   }

   system("pause");
   return 0;
}

int multiplo_di_k(int numero, int k) {
	int multiplo = 0;
    if (numero < 0)
        numero = numero * -1;
    while (numero > 0) {
        numero = numero - k;
    }

    if (numero < 0){
        multiplo = 0;
    } else {
        multiplo = 1;
    }
    return multiplo;
}

void sposta_elementi_sinistra(int *numeri, int *n, int pos) {
    int j = pos;
    while (j < *n) {
        numeri[j] = numeri[j + 1];
        j = j + 1;
    }
    *n = *n - 1;
}

void elimina_multipli_k(int *numeri, int *n, int k) {
    int i = 0;
    while (i < *n ) {
        if (multiplo_di_k(numeri[i], k) == 1) {
        	sposta_elementi_sinistra(numeri, n, i);
        } else {
        	i = i + 1;
        }
    }
}
