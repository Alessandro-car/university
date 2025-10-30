#ifndef VECTOR_LIST_H
#define VECTOR_LIST_H

#include <stdexcept>
#define STD_DIM 10

template <class T>
class vector_list {
	public:
		typedef int position;
		typedef T type_value;

		vector_list();
		vector_list(int);
		vector_list(const vector_list<T>&);
		~vector_list();

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

		vector_list<T>& operator=(const vector_list<T>&);
		bool operator==(const vector_list<T>&) const;

	private:
		void m_change_dimension(int, int);
		type_value* m_elements;
		int m_dim;
		int m_length;
};

template <class T>
vector_list<T>::vector_list() {
	m_dim = STD_DIM;
	this->create();
}

template <class T>
vector_list<T>::vector_list(int dim) {
	m_dim = dim;
	this->create();
}

template <class T>
vector_list<T>::vector_list(const vector_list<T>& l) {
	this->m_dim = l.m_dim;
	this->m_length = l.m_length;
	this->m_elements = new type_value[m_dim];
	for (int i = 0; i < l.m_dim; i++) {
		this->m_elements[i] = l.m_elements[i];
	}
}

template <class T>
vector_list<T>::~vector_list() {
	delete[] m_elements;
}

template <class T>
void vector_list<T>::create() {
	m_elements = new type_value[m_dim];
	m_length = 0;
}

template <class T>
bool vector_list<T>::empty() const {
	return m_length == 0;
}

template <class T>
typename vector_list<T>::type_value vector_list<T>::read(position p) const {
	if (p >= 1 && p <= m_length)
		return m_elements[p - 1];
	throw std::out_of_range("Position out of bounds");
}

template <class T>
void vector_list<T>::write(vector_list<T>::type_value elem, vector_list<T>::position p) {
	if (p >= 1 && p <= m_length) {
		m_elements[p - 1] = elem;
	}
}

template <class T>
typename vector_list<T>::position vector_list<T>::begin() const {
	return 1;
}

template <class T>
bool vector_list<T>::end(position p) const {
	if (p >= 1 && p <= m_length + 1) {
		return p == m_length + 1;
	}
	return false;
}

template <class T>
typename vector_list<T>::position vector_list<T>::next(vector_list<T>::position p) const {
	if (p >= 1 && p < m_length) {
		return p + 1;
	}
	return p;
}

template <class T>
typename vector_list<T>::position vector_list<T>::previous(vector_list<T>::position p) const {
	if (p > 1 && p <= m_length) {
		return p - 1;
	}
	return p;
}

template <class T>
void vector_list<T>::insert(vector_list<T>::type_value elem, vector_list<T>::position p) {
	if (m_length == m_dim) {
		this->m_change_dimension(m_dim, m_dim * 2);
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
void vector_list<T>::erase(vector_list<T>::position p) {
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
vector_list<T>& vector_list<T>::operator=(const vector_list<T>& l) {
	if (this != &l) {
		this->m_dim = l.m_dim;
		this->m_length = l.m_length;
		delete this->m_elements;
		this->m_elements = new type_value[m_dim];
		for (int i = 0; i < l.m_dim; i++) {
			this->m_elements[i] = l.m_elements[i];
		}
	}
	return *this;
}

template <class T>
bool vector_list<T>::operator==(const vector_list<T>& l) const {
	if (this->m_length != l.m_length)
		return false;
	for (int i = 0; i < this->m_dim; i++) {
		if (this->m_elements[i] != l.m_elements[i])
			return false;
	}
	return true;
}

template <class T>
void vector_list<T>::m_change_dimension(int old_dim, int new_dim) {
	vector_list<T> new_list(new_dim);
	for (int i = 0; i < m_dim; i++) {
		new_list.m_elements[i] = m_elements[i];
	}
	delete[] m_elements;
	*this = new_list;
}


#endif
