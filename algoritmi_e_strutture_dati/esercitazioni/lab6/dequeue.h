#ifndef DEQUEUE_H_
#define DEQUEUE_H_

#include "../tipi_di_dato/vector/vector.h"

template <class T>
class dequeue {
	public:
		dequeue();
		dequeue(size_t);
		dequeue(const dequeue<T>&);

		bool empty() const;
		size_t size() const;
		T front() const;
		T back() const;
		void push_front(T);
		void push_back(T);
		void pop_front();
		void pop_back();

		bool operator==(const dequeue<T>&) const;
		dequeue<T> operator=(const dequeue<T>&);

		void print() const;
	private:
		myvec::vector<T> m_data;
};

template <class T>
dequeue<T>::dequeue() : m_data() {}

template <class T>
dequeue<T>::dequeue(size_t dim) : m_data(dim) {}

template <class T>
dequeue<T>::dequeue(const dequeue<T>& q) : m_data(q.m_data) {}

template <class T>
bool dequeue<T>::empty() const {
	return m_data.empty();
}

template <class T>
size_t dequeue<T>::size() const {
	return m_data.size();
}

template <class T>
T dequeue<T>::front() const {
	return m_data.front();
}

template <class T>
T dequeue<T>::back() const {
	return m_data.back();
}

template <class T>
void dequeue<T>::push_front(T e) {
	m_data.insert(m_data.begin(), e);
}

template <class T>
void dequeue<T>::push_back(T e) {
	m_data.push_back(e);
}

template <class T>
void dequeue<T>::pop_front() {
	m_data.erase(m_data.begin());
}

template <class T>
void dequeue<T>::pop_back() {
	m_data.pop_back();
}

template <class T>
bool dequeue<T>::operator==(const dequeue<T>& q) const {
	return m_data == q.m_data;
}

template <class T>
dequeue<T> dequeue<T>::operator=(const dequeue<T>& q) {
	if (this != &q)
		m_data = q.m_data;
	return *this;
}

template <class T>
void dequeue<T>::print() const {
	m_data.print();
}

#endif
