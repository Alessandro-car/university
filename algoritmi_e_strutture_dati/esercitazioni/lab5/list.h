#ifndef _LIST_H
#define _LIST_H

#include <iterator>
#include <stdexcept>
#include "../tipi_di_dato/vector/vector.h"

template <class T>
class list {
	public:
		typedef size_t position;
		typedef T type_value;

		list();
		list(size_t);
		list(const list<T>&);

		bool empty() const;
		type_value read(position) const;
		void write(type_value, position);
		position begin() const;
		bool end(position) const;
		position next(position) const;
		position previous(position) const;
		void insert(type_value, position);
		void insert(size_t);
		void insert_linear(type_value);
		void erase(position);
		bool in(T) const;
		void reverse();
		void merge(const list<T>&);
		list<T>& operator=(const list<T>&);
		bool operator==(const list<T>&) const;

	private:
		myvec::vector<T> m_elements;
};

template <class T>
list<T>::list() : m_elements() {}

template <class T>
list<T>::list(size_t dim) : m_elements(dim) {}

template <class T>
list<T>::list(const list<T>& l) : m_elements(l.m_elements) {}

template <class T>
bool list<T>::empty() const {
	return m_elements.empty();
}

template <class T>
typename list<T>::type_value list<T>::read(size_t p) const {
	return m_elements.at(p);
}

template <class T>
void list<T>::write(T elem, size_t p) {
	if (p < m_elements.size())
		m_elements[p] = elem;
}

template <class T>
typename list<T>::position list<T>::begin() const {
	return 0;
}

template <class T>
bool list<T>::end(size_t p) const {
	return (p + m_elements.begin()) == m_elements.end();
}

template <class T>
typename list<T>::position list<T>::next(size_t p) const {
	if (p >= 0 && p < m_elements.size()) {
		return p + 1;
	}
	return p;
}

template <class T>
typename list<T>::position list<T>::previous(size_t p) const {
	if (p >= 1 && p < m_elements.size()) {
		return p - 1;
	}
	return p;
}

template <class T>
void list<T>::insert(T elem, size_t p) {
	m_elements.insert(p + m_elements.begin(), elem);
}

template <class T>
void list<T>::insert(size_t elem) {
	myvec::vector<size_t> digits;
	while (elem > 0) {
		size_t digit = elem % 10;
		digits.push_back(digit);
		elem /= 10;
	}
	for (int i = digits.size() - 1; i >= 0; i--)
		insert(digits.at(i), m_elements.size());
}

template <class T>
void list<T>::insert_linear(T elem) {
	size_t i = begin();
	while (!end(i)) {
		if (elem <= read(i))
			break;
		i = next(i);
	}
	insert(elem, i);
}

template <class T>
void list<T>::erase(size_t p) {
	m_elements.erase(p + m_elements.begin());
}

template <class T>
bool list<T>::in(T elem) const {
	size_t i = 0;
	while (!end(i)) {
		if (read(i) == elem)
			return true;
		i = next(i);
	}
	return false;
}

template <class T>
void list<T>::reverse() {
	size_t end = m_elements.size() - 1;
	for (size_t i = 0; i < m_elements.size() / 2; ++i) {
		T tmp = read(i);
		write(read(end), i);
		write(tmp, end);
		--end;
	}
}

template <class T>
void list<T>::merge(const list<T>& l) {
	size_t j = l.begin();
	while (!l.end(j)) {
		if (!in(l.read(j)))
			insert_linear(l.read(j));
		j = l.next(j);
	}
}

template<class T>
list<T>& list<T>::operator=(const list<T>& l) {
	m_elements = l.m_elements;
	return *this;
}

template <class T>
bool list<T>::operator==(const list<T>& l) const {
	return m_elements == l.m_elements;
}


#endif
