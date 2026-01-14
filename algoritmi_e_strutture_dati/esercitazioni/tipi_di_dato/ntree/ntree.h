#ifndef NTREE_H_
#define NTREE_H_

template <class T>
class ntree;

template <class T>
class node {
	friend class ntree;
	public:
		node() :
			m_parent(nullptr), m_sibling(nullptr), m_son(nullptr)
		{}
	private:
		node<T>* m_parent;
		node<T>* m_son;
		node<T>* m_sibling;
		T m_value;
};

template <class T>
class ntree {
	public:
		ntree();
		ntree(const ntree<T>&);
		~ntree();
		bool empty() const;
		node<T>* root() const;
		node<T>* parent(node<T>&) const;
		bool leaf(node<T>&) const;
		node<T>* first_son(node<T>&);
		bool last_sibling(node<T>&) const;
		node<T>* next_sibling(node<T>&);
		void insert_root(node<T>&);
		void insert_subtree(node<T>&, ntree<T>&);
		void delete_subtree(node<T>*);
		ntree<T>& operator=(const ntree<T>&);
		bool operator==(const ntree<T>&) const;
	private:
		node<T>* copy_tree(node<T>*);
		bool compare_tree(node<T>*, node<T>*);
		node<T>* m_root;
};

template <class T>
ntree<T>::ntree() {
	m_root = nullptr;
}

template <class T>
ntree<T>::ntree(const ntree<T>& nt) {
	//m_root = copy_tree(nt.m_root);
}

template <class T>
ntree<T>::~ntree() {
	delete_subtree(m_root);
}

template <class T>
bool ntree<T>::empty() const {
	return m_root == nullptr;
}

#endif
