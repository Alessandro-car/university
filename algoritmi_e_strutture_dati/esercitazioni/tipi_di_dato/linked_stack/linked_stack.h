#ifndef _LINKED_STACK_H
#define _LINKED_STACK_H

#include <iostream>


template <class T>
class linked_stack;

template <class T>
class Node {

	friend class linked_stack<T>;
	public:
	private:
		Node* m_next;
		T m_value;

};

template <class T>
class linked_stack {
	public:
		linked_stack();
		linked_stack(const linked_stack<T>&);
		~linked_stack();

		bool empty() const;
		T top() const;
		void pop();
		void push(const T&);
		size_t size() const;
		void print() const;

		bool operator==(const linked_stack<T>&) const;
		linked_stack<T>& operator=(const linked_stack<T>&);
	private:
		Node<T>* m_head;
		size_t m_length;
};

template <class T>
linked_stack<T>::linked_stack() {
	m_head = new Node<T>;
	m_length = 0;
}

template <class T>
linked_stack<T>::linked_stack(const linked_stack<T>& s) {
	m_head = new Node<T>;
	m_length = 0;
	Node<T>* node_s = s.m_head->m_next;
	T* values_s = new T[s.size()];
	for (size_t i = 0; i < s.size(); i++) {
		values_s[i] = node_s->m_value;
		node_s = node_s->m_next;
	}

	for (size_t i = s.size(); i > 0; i--) {
		push(values_s[i - 1]);
	}

	delete[] values_s;
}

template <class T>
linked_stack<T>::~linked_stack() {
	while (!empty())
		pop();
	delete m_head;
}

template <class T>
bool linked_stack<T>::empty() const {
	return m_length == 0;
}

template <class T>
T linked_stack<T>::top() const {
	if (!empty())
		return m_head->m_next->m_value;
	throw std::out_of_range("The list is empty");
}

template <class T>
void linked_stack<T>::pop() {
	if (!empty()) {
		Node<T>* tmp = m_head->m_next;
		m_head->m_next = tmp->m_next;
		delete tmp;
		m_length--;
	}
}

template <class T>
void linked_stack<T>::push(const T& e) {
	Node<T>* n = new Node<T>;
	n->m_value = e;
	n->m_next = m_head->m_next;
	m_head->m_next = n;
	m_length++;
}

template <class T>
size_t linked_stack<T>::size() const {
	return m_length;
}

template <class T>
void linked_stack<T>::print() const {
	if (!empty()) {
		Node<T>* n = m_head->m_next;
		for (size_t i = 0; i < size(); i++) {

			std::cout << n->m_value << std::endl;
			n = n->m_next;
		}
	} else {
		std::cout << "The list is empty" << std::endl;
	}

}

template <class T>
bool linked_stack<T>::operator==(const linked_stack<T>& s) const {
	if (m_length != s.size())
		return false;
	for (size_t i = 0; i < m_length; i++) {
		if (top() != s.top())
			return false;
	}

	return true;
}

template <class T>
linked_stack<T>& linked_stack<T>::operator=(const linked_stack<T>& s) {
	if (this != &s) {
		this->~linked_stack();
		m_head = new Node<T>;
		m_length = 0;
		Node<T>* node_s = s.m_head->m_next;
		T* values_s = new T[s.size()];
		for (size_t i = 0; i < s.size(); i++) {
			values_s[i] = node_s->m_value;
			node_s = node_s->m_next;
		}

		for (size_t i = s.size(); i > 0; i--) {
			push(values_s[i - 1]);
		}

		delete[] values_s;
	}

	return *this;
}

#endif
