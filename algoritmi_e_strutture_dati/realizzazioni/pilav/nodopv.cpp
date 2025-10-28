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
#include "nodopv.h"

using namespace std;

Nodo::Nodo()
{}

Nodo::~Nodo()
{}

Nodo::Nodo(tipoelem label)
{
  elemento=label;
}

void Nodo::setElemento(tipoelem label)
{
  elemento=label;
}

tipoelem Nodo::getElemento() const
{
    return elemento;
}

bool Nodo::operator==(Nodo & n)
{
  return (getElemento() == n.getElemento());
}

std::ostream & operator<<(std::ostream & out, const Nodo & nodo)
{
  return out << nodo.getElemento();
}
