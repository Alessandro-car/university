#ifndef _VECTOR_QUEUE_H
#define _VECTOR_QUEUE_H

#include <iostream>

template <class T>
class vector_queue {
	public:
		vector_queue();
		vector_queue(size_t);
		vector_queue(const vector_queue<T>&);
		~vector_queue();

		bool empty() const;
		size_t size() const;
		T back() const;
		T front() const;
		void push(const T&);
		void pop();

		bool operator==(const vector_queue<T>&) const;
		vector_queue<T> operator=(const vector_queue<T>&);
	private:
		static constexpr size_t STD_DIM = 10;
		void change_dimension(size_t);
		T* m_elems;
		size_t m_dim;
		size_t m_length;
		size_t m_front;
};

template <class T>
vector_queue<T>::vector_queue() {
	m_dim = STD_DIM;
	m_elems = new T[m_dim];
	m_length = 0;
	m_front = 0;
}

template <class T>
vector_queue<T>::vector_queue(size_t dim) {
	m_dim = dim;
	m_elems = new T[m_dim];
	m_length = 0;
	m_front = 0;
}

template <class T>
vector_queue<T>::vector_queue(const vector_queue<T>&) {}

template <class T>
vector_queue<T>::~vector_queue() {
	delete[] m_elems;
}

template <class T>
bool vector_queue<T>::empty() const {
	return m_length == 0;
}

template <class T>
size_t vector_queue<T>::size() const {
	return m_length;
}

template <class T>
T vector_queue<T>::back() const {
	assert(!empty());
	return
}

template <class T>
T vector_queue<T>::front() const {

}

template <class T>
void vector_queue<T>::push(const T& el) {}

template <class T>
void vector_queue<T>::pop() {}

template <class T>
bool vector_queue<T>::operator==(const vector_queue<T>& q) const {}

template <class T>
vector_queue<T> vector_queue<T>::operator=(const vector_queue<T>&) {}

template <class T>
void vector_queue<T>::change_dimension(size_t new_dim) {}

#endif
