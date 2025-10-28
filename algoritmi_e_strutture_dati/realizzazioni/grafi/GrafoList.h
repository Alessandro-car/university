#ifndef GRAFOLIST_H
#define GRAFOLIST_H

#include "Grafo.h"
#include "list_vector.h"

class NodoG{
 public:
  NodoG(int i){
    nodoId = i;
  }
  NodoG(){
  }
  int getId(){ return nodoId; }
  void setId(int id) {nodoId = id;}
 private:
  int nodoId;
};


template<class P>
class InfoArco {
 public:
  P peso;
  NodoG _to;
};


template<class E, class P> 
  class InfoNodo {
 public:
  E   etichetta;
  bool vuoto;
  ListPointer<InfoArco<P> > archi;
    
  InfoNodo(){ 
    info = 0; 
    vuoto = true; 
  }
};



template<class E, class P>
  class GrafoList : public Grafo<E, P, NodoG > {
 public:
    typedef E Etichetta;
    typedef P Peso;
    typedef NodoG Nodo;
    typedef Arco_<Peso, Nodo> Arco;
    typedef Grafo<Etichetta, Peso, Nodo> Grafo_;
    typedef typename Grafo_::ListaNodi ListaNodi;
    typedef typename Grafo_::ListaNodiPos ListaNodiPos;

    GrafoList(int);
    ~GrafoList();

    bool vuoto() const;
    void insNodo(NodoG&);
    void insArco(Nodo, Nodo, Peso);
    void cancNodo(Nodo);
    void cancArco(Nodo, Nodo);
    //    bool esisteNodo(Nodo);
    //    bool esisteArco(Arco);
    ListaNodi Adiacenti(Nodo) const ;
    ListaNodi list_nodi() const ;
    Etichetta leggiEtichetta(Nodo) const ;
    void scriviEtichetta(Nodo, Etichetta) ;
    Peso leggiPeso(Nodo, Nodo) const ;
    void scriviPeso(Nodo, Nodo, Peso) ;

    int numNodi(){
      return nodi;
    };
    int numArchi(){
      return archi;
    };


 private:
    InfoNodo<E,P>* matrice;
    int dimensione;
    int nodi;
    int archi;
};


template<class E, class P>
  GrafoList<E, P>::GrafoList(int _dimensione){
  dimensione = _dimensione;
  nodi = 0;
  archi = 0;
  matrice = new InfoNodo<E,P>[dimensione];
  for (int i=0; i<dimensione; i++)
    matrice[i].archi.create();
}

template<class E, class P>
  GrafoList<E, P>::~GrafoList() {
  delete [] matrice;
}

template<class E, class P>
  bool GrafoList<E, P>::vuoto() const {
  return (nodi == 0);
}

template<class E, class P>
  void GrafoList<E, P>::insNodo(Nodo& N) {
  int n = 0;
  if (nodi < dimensione){
    while (matrice[n].vuoto == false)
      n++;
    nodi++;
    matrice[n].vuoto = false;
  }
  N.setId(n);
}

template<class E, class P>
  void GrafoList<E, P>::insArco(Nodo n1, Nodo n2, P peso) {
  InfoArco<P> I;
  I.peso = peso;
  I._to = n2;
  matrice[n1.getId()].archi.insert(I, matrice[n1.getId()].archi.begin());
  archi++;
}


template<class E, class P>
  void GrafoList<E, P>::cancNodo(Nodo n) {
  // ATTENZIONE: controllare prima che non ci siano archi uscenti o entranti in n
  bool canc = true;
  int i;
  for (i=0; i < dimensione && canc; i++) 
    if (!matrice[n.getId()].archi.empty()) 
      canc = false;
  // TODO: implementare il controllo sugli archi entranti

  if (canc){
    // la lista  matrice[n.getId()].archi è vuota;
    matrice[n.getId()].vuoto = true;
    
  }
}

template<class E, class P>
  void GrafoList<E, P>::cancArco(Nodo n1, Nodo n2){
	typename ListPointer<InfoArco<P> >::position p; 
	p = matrice[n1.getId()].archi.begin();
	bool trovato = false;
	while (!matrice[n1.getId()].archi.end(p) && !trovato){
		if (matrice[n1.getId()].archi.read(p)._to.getId() == n2.getId())
			trovato = true;
		else 
				p = matrice[n1.getId()].archi.next(p);
	}
	if (trovato)
		matrice[n1.getId()].archi.erase(p);
  archi--;
}

template<class E, class P>
  typename GrafoList<E, P>::ListaNodi GrafoList<E, P>::Adiacenti(Nodo n) const{
  ListaNodi list;

  // TODO: costruire la lista dei nodi dalla lista degli adiacenti matrice[n.getId()].archi
  return list;
}

template<class E, class P>
  typename GrafoList<E, P>::ListaNodi GrafoList<E, P>::list_nodi() const {
  ListaNodi list;
  for (int i = 0; i < dimensione; i++)
    if (!matrice[i].vuoto) 
      list.insert(new NodoG(i), list.begin());
  return list;
}

template<class E, class P>
  E GrafoList<E, P>::leggiEtichetta(Nodo n) const {
  return matrice[n.getId()].etichetta;
}

template<class E, class P>
  void GrafoList<E, P>::scriviEtichetta(Nodo n, E etichetta) {
  matrice[n.getId()].etichetta = etichetta;
}

template<class E, class P>
  P GrafoList<E, P>::leggiPeso(Nodo n1, Nodo n2) const {
	typename ListPointer<InfoArco<P> >::position p; 
	p = matrice[n1.getId()].archi.begin();
	bool trovato = false;
	while (!matrice[n1.getId()].archi.end(p) && !trovato){
		if (matrice[n1.getId()].archi.read(p)._to.getId() == n2.getId())
			trovato = true;
		else 
				p = matrice[n1.getId()].archi.next(p);
	}
	if (trovato)
		return matrice[n1.getId()].archi.read(p).peso;
}

template<class E, class P>
  void GrafoList<E, P>::scriviPeso(Nodo n1, Nodo n2, P peso) {
	typename ListPointer<InfoArco<P> >::position p; 
	p = matrice[n1.getId()].archi.begin();
	bool trovato = false;
	while (!matrice[n1.getId()].archi.end(p) && !trovato){
		if (matrice[n1.getId()].archi.read(p)._to.getId() == n2.getId())
			trovato = true;
		else 
				p = matrice[n1.getId()].archi.next(p);
	}
	if (trovato){
		InfoArco<P> I;
		I.peso = peso;
		I._to = n2;
		matrice[n1.getId()].archi.write(I,p);
	}
}

#endif
