#ifndef _LIST_H
#define _LIST_H

#include <stdexcept>
#define STD_DIM 10

template <class T>
class list {
	public:
		typedef size_t position;
		typedef T type_value;

		list();
		list(int);
		list(const list<T>&);
		~list();

		void create();
		bool empty() const;
		type_value read(position) const;
		void write(type_value, position);
		position begin() const;
		bool end(position) const;
		position next(position) const;
		position previous(position) const;
		void insert(type_value, position);
		void erase(position);

		list<T>& operator=(const list<T>&);
		bool operator==(const list<T>&) const;

	private:
		void change_dimension(int);
		type_value* m_elements;
		int m_dim;
		int m_length;
};

template <class T>
list<T>::list() {
	m_dim = STD_DIM;
	create();
}

template <class T>
list<T>::list(int dim) {
	m_dim = dim;
	create();
}

template <class T>
list<T>::list(const list<T>& l) {
	m_dim = l.m_dim;
	m_length = l.m_length;
	m_elements = new type_value[m_dim];
	for (int i = 0; i < l.m_dim; i++) {
		m_elements[i] = l.m_elements[i];
	}
}

template <class T>
list<T>::~list() {
	delete[] m_elements;
}

template <class T>
void list<T>::create() {
	m_elements = new type_value[m_dim];
	m_length = 0;
}

template <class T>
bool list<T>::empty() const {
	return m_length == 0;
}

template <class T>
typename list<T>::type_value list<T>::read(size_t p) const {
	if (p >= 1 && p <= m_length)
		return m_elements[p - 1];
	throw std::out_of_range("Position out of bounds");
}

template <class T>
void list<T>::write(T elem, size_t p) {
	if (p >= 1 && p <= m_length) {
		m_elements[p - 1] = elem;
	}
}

template <class T>
typename list<T>::position list<T>::begin() const {
	return 1;
}

template <class T>
bool list<T>::end(size_t p) const {
	if (p >= 1 && p <= m_length + 1) {
		return p == m_length + 1;
	}
	return false;
}

template <class T>
typename list<T>::position list<T>::next(size_t p) const {
	if (p >= 1 && p <= m_length) {
		return p + 1;
	}
	return p;
}

template <class T>
typename list<T>::position list<T>::previous(size_t p) const {
	if (p > 1 && p <= m_length) {
		return p - 1;
	}
	return p;
}

template <class T>
void list<T>::insert(T elem, size_t p) {
	if (m_length == m_dim) {
		change_dimension(m_dim * 2);
	}

	if (p >= 1 && p <= m_length + 1) {
		for (int i = m_length; i >= p; i--) {
			m_elements[i] = m_elements[i -1];
		}
		m_elements[p - 1] = elem;
		m_length++;
	}
}

template <class T>
void list<T>::erase(size_t p) {
	if (p >= 1 && p <= m_length) {
		if (!empty()) {
			for (int i = p - 1; i < m_length - 1; i++) {
				m_elements[i] = m_elements[i + 1];
			}
			m_length--;
		}
	}
}

template<class T>
list<T>& list<T>::operator=(const list<T>& l) {
	if (this != &l) {
		m_dim = l.m_dim;
		m_length = l.m_length;
		delete[] m_elements;
		m_elements = new type_value[m_dim];
		for (int i = 0; i < l.m_dim; i++) {
			m_elements[i] = l.m_elements[i];
		}
	}
	return *this;
}

template <class T>
bool list<T>::operator==(const list<T>& l) const {
	if (m_length != l.m_length)
		return false;
	for (int i = 0; i < m_dim; i++) {
		if (m_elements[i] != l.m_elements[i])
			return false;
	}
	return true;
}

template <class T>
void list<T>::change_dimension(int new_dim) {
	list<T> new_list(new_dim);
	new_list.m_length = m_length;
	for (int i = 0; i < m_dim; i++) {
		new_list.m_elements[i] = m_elements[i];
	}
	*this = new_list;
}


#endif
