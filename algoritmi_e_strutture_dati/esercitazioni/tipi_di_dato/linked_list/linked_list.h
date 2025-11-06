#ifndef LINKED_LIST_H_
#define LINKED_LIST_H_

#include <stdexcept>

template <class T>
class linked_list;

template <class T>
class list_node {
	friend linked_list<T>;
	private:
	list_node<T>* m_prev;
	list_node<T>* m_next;
	T m_value;
};

template <class T>
class linked_list {
	public:
		typedef list_node<T>* position;
		typedef T value_type;

		linked_list();
		linked_list(const linked_list&);
		~linked_list();

		bool empty() const;
		position begin() const;
		position last() const;
		position next(const position&) const;
		position prev(const position&) const;
		bool end(const position&) const;
		value_type read(const position&) const;
		void write(value_type, position&);
		void insert(value_type, position);
		void erase(position);
		size_t size() const;

		bool operator==(const linked_list&) const;
		linked_list<T> operator=(const linked_list&);

	private:
		list_node<T>* m_head;
		size_t m_length;
};

template <class T>
linked_list<T>::linked_list() {
	m_head = new list_node<T>;
	m_head->m_next = m_head;
	m_head->m_prev = m_head;
	m_length = 0;
}

template <class T>
linked_list<T>::linked_list(const linked_list& l) {
	m_head = new list_node<T>;
	m_head->m_next = m_head;
	m_head->m_prev = m_head;
	m_length = l.size();
	if(!empty()) {
		position p = l.last();
		while(!end(p)) {
			insert(l.read(p), begin());
			p = l.prev(p);
		}
	}
}

template <class T>
linked_list<T>::~linked_list() {
	while (!empty()) {
		erase(begin());
	}
	delete m_head;
}

template <class T>
bool linked_list<T>::empty() const {
	return m_length == 0;
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
typename linked_list<T>::position linked_list<T>::next(const position& p) const {
	if (!empty())
	{
		if (!end(p))
			return p->m_next;
		throw std::out_of_range("Already at the last");
	}
	throw std::out_of_range("The list is empty");
}

template <class T>
typename linked_list<T>::position linked_list<T>::prev(const position& p) const {
	if (!empty()) {
		if (p != begin())
			return p->m_next;
		throw std::out_of_range("Already at the head");
	}
	throw std::out_of_range("The list is empty");
}

template <class T>
bool linked_list<T>::end(const position& p) const {
	return p == m_head;
}

template <class T>
typename linked_list<T>::value_type linked_list<T>::read(const position& p) const {
	if (!empty())
		return p->m_value;
	throw std::out_of_range("The list is empty");
}

template <class T>
void linked_list<T>::write(value_type e, position& p) {
	if (!empty()) {
		if (!end(p))
				p->m_value = e;
		throw std::out_of_range("Index out of bounds");
	}
	throw std::out_of_range("The list is empty!");
}

template <class T>
void linked_list<T>::insert(value_type e, position p)  {
	list_node<T>* node = new list_node<T>;
	node->m_value = e;
	node->m_prev = p->m_prev;
	node->m_next = p;
	p->m_prev->m_next = node;
	p->m_prev = node;
	m_length++;
}

template <class T>
void linked_list<T>::erase(position p) {
	if (!empty()) {
		if (!end(p)) {
			p->m_prev->m_next = p->m_next;
			p->m_next->m_prev = p->m_prev;
			delete p;
			m_length--;
		}
		throw std::out_of_range("Index out of bounds!");
	}
	throw std::out_of_range("The list is empty");
}

template <class T>
size_t linked_list<T>::size() const {
	return m_length;
}

template <class T>
bool linked_list<T>::operator==(const linked_list<T>& l) const {
	if (m_length != l.size())
		return false;
	position p = begin();
	position pl = l.begin();
	while (!end(p)) {
		if (p->m_value != l.read(pl))
			return false;
		p = next(p);
		pl = l.next(pl);
	}
}

template <class T>
linked_list<T> linked_list<T>::operator=(const linked_list& l) {
	if (this != &l) {
		m_length = l.size();
		~linked_list();
		m_head->m_next = m_head;
		m_head->m_prev = m_head;
		if (!empty()) {
			position p = l.last();
			while(!end(p)) {
				insert(l.read(p), begin());
				p = l.prev(p);
			}
		}
	}
	return *this;
}

#endif
