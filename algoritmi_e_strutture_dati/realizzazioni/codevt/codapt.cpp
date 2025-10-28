/** BOZZA **/

template <class T>
class nodo{
  nodo *next;
  T value;
};

template <class T>
class queue{
public:
  queue(){
    head = tail = nullptr;
    s = 0;
  }
  ~queue(){
    while(!empty())
      remove();
  }
  empty(){
    return (head == nullptr);
  }
  size(){ return s;}
  insert(T v){
    nodo *tmp = new nodo();
    if (empty())
      head = tail = tmp;
    else
      tail->next = tmp;
    tmp->next = nullptr;
    tmp->value = v;
    tail = tmp;
    s++;
  }
  remove(){
    nodo *tmp = head;
    head = head->next;
    delete tmp;
    if (empty()) 
        tail=nullptr;
    s--;
  }
  
private:
  nodo* head;
  nodo* tail;
  int s;
}

h --> []  <-- t
  


