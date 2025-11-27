#ifndef SET_H
#define SET_H

#include "../vector/vector.h"
#include <stdexcept>

template <class T>
class set {
	public:
		using value_type = T;
		using const_ref = const set&;

		set();
		explicit set(size_t);
		set(const_ref);
		set<T> operator=(const_ref);

		bool empty() const;
		size_t size() const;
		int contain(value_type) const;
		bool insert(value_type);
		bool erase(value_type);
		void clear();
		set<T> union_set(const_ref);
		set<T> intersection(const_ref);
		set<T> difference(const_ref);
		bool is_subset(const_ref) const;

		bool operator==(const_ref) const;
		void print() const;
	private:
		static constexpr size_t STD_DIM = 10;
		myvec::vector<T> m_elems;
};

template <class T>
set<T>::set() : m_elems(STD_DIM) {}

template <class T>
set<T>::set(size_t dim) : m_elems(dim) {}

template <class T>
set<T>::set(const_ref s) : m_elems(s.m_elems) {}

template <class T>
set<T> set<T>::operator=(const_ref s) {
	if (this != &s) {
		m_elems = s.m_elems;
	}
	return *this;
}

template <class T>
bool set<T>::empty() const {
	return m_elems.empty();
}

template <class T>
size_t set<T>::size() const {
	return m_elems.size();
}

template <class T>
int set<T>::contain(value_type e) const {
	if (!empty()) {
		for (size_t i = 0; i < m_elems.size(); ++i) {
			if (m_elems.at(i) == e)
				return i;
		}
	}
	return -1;
}

template <class T>
bool set<T>::insert(value_type e) {
	if (contain(e) != -1) {
		return false;
	}

	m_elems.push_back(e);
	return true;
}

template <class T>
bool set<T>::erase(value_type e) {
	int pos = contain(e);
	if (pos != -1) {
		m_elems.erase(m_elems.begin() + pos);
		return true;
	}
	return false;
}

template <class T>
void set<T>::clear() {
	m_elems.clear();
}

template <class T>
set<T> set<T>::union_set(const_ref s) {
	set<T> u_set = *this;
	for (const auto& elem : m_elems) {
		u_set.insert(elem);
	}
	return u_set;
}

template <class T>
set<T> set<T>::intersection(const_ref s) {
	set<T> i_set;
	for (const auto& elem : m_elems) {
		if (s.contain(elem))
			i_set.insert(elem);
	}
	return i_set;
}

template <class T>
set<T> set<T>::difference(const_ref s) {
	set<T> d_set;
	for (const auto& elem : m_elems) {
		if(!s.contain(elem))
			d_set.insert(elem);
	}
	return d_set;
}

template <class T>
bool set<T>::is_subset(const_ref s) const {
	for (const auto& elem : m_elems) {
		if (!s.contain(elem))
			return false;
	}
	return true;
}

template <class T>
bool set<T>::operator==(const_ref s) const {
	return m_elems == s.m_elems;
}

template <class T>
void set<T>::print() const {
	std::cout << "{";
	for (const auto& elem : m_elems)
		std::cout << elem << ",";
	std::cout << "}" << std::endl;
}

#endif
