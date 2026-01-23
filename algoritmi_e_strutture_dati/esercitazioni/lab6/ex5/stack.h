#ifndef _STACK_H
#define _STACK_H

#include "../../tipi_di_dato/vector/vector.h"
#include <iostream>
#include <stdexcept>

template <class T>
class stack {
	public:
		stack();
		stack(size_t);
		stack(const stack<T>&);

		bool empty() const;
		T top() const;
		void pop();
		void push(const T&);
		size_t size() const;

		bool operator==(const stack<T>&) const;
		stack<T>& operator=(const stack<T>&);
		void print() const;
	private:
		static constexpr size_t STD_DIM = 10;
		myvec::vector<T> m_elems;
};

template <class T>
stack<T>::stack() : m_elems(STD_DIM) {}

template <class T>
stack<T>::stack(size_t dim) : m_elems(dim) {}

template <class T>
stack<T>::stack(const stack<T>& s) : m_elems(s.m_elems) {}


template <class T>
bool stack<T>::empty() const {
	return m_elems.size() == 0;
}

template <class T>
T stack<T>::top() const {
	return m_elems.at(m_elems.size() - 1);
}

template <class T>
void stack<T>::pop() {
	m_elems.pop_back();
}

template <class T>
void stack<T>::push(const T& e) {
	bool found = false;
	for (size_t i = 0; i < m_elems.size(); ++i) {
		if (m_elems.at(i) == e)
			found = true;
	}
	if (!found) {
		m_elems.push_back(e);
	} else {
		throw std::runtime_error("This element is already in the stack");
	}
}

template <class T>
size_t stack<T>::size() const {
	return m_elems.size();
}

template <class T>
bool stack<T>::operator==(const stack<T>& s) const {
	return m_elems == s.m_elems;
}

template <class T>
stack<T>& stack<T>::operator=(const stack<T>& s) {
	if (this != &s) {
		m_elems = s.m_elems;
	}
	return *this;
}

template <class T>
void stack<T>::print() const {
	m_elems.print();
}

#endif
