#ifndef EX1_H_
#define EX1_H_
#include <iostream>
#include "../tipi_di_dato/linked_list/linked_list.h"

using std::cout;
using std::endl;

template <class T>
class set {
	public:
		typedef T value_type;
		typedef list_node<T>* position;
		set();
		set(const set<T>&);
		set(size_t);
		set<T> operator=(const set<T>&);

		bool empty() const;
		size_t size() const;
		position contain(value_type) const;
		bool insert(value_type);
		bool erase(value_type);
		set<T> intersection(const set<T>&);
		set<T> difference(const set<T>&);
		set<T> union_set(const set<T>&);
		bool is_subset(const set<T>&) const;

		bool operator==(const set<T>&);
		void print() const;
	private:
		linked_list<T> m_data;
};

template <class T>
set<T>::set() : m_data() {}

template <class T>
set<T>::set(const set<T>& s) : m_data(s.m_data) {}

template <class T>
set<T>::set(size_t dim) : m_data(dim) {}

template <class T>
set<T> set<T>::operator=(const set<T>& s) {
	if(this != &s)
		m_data = s.m_data;
	return *this;
}

template <class T>
bool set<T>::empty() const {
	return m_data.empty();
}

template <class T>
size_t set<T>::size() const {
	return m_data.size();
}

template <class T>
typename set<T>::position set<T>::contain(value_type e) const {
	position n = m_data.begin();
	while (!m_data.end(n)) {
		if (m_data.read(n) == e)
			return n;
		n = m_data.next(n);
	}
	return nullptr;
}

template <class T>
bool set<T>::insert(value_type e) {
	if (contain(e) == nullptr) {
		m_data.insert(e, m_data.next(m_data.last()));
		return true;
	}
	return false;
}

template <class T>
bool set<T>::erase(value_type e) {
	position p = contain(e);
	if (p != nullptr) {
		m_data.erase(p);
		return true;
	}
	return false;
}

template <class T>
set<T> set<T>::intersection(const set<T>& s) {
	set<T> i_set;
	position p1 = m_data.begin();
	while (!m_data.end(p1)) {
		if (s.contain(m_data.read(p1))) {
			i_set.insert(m_data.read(p1));
		}
		p1 = m_data.next(p1);
	}
	return i_set;
}

template <class T>
set<T> set<T>::difference(const set<T>& s) {
	set<T> d_set;
	position p1 = m_data.begin();
	while (!m_data.end(p1)) {
		if (!s.contain(m_data.read(p1))) {
			d_set.insert(m_data.read(p1));
		}
		p1 = m_data.next(p1);
	}
	return d_set;
}

template <class T>
set<T> set<T>::union_set(const set<T>& s) {
	set<T> u_set = *this;
	position p1 = s.m_data.begin();
	while (!s.m_data.end(p1)) {
		u_set.insert(s.m_data.read(p1));
		p1 = s.m_data.next(p1);
	}
	return u_set;
}

template <class T>
bool set<T>::is_subset(const set<T>& s) const {
	position p1 = m_data.begin();
	while (!m_data.end(p1)) {
		if (!s.contain(m_data.read(p1)))
			return false;
		p1 = m_data.next(p1);
	}
	return true;
}

template <class T>
bool set<T>::operator==(const set<T>& s) {
	if (size() != s.size())
		return false;
	return is_subset(s);
}

template <class T>
void set<T>::print() const {
	position p1 = m_data.begin();
	while (!m_data.end(p1)) {
		cout << "[" << m_data.read(p1) << "]";
		p1 = m_data.next(p1);
	}
	cout << endl;
}

#endif
