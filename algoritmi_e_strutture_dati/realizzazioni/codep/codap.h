template <class T>
void sort(T* A, int n){
    codap<T> C;
    for (int i=0; i<n; i++)
        C.insert(A[i]);
    for (int i=0; i<n; i++){
        A[i] = C.min();
        C.remove();
    }
}


/***************************************************************************
 *   Copyright (C) 2010 by Nicola Di Mauro                                 *
 *   ndm@di.uniba.it                                                       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/

#ifndef _CODAPO_H_
#define _CODAP_H_

#include "assert.h"

template < class T > 
class CodaP {

public:
  typedef T _tipoelem;
  CodaP ();
  CodaP (int);
  ~CodaP ();

  void creaPrioriCoda ();
  void inserisci (_tipoelem);
  _tipoelem min ();
  void cancellaMin ();

private:
  int MAXLUNG;
  _tipoelem *heap;
  int ultimo;

  void fixUp ();
  void fixDown (int, int);
};


template < class T > CodaP < T >::CodaP ():MAXLUNG (100) {
  heap = new _tipoelem[MAXLUNG];
  creaPrioriCoda ();
};

template < class T > CodaP < T >::CodaP (int maxN): MAXLUNG (maxN) {
  heap = new _tipoelem[MAXLUNG];
  creaPrioriCoda ();
};

template < class T > CodaP < T >::~CodaP () {
  delete[] heap;
};

template < class T > void CodaP < T >::creaPrioriCoda () {
  ultimo = 0;
};


template < class T > void CodaP < T >::inserisci (_tipoelem e) {
  assert (ultimo < MAXLUNG);
  heap[++ultimo - 1] = e;
  fixUp ();
};

template < class T > typename CodaP < T >::_tipoelem CodaP < T >::min () {
  assert (ultimo != 0);
  return (heap[0]);
};

template < class T > void CodaP < T >::cancellaMin () {
  assert (ultimo != 0);

  heap[0] = heap[ultimo - 1];

  ultimo--;
  fixDown (1,ultimo);

};


/* Per ripristinare i vincoli dello heap quando la priorità di un nodo è      *
 * cresciuta, ci spostiamo nello heap verso l'alto, scambiando, se necessario,*
 * il nodo in posizione k con il suo nodo padre (in posizione k/2),           *
 * continuando fintanto che heap[k]<heap[k/2] oppure fino a quando            *
 * raggiungiamo la cima dello heap.                                           */

template < class T > void CodaP < T >::fixUp () {
  int k = ultimo;

  while (k > 1 && heap[k - 1] < heap[k / 2 - 1]) {
      _tipoelem tmp;
      tmp = heap[k - 1];
      heap[k - 1] = heap[k / 2 - 1];
      heap[k / 2 - 1] = tmp;
      k = k / 2;
    }

}

/* Per ripristinare i vincoli dello heap quando la priorità di un nodo si è   *
 * ridotta, ci spostiamo nello heap verso il basso, scambiando, se necessario,*
 * il nodo in posizione k con il minore dei suoi nodi figli e arrestandoci    *
 * quando il nodo al posto k non è più grande di almeno uno dei suoi figli    *
 * oppure quando raggiungiamo il fondo dello heap. Si noti che se N è pari e  *
 * k è N/2, allora il nodo in posizione k ha un solo figlio: questo caso      *
 * particolare deve essere trattato in modo appropriato.                      */

template < class T > void CodaP < T >::fixDown (int k, int N) {

  short int scambio = 1;

  while (k <= N / 2 && scambio) {
      int j = 2 * k;
      _tipoelem tmp;
      if (j < N && heap[j - 1] > heap[j])
				j++;
      if (scambio = (heap[j - 1] < heap[k - 1])) {
				tmp = heap[k - 1];
				heap[k - 1] = heap[j - 1];
				heap[j - 1] = tmp;
				k = j;
			}
  }
};


#endif /* _CODAP_H_ */
