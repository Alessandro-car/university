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
#include <iostream>
#include "pilav.h"

using namespace std;

Pila::Pila()
{
  creaPila();
}

Pila::~Pila()
{}


void Pila::creaPila()
{
  for (int i=0;i<MAXLUNGH;i++)
    {
      elementi[i].setElemento(0);
    }
  testa=0;
}

bool Pila::pilaVuota() const
  {
    return testa==0;
  }

tipoelem Pila::leggiPila() const
{
  return (elementi[testa-1].getElemento());
}

void Pila::fuoriPila()
{
  if (!pilaVuota())
    {
      testa-=1;
    }
  else
    {
      cout<<"nessun elemento nella pila"<<endl;
    }
}

void Pila::inPila(tipoelem el)
{
  if (testa==MAXLUNGH)
    {
      cout<<"raggiunta capacità massima della pila"<<endl;
    }
  else
    {
      elementi[testa].setElemento(el);
      testa++;
    }
}

void stampaPila(Pila & L)
{
  int i;
  for (i = 0; i< L.testa; i++)
    cout << L.elementi[i] << " ";
}
