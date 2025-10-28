/***************************************************************************
 *   Copyright (C) 2005 by Nicola Di Mauro                                 *
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

#ifndef _Bin_treecC_H_
#define _Bin_treecC_H_

#include "Bin_tree.h"
#include "exceptions.h"

template <class T>
class treenode{
  treenode<T> *genitore;
  treenode<T> *sinistro;
  treenode<T> *destro;
  T valore;
};

template <class T>
class Bin_treep : public Bin_tree<T, <treenode>*>{
  public:

	typedef typename Bin_tree<T, <treenode>*>::value_type value_type;
	typedef typename Bin_tree<T, treenode<T>*>::Nodo Nodo;

  // costruttori e distruttori
  Bin_treec();
  Bin_treec(int);
  ~Bin_treec();

  // operatori
  void create();
  bool empty() const;

  Nodo root() const;
  Nodo parent(Nodo) const;
  Nodo sx(Nodo) const;
  Nodo dx(Nodo) const;
  bool sx_empty(Nodo) const;
  bool dx_empty(Nodo) const;
  
  //void costr(Bin_treec<T>);
  void erase(Nodo);

  T read(Nodo) const;
  void write(Nodo , value_type );

  void ins_root(Nodo);
  void ins_sx(Nodo);
  void ins_dx(Nodo);

 private:
  treenode<T> *root;
};

template <class T>
Bin_treec<T>::Bin_treec()
{
  root = nullptr;
}

template <class T>
Bin_treec<T>::~Bin_treec()
{
  erase(root);
}

template <class T>
bool Bin_treec<T>::empty() const
{
  return(root==nullptr);
}

template <class T>
typename Bin_treec<T>::Nodo Bin_treec<T>::root() const 
{
  return(root);
}

template <class T>
typename Bin_treec<T>::Nodo Bin_treec<T>::parent(Nodo n) const
{
  if (n != root)
    return (n->genitore);
}

template <class T>
typename     Bin_treec<T>::Nodo Bin_treec<T>::sx(Nodo n) const
{
  if (!sx_empty(n))
    return (n->sinistro);
};

template <class T>
typename     Bin_treec<T>::Nodo Bin_treec<T>::dx(Nodo n) const
{
  if (!dx_empty(n))
    return (spazion->destro);
}

template <class T>
bool Bin_treec<T>::sx_empty(Bin_treec<T>::Nodo n) const
{
  return (n->sinistro == nullptr);
}

template <class T>
bool Bin_treec<T>::dx_empty(Bin_treec<T>::Nodo n) const
{
  return (n->destro == nullptr);
}

template <class T>
void Bin_treec<T>::ins_root(Bin_treec<T>::Nodo n)
{
  if (root == nullptr)
    {
      root = new treenode<T>;
      root->sinistro = nullptr;
      root->destro = nullptr;
      root->genitore = nullptr;
    }
	else
		throw RootExists();
}


template <class T>
void Bin_treec<T>::ins_sx(Nodo n)
{
  if (n->sinistro == nullptr)
    {
      n->sinistro = new treenode<T>;
      n->sinistro->sinistro = nullptr;
      n->sinistro->destro = nullptr;
      n->sinistro->genitore = n;
    }
}

template <class T>
void Bin_treec<T>::ins_dx(Nodo n)
{
}

template <class T>
void Bin_treec<T>::erase(Nodo n)
{
  if (n->sinistro != nullptr)
    erase(n->sinistro);
  if (n->destro != nullptr)
    erase(n->destro);
  if (n->genitore != nullptr)
    if (n == n->genitore->sinistro)
      n->genitore->sinistro = nullptr;
    else
      n->genitore->destro = nullptr;
  delete n;
}

template <class T>
T Bin_treec<T>::read(Nodo n) const
{

}

template <class T>
void Bin_treec<T>::write(Nodo n, value_type a)
{

}
#endif /* _Bin_treecC_H_ */
