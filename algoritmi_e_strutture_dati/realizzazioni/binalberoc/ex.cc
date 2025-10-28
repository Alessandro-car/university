class histogram
{
public:
  // incrementa di 1 la frequenza del bin v
  void add(int v)
  {
    pair<int, int> *p = D.find(v);
    if (p!=nullptr)
      D.modify(v, p->second + 1);
    else
      D.insert(pair<int,int>(v,1));
  }

  // decrementa di 1 la frequenza del bin v
  void remove(int v){
    pair<int, int> *p = D.find(v);
    if (p!=nullptr)
      if (p->second > 1)
        D.modify(v, p->second - 1);
      else
        D.erase(v);
  }
  // restituisce la moda dell’istogramma (il bin con frequenza massima)
  int mode(){
    if (!D.empty())
      {
        List<int> K = D.keys();
        List<int>::position p;
        int m = K.read(K.begin());
        pair<int, int> *e = D.find(m);
        int max = e->second;
        for (p=K.next(K.begin()); !K.end(p); p = K.next(p)){
          e = D.find(K.read(p));
          if (e->second > max)
            {
              m = e->first;
              max = e->second;
            }
        }
        return m;
      }
  }
  // restituisce la media dell’istogramma (la media dei valori dei bin)
  double mean(){
    double m = 0;
    if (!D.empty())
      {
        pair<int, int> *e = D.find(m);
        List<int> K = D.keys();
        List<int>::position p;
        for (p=K.begin(); !K.end(p); p = K.next(p)){
          e = D.find(K.read(p));
          m + = e->second;
        }
        m /= K.size();
      }
    return m;
  }
  // stampa l’istogramma
  void print(){
    List<int> K = D.keys();
    int min = max = K.read(K.begin());
    pair<int, int> *e;
    List<int>::position p;

    for (p=K.next(K.begin()); !K.end(p); p = K.next(p)){
      e = K.find(K.read(p));
      if (e->first < min)
        min = e->first;
      if (e->first > max)
        max = e->first;
    }
    for (int j=min; j<max; j++){
      e = K.find(j);
      std::cout << j << " ";
      if (e!=nullptr)
        for (int i=0; i<e.second; i++)
          cout << "*";
      std::cout << std::endl;
    }
  }
private:
  dictionary<int, int> D;
};


int conta_somma(Bintree<int> T, int k)
{
  int c = 0;
  conta_somma(T, T.root(), k, c);
  return c;
}

int somma(Bintree<int> T, Bintree<int>::node n)
{
  int s = T.read(n);
  if (!T.sx_empty(n))
    s += somma(T, T.sx(n));
  if (!T.dx_empty(n))
    s += somma(T, T.dx(n));
  return s;
}

int conta_somma(Bintree<int> T, Bintree<int>::node n, int k, int& c)
{
  int sum = 0;
  if (!T.sx_empty(n))
    sum += conta_somma(T, T.sx(n), k, c);
  if (!T.dx_empty(n))
    sum += conta_somma(T, T.dx(n), k, c);
  sum += T.read(n);
  if (sum == k) c++;
  return sum;
}
