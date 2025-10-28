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

#ifndef _CODAVT_
#define _CODAVT_

template < class tipoelem >
class Coda {

public:

  Coda(int n){
    maxlung = n;
    creaCoda();
  }

  ~Coda(){delete[] elementi;}

  void creaCoda(){  
    elementi = new tipoelem[maxlung];
    testa = 0;
    lung = 0;
  }

  bool codaVuota(){
    return (lung == 0);
  }
  
  tipoelem leggiCoda(){  
    if (!codaVuota())
      return (elementi[testa]);
  }

  void fuoriCoda(){
    if (!codaVuota()){
      testa = (testa + 1) % maxlung;
      lung--;
    }
  }

  void inCoda(tipoelem a){
    if (lung != maxlung){
      elementi[(testa+lung) % maxlung] = a;
      lung++;
    }
  }
 
 private:
  tipoelem *elementi;
  int testa, lung, maxlung;
};

#endif //CODAVT_
