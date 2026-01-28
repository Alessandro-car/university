#ifndef NTREE_H_
#define NTREE_H_

#include <algorithm>
template <class T>
class ntree;

template <class T>
class node {
	friend ntree<T>;
	public:
		node() :
			m_parent(nullptr), m_sibling(nullptr), m_son(nullptr), m_value(T())
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
		typedef T value_type;

		ntree();
		ntree(const ntree<T>&);
		~ntree();
		bool empty() const;
		node<T>* root() const;
		node<T>* parent(node<T>&) const;
		bool leaf(node<T>&) const;
		node<T>* first_son(node<T>&) const;
		bool last_sibling(node<T>&) const;
		node<T>* next_sibling(node<T>&) const;
		value_type read(node<T>&) const;
		void write(value_type, node<T>&);
		void insert_root();
		void insert_subtree(node<T>*, node<T>*, ntree<T>&);
		void delete_subtree(node<T>*);
		ntree<T>& operator=(const ntree<T>&);
		bool operator==(const ntree<T>&) const;
	private:
		void delete_nodes(node<T>*);
		node<T>* copy_tree(node<T>*);
		bool compare_tree(node<T>*, node<T>*) const;
		node<T>* m_root;
};

template <class T>
ntree<T>::ntree() {
	m_root = nullptr;
}

template <class T>
ntree<T>::ntree(const ntree<T>& nt) {
	m_root = copy_tree(nt.m_root);
}

template <class T>
ntree<T>::~ntree() {
	delete_nodes(m_root);
}

template <class T>
bool ntree<T>::empty() const {
	return m_root == nullptr;
}

template <class T>
node<T>* ntree<T>::root() const {
	return m_root;
}

template <class T>
node<T>* ntree<T>::parent(node<T>& n) const {
	if (n.m_parent != nullptr)
		return n.m_parent;
	return nullptr;
}

template <class T>
bool ntree<T>::leaf(node<T>& n) const {
	return n.m_son == nullptr;
}

template <class T>
node<T>* ntree<T>::first_son(node<T>& n) const {
	if (n.m_son != nullptr)
		return n.m_son;
	return nullptr;
}

template <class T>
bool ntree<T>::last_sibling(node<T>& n) const {
	return n.m_sibling == nullptr;
}

template <class T>
node<T>* ntree<T>::next_sibling(node<T>& n) const {
	if (n.m_sibling != nullptr)
		return n.m_sibling;
	return nullptr;
}

template <class T>
typename ntree<T>::value_type ntree<T>::read(node<T>& n) const {
	return n.m_value;
}

template <class T>
void ntree<T>::write(value_type v, node<T>& n) {
	n.m_value = v;
}

template <class T>
void ntree<T>::insert_root() {
	if (m_root == nullptr) {
		m_root = new node<T>;
		m_root->m_parent = nullptr;
		m_root->m_sibling = nullptr;
		m_root->m_son = nullptr;
	}
}

template <class T>
void ntree<T>::insert_subtree(node<T>* first, node<T>* n, ntree<T>& nt) {
	if (nt.empty())
		return;
	node<T>* sub_root = copy_tree(nt.m_root);
	sub_root->m_parent = n;
	if (first == n) {
		sub_root->m_sibling = n->m_son;
		n->m_son = sub_root;
	} else {
		sub_root->m_sibling = first->m_sibling;
		first->m_sibling = sub_root;
	}
}

template <class T>
void ntree<T>::delete_subtree(node<T>* n) {
	if (n == nullptr)
		return;

	if (n->m_parent != nullptr) {
		if (n->m_parent->m_son == n) {
			n->m_parent->m_son = n->m_sibling;
		} else {
			node<T>* prev_sibling = n->m_parent->m_son;
			while (prev_sibling != nullptr && prev_sibling->m_sibling != n) {
				prev_sibling = prev_sibling->m_sibling;
			}
			if (prev_sibling != nullptr)
				prev_sibling->m_sibling = n->m_sibling;
		}
	}
	delete_nodes(n);
}

template <class T>
ntree<T>& ntree<T>::operator=(const ntree<T>& nt) {
	if (this != &nt) {
		delete_subtree(m_root);
		m_root = copy_tree(nt.m_root);
	}
	return *this;
}

template <class T>
bool ntree<T>::operator==(const ntree<T>& nt) const {
	return compare_tree(m_root, nt.m_root);
}

template <class T>
void ntree<T>::delete_nodes(node<T>* n) {
	if (n == nullptr)
		return;

	node<T>* child = n->m_son;
	while (child != nullptr) {
		node<T>* next = child->m_sibling;
		delete_nodes(child);
		child = next;
	}
	delete n;
}

template <class T>
node<T>* ntree<T>::copy_tree(node<T>* n) {
	if (n == nullptr)
	 	return nullptr;

	node<T>* new_node = new node<T>;
	new_node->m_value = n->m_value;
	new_node->m_son = copy_tree(n->m_son);
	node<T>* current_child = new_node->m_son;
	while (current_child != nullptr) {
		current_child->m_parent = new_node;
		current_child = current_child->m_sibling;
	}
	new_node->m_sibling = copy_tree(n->m_sibling);
	return new_node;

}

template <class T>
bool ntree<T>::compare_tree(node<T>* n1, node<T>* n2) const {
	if (n1 == nullptr && n2 == nullptr)
		return true;
	if (n1 == nullptr || n2 == nullptr)
		return false;
	return n1->m_value == n2->m_value 								&&
				 compare_tree(n1->m_sibling, n2->m_sibling) &&
				 compare_tree(n1->m_son, n2->m_son);
}

#endif
