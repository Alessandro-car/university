#ifndef LINKED_LIST_H
#define LINKED_LIST_H

#include <iostream>
#include <stdexcept>

template <class T>
class linked_list;

template <class T>
class list_node {
	friend class linked_list<T>;
	private:
		T m_elem;
		list_node* m_prev;
		list_node* m_next;
};

template <class T>
class linked_list {
	public:
		typedef list_node<T>* type_value;
		typedef list_node<T>* position;

		linked_list();
		linked_list(const linked_list<T>&);
		~linked_list();

		void create();
		bool empty() const;
		type_value read(position) const;
		void write(const type_value&, position);
		position begin() const;
		position last() const;
		bool end(position) const;
		position next(position) const;
		position previous(position) const;
		void insert(type_value, position);
		void erase(position);

		linked_list<T>& operator=(const linked_list<T>&);
		bool operator==(const linked_list<T>&) const;

	private:
		list_node<T>* m_head;
		size_t m_length;
};

template <class T>
linked_list<T>::linked_list() {
	m_head = new list_node<T>;
	m_head->m_prev = m_head;
	m_head->m_next = m_head;
	m_length = 0;
}

template <class T>
linked_list<T>::linked_list(const linked_list<T>& l) {
	m_length = l.m_length;
	m_head = new list_node<T>;
	m_head->m_prev = m_head;
	m_head->m_next = m_head;
	if (!l.empty()) {
		position p = l.last();
		for (int i = 0; i < m_length; i++) {
			insert(l.read(p), begin());
			p = l.previous(p);
		}
	}
}

template <class T>
linked_list<T>::~linked_list() {
	while(!empty()) {
		erase(begin());
	}
	delete m_head;
}

template <class T>
void linked_list<T>::create() {
	if (empty())
		m_length = 0;
}

template <class T>
bool linked_list<T>::empty() const {
	return m_length == 0;
}

template <class T>
typename linked_list<T>::type_value linked_list<T>::read(position p) const {
	if (!end(p)) {
		return p->m_elem;
	}
	throw std::out_of_range("Index out of bounds!");
}

template <class T>
void linked_list<T>::write(const type_value& el, position p) {
	if (!end(p))
		p->m_elem = el->m_elem;
}

template <class T>
typename linked_list<T>::position linked_list<T>::begin() const {
	return m_head->m_next;
}

template <class T>
typename linked_list<T>::position linked_list<T>::last() const {
	return m_head->m_prev;
}

template <class T>
bool linked_list<T>::end(position p) const {
	return p == m_head;
}

template <class T>
typename linked_list<T>::position linked_list<T>::next(position p) const {
	return p->m_next;
}

template <class T>
typename linked_list<T>::position linked_list<T>::previous(position p) const {
	if (!end(p))
		return p->m_prev;
	throw std::out_of_range("Already at the head!");
}

template <class T>
void linked_list<T>::insert(type_value elem, position p) {
	elem->m_prev = p->m_prev;
	elem->m_next = p;
	p->m_prev->m_next = elem;
	p->m_prev = elem;
	m_length++;
}

template <class T>
void linked_list<T>::erase(position p) {
	if (!empty() && !end(p)) {
		p->m_prev->m_next = p->m_next;
		p->m_next->m_prev = p->m_prev;
		delete p;
		m_length--;
	}
}

template <class T>
linked_list<T>& linked_list<T>::operator=(const linked_list<T>& l) {
	if (this != &l) {
		m_length = l.m_length;
		~linked_list();
		m_head = new list_node<T>;
		m_head->m_next = m_head;
		m_head->m_prev = m_head;
		if (!l.empty()) {
			position p = l.last();
			for (int i = 0; i < l.m_length; i++) {
				insert(l.read(p), begin());
				p = l.previous(p);
			}
		}
	}
	return *this;
}

template <class T>
bool linked_list<T>::operator==(const linked_list<T>& l) const {
	if (l.m_length != m_length)
		return false;
	position p = begin();
	position pl = l.begin();
	for (int i = 0; i < m_length; i++) {
		if (p->m_elem != pl->m_elem)
			return false;
		p = next(p);
		pl = next(pl);
	}
	return true;
}

#endif


