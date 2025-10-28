int height(bintree<T> B){
  if (!B.empty())
    height(B, B.root(), 0);
  else
    return 0;
}

int height(bintree<T> B, bintree<T>::node n, int d){
  
}

bool is_height_balanced(const Bintree< _value_type > &B){
  if (!B.empty)
    return is_height_balanced(B, B.root());
  return true;
}

bool is_height_balanced(const Bintree<T> &B
                        Bintree<T>::node n){
  if (B.foglia(n))
    return true;
  else {
    int lh = 0, rh = 0;
    if (!B.sx_empty(n))
      lh = height(B, B.sx(n));
    if (!B.dx_empty(n))
      rh = height(B, B.dx(n));
    if (abs(lh-rh)>1)
      return false;
    bool balanced = true;
    if (!B.sx_empty(n) && balanced )
      balanced = is_height_balanced(B, B.sx(n));
    if (!B.dx_empty(n) && balanced)
      balanced = is_height_balanced(B, B.dx(n));
    return balanced;
  }
}


template<class _value_type>
class balanced_tree{
  /* Stabilisce se l’albero è bilanciato in altezza.
   * Un albero binario è bilanciato in altezza se
   * a) è vuoto, o b) se per ogni nodo
   * le altezze dei suoi due sottoalberi differiscono al
   * più di uno e i due sottoalberi
   * sono bilanciati in altezza.
   */
  bool is_height_balanced(const Bintree< _value_type > &B){
    
  }
  /* Stabilisce se tutti i nodi non foglia dell’albero
   * hanno esattamente due figli */
  bool complete_nodes(const Bintree< _value_type > &B);
};


void odd(bintree<int> &T,
        bintree<int>::node n,
        int k,
        int d,
        int c){
  if (T.foglia(n) && d==k)
      c += ((T.read(n) % 2) == 1);
  else {
    if (d==k)
      c += ((T.read(n) % 2) == 1);
    else {
      if (d<k && !T.sx_empty())
          odd(T, T.sx(n), k, d+1, c);
      if (d<k && !T.dx_empty())
          odd(T, T.dx(n), k, d+1, c);
    }
  }
}

}


int odd(bintree<int> &T, int k){
  int c = 0;
  odd(T, T.root(), k, 0, c);
}

template <class T>
T somma (Tree<T> &A, Tree<T>::node n)
{
  int S = 0;
  if (!A.foglia(n)){
    Tree<T>::node f = A.primofiglio(n);
    while (!A.ultimofratello(f)){
      S += somma(A, f);
      f = A.succfratello(f);
    }
    S += somma(A, f);
    A.write(n, S+A.read(n));
    return (A.read(n));
  } else return T.read(n);
}

template <class T>
somma (Tree<T> &A)
{
  somma(A, A.root());
}


template <class T>
heapsort(T *a, int n)
{
  for (int i=1; i<n; i++)
    fixUp(i);
  for (int i=0; i<n; i++)
    {
      swap(a, 0, n-i);
      fixDown(1,n-1-i);
    }
}
