#include "../tipi_di_dato/stack/stack.h"
#include "../tipi_di_dato/vector/vector.h"

template <class T>
class MultipleStack {
	public:
		MultipleStack(size_t);
		void push(T, size_t);
		void pop(size_t);
		T top(size_t) const;
		bool empty() const;
		size_t size() const;
	private:
		myvec::vector<stack<T>> m_mulstack;
};

template <class T>
MultipleStack<T>::MultipleStack(size_t n_stack) : m_mulstack(n_stack) {}

template <class T>
void MultipleStack<T>::push(T e, size_t idx) {
	if (idx < m_mulstack.capacity()) {
		m_mulstack[idx].push(e);
	}
}

template <class T>
void MultipleStack<T>::pop(size_t idx) {
	if (idx < m_mulstack.capacity()) {
		m_mulstack[idx].pop();
	}
}

template <class T>
T MultipleStack<T>::top(size_t idx) const {
	if (idx < m_mulstack.capacity()) {
		return m_mulstack[idx].top();
	}
	throw std::out_of_range("No stack found in that index");
}

template <class T>
bool MultipleStack<T>::empty() const {
	return m_mulstack.empty();
}

template <class T>
size_t MultipleStack<T>::size() const {
	return m_mulstack.size();
}
