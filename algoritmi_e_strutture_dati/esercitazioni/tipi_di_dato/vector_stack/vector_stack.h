#ifndef _VECTOR_STACK_H
#define _VECTOR_STACK_H

#include <iostream>

#define STD_DIM 10

template <class T>
class vector_stack {
	public:
		vector_stack();
		vector_stack(size_t);
		vector_stack(const vector_stack<T>&);
		~vector_stack();

		bool empty() const;
		T top() const;
		void pop();
		void push(const T&);
		size_t size() const;

		bool operator==(const vector_stack<T>&) const;
		vector_stack<T>& operator=(const vector_stack<T>&);
	private:
		void change_dimension(size_t);
		T* m_elems;
		size_t m_dim;
		size_t m_length;
};

template <class T>
vector_stack<T>::vector_stack() {
	m_dim = STD_DIM;
	m_elems = new T[m_dim];
	m_length = 0;
}

template <class T>
vector_stack<T>::vector_stack(size_t dim) {
	m_dim = dim;
	m_elems = new T[m_dim];
	m_length = 0;
}

template <class T>
vector_stack<T>::vector_stack(const vector_stack<T>& s) {
	m_dim = s.m_dim;
	m_elems = new T[m_dim];
	m_length = 0;
	for (size_t i = 0; i < s.size(); i++) {
		push(s.m_elems[i]);
	}
}

template <class T>
vector_stack<T>::~vector_stack() {
	delete[] m_elems;
}

template <class T>
bool vector_stack<T>::empty() const {
	return m_length == 0;
}

template <class T>
T vector_stack<T>::top() const {
	if (!empty())
		return m_elems[m_length - 1];
	throw std::out_of_range("The stack is empty");
}

template <class T>
void vector_stack<T>::pop() {
	if (!empty()) {
		m_length--;
	} else {
		throw std::out_of_range("The list is empty");
	}
}

template <class T>
void vector_stack<T>::push(const T& e) {
	if (m_length >= m_dim) {
		change_dimension(m_dim * 2);
	}
	m_elems[m_length++] = e;
}

template <class T>
size_t vector_stack<T>::size() const {
	return m_length;
}

template <class T>
bool vector_stack<T>::operator==(const vector_stack<T>& s) const {
	if (m_length != s.size())
		return false;
	for (size_t i = 0; i < m_length; i++) {
		if (m_elems[i] != s.m_elems[i])
			return false;
	}
	return true;
}

template <class T>
vector_stack<T>& vector_stack<T>::operator=(const vector_stack<T>& s) {
	if (this != &s) {
		m_dim = s.m_dim;
		m_length = s.size();
		delete[] m_elems;
		m_elems = new T[m_dim];
		for (size_t i = 0; i < m_length; i++) {
			push(s.m_elems[i]);
		}
	}

	return *this;
}


template <class T>
void vector_stack<T>::change_dimension(size_t new_dim) {
	vector_stack<T> tmp(new_dim);
	tmp.m_length = m_length;
	for (size_t i = 0; i < m_length; i++) {
		tmp.push(m_elems[i]);
	}

	*this = tmp;
}



#endif
