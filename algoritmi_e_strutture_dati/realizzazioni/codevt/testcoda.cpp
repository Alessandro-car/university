#include "codavt.cpp"
#include <iostream>

using namespace std;

int main(){

  Coda<int> C(3);
  
  C.inCoda(1);
  C.inCoda(2);
  C.inCoda(3);
  C.inCoda(4);
  
  cout << " " << C.leggiCoda();
  C.fuoriCoda();
  C.inCoda(4);
  cout << " " << C.leggiCoda();
  C.fuoriCoda();
  cout << " " << C.leggiCoda();
  C.inCoda(5);
  C.fuoriCoda();
  cout << " " << C.leggiCoda();
  C.fuoriCoda();
  cout << " " << C.leggiCoda();
  C.fuoriCoda();
}
