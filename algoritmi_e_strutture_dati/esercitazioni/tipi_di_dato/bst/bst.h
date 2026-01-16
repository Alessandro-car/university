#ifndef BBST_H_
#define BBST_H_

#include "../bin_tree/bin_tree.h"

template <class T>
class bst {
	public:
		typedef T key;
		bst();
		bst(const bst<T>&);

		bool empty() const;
		node<T>* search(key&) const;
		T read(node<T>&) const;
		node<T>* minimum() const;
		node<T>* maximum() const;
		node<T>* predecessor(node<T>*) const;
		node<T>* successor(node<T>*) const;
		void insert(key&);
		void erase(key&);

		bst<T> operator=(const bst<T>&);
		bool operator==(const bst<T>&) const;
	private:
		node<T>* search_recursive(node<T>*, key&) const;
		node<T>* search_minimum(node<T>*) const;
		node<T>* search_maximum(node<T>*) const;
		bin_tree<T>* m_tree;
};

template <class T>
bst<T>::bst() {
	m_tree = new bin_tree<T>;
}

template <class T>
bst<T>::bst(const bst<T>& bst) {
	m_tree(bst.m_tree);
}

template <class T>
bool bst<T>::empty() const {
	return m_tree->empty();
}

template <class T>
node<T>* bst<T>::search(key& k) const {
	return search_recursive(m_tree->root(), k);
}

template <class T>
T bst<T>::read(node<T>& n) const {
	return m_tree->read(n);
}

template <class T>
node<T>* bst<T>::minimum() const {
	return search_minimum(m_tree->root());
}

template <class T>
node<T>* bst<T>::maximum() const {
	return search_maximum(m_tree->root());
}

template <class T>
node<T>* bst<T>::predecessor(node<T>* n) const {
	if (!m_tree->left_empty(*n))
		return search_maximum(m_tree->left(*n));
	if (m_tree->m_root() != n) {
		node<T>* parent = m_tree->parent(*n);
		while (m_tree->left(*parent) != n) {
			n = parent;
			parent = m_tree->parent(*n);
		}
		return parent;
	}
	return nullptr;
}

template <class T>
node<T>* bst<T>::successor(node<T>* n) const {
	if (!m_tree->right_empty(*n))
		return search_minimum(m_tree->right(*n));
	if (m_tree->root() != n) {
		node<T>* parent = m_tree->parent(*n);
		while (m_tree->right(*parent) == n) {
			n = parent;
			parent = m_tree->parent(*n);
		}
		return parent;
	}

	return nullptr;
}

template <class T>
void bst<T>::insert(key& k) {
	if (empty()) {
		m_tree->insert_root();
		m_tree->write(k, *m_tree->root());
	} else {
		node<T>* n = m_tree->root();
		bool found = true;
		while (found) {
			if (k > m_tree->read(*n) && !m_tree->right_empty(*n))
				n = m_tree->right(*n);
			else if (k < m_tree->read(*n) && !m_tree->left_empty(*n))
				n = m_tree->left(*n);
			else
				found = false;
		}
		if (k > m_tree->read(*n)) {
			m_tree->insert_right(n);
			m_tree->write(k, *m_tree->right(*n));
		} else {
			m_tree->insert_left(n);
			m_tree->write(k, *m_tree->left(*n));
		}
	}
}

template <class T>
void bst<T>::erase(key& k) {
	node<T>* n = search(k);

	if (m_tree->left_empty(*n)) {
		node<T>* tmp = n;
		m_tree->replace_node(n, m_tree->right(*n));
		delete tmp;
	} else if (m_tree->right_empty(*n)) {
		node<T>* tmp = n;
		m_tree->replace_node(n, m_tree->left(*n));
		delete tmp;
	} else {
		node<T>* s = successor(n);
		T s_val = m_tree->read(*s);
		erase(s_val);
		m_tree->write(s_val, *n);
	}
}

template <class T>
bst<T> bst<T>::operator=(const bst<T>& bst) {
	m_tree = bst.m_tree;
	return *this;
}

template <class T>
bool bst<T>::operator==(const bst<T>& bst) const {
	return m_tree == bst.m_tree;
}

template <class T>
node<T>* bst<T>::search_recursive(node<T>* n, key& k) const {
	if (m_tree->read(*n) == k)
		return n;
	if (k < m_tree->read(*n) && !m_tree->left_empty(*n))
		return search_recursive(m_tree->left(*n), k);
	if (k > m_tree->read(*n) && !m_tree->right_empty(*n))
		return search_recursive(m_tree->right(*n), k);
	return nullptr;
}

template <class T>
node<T>* bst<T>::search_minimum(node<T>* n) const {
	if (m_tree->left_empty(*n))
		return n;

	return search_minimum(m_tree->left(*n));

}

template <class T>
node<T>* bst<T>::search_maximum(node<T>* n) const {
	if (m_tree->right_empty(*n))
		return n;

	return search_maximum(m_tree->right(*n));
}

#endif
