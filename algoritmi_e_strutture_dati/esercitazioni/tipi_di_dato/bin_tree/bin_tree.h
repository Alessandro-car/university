#ifndef BIN_TREE_H
#define BIN_TREE_H

#include <iostream>

template <class T>
class bin_tree;

template <class T>
class node {
	public:
		friend bin_tree<T>;
		node() :
			m_parent(nullptr), m_right(nullptr), m_left(nullptr), m_value(T())
		{}
	private:
		node<T>* m_parent;
		node<T>* m_left;
		node<T>* m_right;
		T m_value;
};

template <class T>
class bin_tree {
	public:
		typedef T value_type;

		bin_tree();
		bin_tree(const bin_tree<T>&);
		~bin_tree();
		bool empty() const;
		node<T>* root() const;
		node<T>* parent(const node<T>&) const;
		node<T>* left(const node<T>&) const;
		node<T>* right(const node<T>&) const;
		bool left_empty(const node<T>&) const;
		bool right_empty(const node<T>&) const;
	 	value_type read(const node<T>&) const;
		void write(value_type, node<T>&);
		void insert_root();
		void insert_left(node<T>*);
		void insert_right(node<T>*);
		void insert_subtree(bin_tree<T>&&);
		void delete_subtree(node<T>*);
		bool operator==(const bin_tree<T>&) const;
		bin_tree<T>& operator=(const bin_tree&);
	private:
		node<T>* copy_tree(node<T>*);
		bool compare_tree(node<T>*, node<T>*) const;
		node<T>* m_root;
};

template <class T>
bin_tree<T>::bin_tree() {
	m_root = nullptr;
}


template <class T>
bin_tree<T>::bin_tree(const bin_tree<T>& bt) {
	m_root = copy_tree(bt.m_root);
}


template <class T>
bin_tree<T>::~bin_tree() {
	delete_subtree(m_root);
};

template <class T>
bool bin_tree<T>::empty() const {
	return m_root == nullptr;
}

template <class T>
node<T>* bin_tree<T>::root() const {
	return m_root;
}

template <class T>
node<T>* bin_tree<T>::parent(const node<T>& n) const {
	if (&n != m_root)
		return n.m_parent;
	return nullptr;
}

template <class T>
node<T>* bin_tree<T>::left(const node<T>& n) const {
	if (n.m_left != nullptr)
		return n.m_left;
	return nullptr;
}

template <class T>
node<T>* bin_tree<T>::right(const node<T>& n) const {
	if (n.m_right != nullptr)
		return n.m_right;
	return nullptr;
}

template <class T>
bool bin_tree<T>::left_empty(const node<T>& n) const {
	return n.m_left == nullptr;
}

template <class T>
bool bin_tree<T>::right_empty(const node<T>& n) const {
	return n.m_right == nullptr;
}

template <class T>
typename bin_tree<T>::value_type bin_tree<T>::read(const node<T>& n) const {
	return n.m_value;
}

template <class T>
void bin_tree<T>::write(bin_tree<T>::value_type v, node<T>& n) {
	n.m_value = v;
}

template <class T>
void bin_tree<T>::insert_root() {
	if (empty()) {
		m_root = new node<T>;
		m_root->m_parent = nullptr;
		m_root->m_left = nullptr;
		m_root->m_right = nullptr;
	}
}

template <class T>
void bin_tree<T>::insert_left(node<T>* n) {
	if (n != nullptr && left_empty(*n)) {
		n->m_left = new node<T>;
		n->m_left->m_parent = n;
		n->m_left->m_left = nullptr;
		n->m_left->m_right = nullptr;
	}
}

template <class T>
void bin_tree<T>::insert_right(node<T>* n) {
	if (n != nullptr && right_empty(*n)) {
		n->m_right = new node<T>;
		n->m_right->m_parent = n;
		n->m_right->m_left = nullptr;
		n->m_right->m_right = nullptr;
	}
}

template <class T>
void bin_tree<T>::insert_subtree(bin_tree<T>&& bt) {
	node<T>* new_root = new node<T>;
	node<T>* tmp = m_root;
	new_root->m_parent = nullptr;

	new_root->m_right = bt.m_root;
	if (new_root->m_right != nullptr) {
		new_root->m_right->m_parent = new_root;
	}

	new_root->m_left = tmp;
	if (new_root->m_left != nullptr) {
		new_root->m_left->m_parent = new_root;
	}

	bt.m_root = nullptr;
	m_root = new_root;
}

template <class T>
void bin_tree<T>::delete_subtree(node<T>* n) {
	if (n == nullptr) return;

	if (n->m_left != nullptr)
		delete_subtree(n->m_left);
	if (n->m_right != nullptr)
		delete_subtree(n->m_right);

	if (n->m_parent != nullptr) {
		if (n == n->m_parent->m_right)
			n->m_parent->m_right = nullptr;
		else
			n->m_parent->m_left = nullptr;
	}
	delete n;
}

template <class T>
bool bin_tree<T>::operator==(const bin_tree<T>& bt) const {
	return compare_tree(m_root, bt.root());
}

template <class T>
bin_tree<T>& bin_tree<T>::operator=(const bin_tree& bt) {
	if (this != &bt) {
		delete_subtree(m_root);
		m_root = copy_tree(bt.m_root);
	}
	return *this;
}

template <class T>
node<T>* bin_tree<T>::copy_tree(node<T>* n) {
	if (n == nullptr)
		return nullptr;
	node<T>* new_node = new node<T>;
	new_node->m_value = n->m_value;
	new_node->m_left = copy_tree(n->m_left);
	new_node->m_right = copy_tree(n->m_right);

	return new_node;
}

template <class T>
bool bin_tree<T>::compare_tree(node<T>* n1, node<T>* n2) const {
	if (n1 == nullptr && n2 == nullptr)
		return true;
	if (n1 == nullptr || n2 == nullptr)
		return false;

	return (n1->m_value == n2->m_value) 			 	&&
				 compare_tree(n1->m_left, n2->m_left) &&
				 compare_tree(n1->m_right, n2->m_right);
}

#endif
