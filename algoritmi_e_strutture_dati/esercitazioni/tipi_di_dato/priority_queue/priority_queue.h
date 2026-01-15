#ifndef PRIORITY_QUEUE_H_
#define PRIORITY_QUEUE_H_
#include "../vector/vector.h"
#include <iterator>
#include <stdexcept>

template <class T>
class priority_queue {
	public:
		typedef T value_type;

		priority_queue();
		priority_queue(const priority_queue<T>&);

		bool empty() const;
		value_type top() const;
		void insert(const value_type&);
		void pop();

		void operator=(const priority_queue<T>&);
		bool operator==(const priority_queue<T>&) const;

		void print() const;
	private:
		myvec::vector<T> m_heap;
		size_t m_last;
};

template <class T>
priority_queue<T>::priority_queue() : m_heap() {
	m_last = 0;
}

template <class T>
priority_queue<T>::priority_queue(const priority_queue<T>& pq) : m_heap(pq.m_heap) {
	m_last = pq.m_last;
}

template <class T>
bool priority_queue<T>::empty() const {
	return m_last == 0;
}

template <class T>
typename priority_queue<T>::value_type priority_queue<T>::top() const {
	if (empty())
		throw std::out_of_range("The priority queue is empty!");

	return m_heap[0];

}

template <class T>
void priority_queue<T>::insert(const value_type& el) {
	m_heap.insert(m_heap.begin() + m_last, el);
	m_last += 1;
	size_t i = m_last - 1;
	size_t k = 0;
	if (i > 0)
		k = (i - 1) / 2;
	while (i > 0 && m_heap.at(i) < m_heap.at(k)) {
		value_type tmp = m_heap[i];
		m_heap[i] = m_heap[k];
		m_heap[k] = tmp;
		i = k;
		if (i > 0)
			k = (i - 1) / 2;
	}
}

template <class T>
void priority_queue<T>::pop() {
	if (empty())
		return;
	m_heap[0] = m_heap[m_last - 1];
	m_heap.erase(m_heap.begin() + m_last - 1);
	m_last -= 1;
	size_t i = 0;
	size_t k = 0;
	bool swap = true;
	while (i <= m_last / 2 && swap) {
		k = 2 * i + 1;
		if (k < m_last - 1) {
			if (m_heap[k] > m_heap[k + 1])
				k = k + 1;
		}
		if (m_heap[k] < m_heap[i]) {
			T tmp = m_heap[i];
			m_heap[i] = m_heap[k];
			m_heap[k] = tmp;
			i = k;
		} else {
			swap = false;
		}
	}
}

template <class T>
void priority_queue<T>::operator=(const priority_queue<T>& pq) {
	m_heap = pq.m_heap;
	m_last = pq.m_last;
}

template <class T>
bool priority_queue<T>::operator==(const priority_queue<T>& pq) const {
	return m_heap == pq.m_heap && m_last == pq.m_last;
}

template <class T>
void priority_queue<T>::print() const {
	m_heap.print();
}


#endif
