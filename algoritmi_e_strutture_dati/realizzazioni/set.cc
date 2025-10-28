template <class T>
set{
public:
    set(int n){
        S = new T[n];
        s = 0;
    }
    bool empty(){
        return s==0;
    }
    void insert(T k){
        if (!member(k)){
            S[s] = k;
            s++;        
        }
    }
    void remove(T k){
        int i;
        for (i=0; i<s; i++)
            if (S[i] == k)
                break;                                        
        for (int j=i; j<s-1; j++)
            S[j]=S[j+1];
        s--;
    }
    int search(T k){
        int i = -1;
        // ricerca binaria
    }

    bool member(T k){
        int i;
        for (i=0; i<s; i++)
            if (S[i] == k)
                return true;
        return false;
    }
    set<T> unione(set<T> & B){
        set<T> A(s + B.s);
        for (int i=0; i<s; i++)
            A.insert(S[i]);
        for (int i=0; i<B.s; i++)
            A.insert(B.S[i]);
        return A;
    }
private:
    T *S;
    int s;
};

A = B.unione(C);










{1,3,2} --> [[1] [2] [3]]


template<class T>
set {
  set() {
    size = 0;
  }
  bool empty { return (size==0);}
  insert(T v) {
    if (!member(v))
      e.insert(v);
    size++;
  }
  remove(T v) {
    e.remove(v);
    size--;
  }
  bool member(T v) {
    return e.search(v);
  }
  void unione(set<T> B)
  {
    for each v in B insert(v);
  }
  
 private:
  OrderedList<T> e;
  int size;
};

template<class T>
set {
  set() {
    e = new T[100];
    size = 0;
  }
  bool empty { return (size==0);}
  insert(T v) {
    for (int i=0; i<size; i++)
      if (e[i] == v)
	break;
    if (i==size)
      e[size++]=v;
  }

  remove(T v) {
    int i;
    for (i=0; i<size; i++)
      if (e[i] == v)
	break;
    if (i<size) {
      for (int j=i; j<size-1; j++)
	e[j]=e[j+1];
      size--;
    }
  }
  
 private:
  T *e;
  int size;
}
