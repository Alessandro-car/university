#ifndef EX3_H_
#define EX3_H_
#include <iostream>
#include "linear_list.h"

using std::cout;
using std::endl;

template <class T>
class set {
	public:
		typedef T value_type;

		set();
		set(size_t);
		set(const set<T>&);
		set<T> operator=(const set<T>&);

		bool empty() const;
		size_t size() const;
		int contain(value_type) const;
		bool insert(value_type);
		bool erase(value_type);
		set<T> union_set(const set<T>&);
		set<T> difference(const set<T>&);
		set<T> intersection(const set<T>&);
		bool is_subset(const set<T>&) const;
		bool operator==(const set<T>&) const;
		void print() const;
	private:
		list<T> m_data;
};

template <class T>
set<T>::set() : m_data() {}

template <class T>
set<T>::set(size_t dim) : m_data(dim) {}

template <class T>
set<T>::set(const set<T>& s) : m_data(s.m_data) {}

template <class T>
set<T> set<T>::operator=(const set<T>& s) {
	if (this != &s)
		m_data = s.m_data;
	return *this;
}

template <class T>
bool set<T>::empty() const {
	return m_data.empty();
}

template <class T>
size_t set<T>::size() const {
	size_t count = 0;
	size_t i = m_data.begin();
	while (!m_data.end(i)) {
		++count;
		i = m_data.next(i);
	}
	return count;
}

template <class T>
int set<T>::contain(value_type e) const {
	size_t i = m_data.begin();
	while (!m_data.end(i)) {
		if (m_data.read(i) == e)
			return i;
		i = m_data.next(i);
	}
	return -1;
}

template <class T>
bool set<T>::insert(value_type e) {
	if (contain(e) == -1) {
		m_data.insert_linear(e);
		return true;
	}
	return false;
}

template <class T>
bool set<T>::erase(value_type e) {
	size_t i = contain(e);
	if (i != -1) {
		m_data.erase(i);
		return true;
	}
	return false;
}

template <class T>
set<T> set<T>::union_set(const set<T>& s) {
	set<T> u_set = *this;
	size_t i = s.m_data.begin();
	while (!s.m_data.end(i)) {
		if (u_set.contain(s.m_data.read(i)) == -1)
			u_set.insert(s.m_data.read(i));
		i = s.m_data.next(i);
	}
	return u_set;
}

template <class T>
set<T> set<T>::difference(const set<T>& s) {
	set<T> d_set;
	size_t i = m_data.begin();
	while (!m_data.end(i)) {
		if (s.contain(m_data.read(i)) == -1)
			d_set.insert(m_data.read(i));
		i = m_data.next(i);
	}
	return d_set;
}

template <class T>
set<T> set<T>::intersection(const set<T>& s) {
	set<T> i_set;
	size_t i = m_data.begin();
	while (!m_data.end(i)) {
		if (s.contain(m_data.read(i)) != -1)
			i_set.insert(m_data.read(i));
		i = m_data.next(i);
	}
	return i_set;
}

template <class T>
bool set<T>::is_subset(const set<T>& s) const {
	size_t i = m_data.begin();
	while (!m_data.end(i)) {
		if (s.contain(m_data.read(i)) == -1)
			return false;
		i = m_data.next(i);
	}
	return true;
}

template <class T>
bool set<T>::operator==(const set<T>& s) const {
	if (size() != s.size())
		return false;
	return is_subset(s);
}

template <class T>
void set<T>::print() const {
	size_t i = m_data.begin();
	while (!m_data.end(i)) {
		cout << "[" << m_data.read(i) << "]";
		i = m_data.next(i);
	}
	cout << endl;
}

#endif
