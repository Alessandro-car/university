#ifndef _QUEUE_H
#define _QUEUE_H

#include "../vector/vector.h"

template <class T>
class queue {
	public:
		queue() noexcept;
		explicit queue(size_t);
		queue(const queue<T>&);
		bool empty() const;
		size_t size() const;
		T front() const;
		T back() const;
		void push(const T&);
		void pop();
		void print() const;

		bool operator==(const queue<T>&) const;
		queue<T> operator=(const queue<T>&);

	private:
		static constexpr size_t STD_DIM = 10;
		myvec::vector<T> m_elems;
};

template <class T>
queue<T>::queue() noexcept : m_elems(STD_DIM) {}

template <class T>
queue<T>::queue(size_t dim) : m_elems(dim) {}

template <class T>
queue<T>::queue(const queue<T>& q) : m_elems(q.m_elems) {}

template <class T>
bool queue<T>::empty() const {
	return m_elems.empty();
}

template <class T>
size_t queue<T>::size() const{
	return m_elems.size();
}

template <class T>
T queue<T>::front() const {
	return m_elems.front();
}

template <class T>
T queue<T>::back() const {
	return m_elems.back();
}

template <class T>
void queue<T>::push(const T& e) {
	m_elems.push_back(e);
}

template <class T>
void queue<T>::pop() {
	m_elems.erase(m_elems.begin());
}

template <class T>
void queue<T>::print() const {
	m_elems.print();
}

template <class T>
bool queue<T>::operator==(const queue<T>& q) const {
	return m_elems == q.m_elems;
}

template <class T>
queue<T> queue<T>::operator=(const queue<T>& q) {
	if (this != &q) {
		m_elems = q.m_elems;
	}
	return *this;
}

#endif
