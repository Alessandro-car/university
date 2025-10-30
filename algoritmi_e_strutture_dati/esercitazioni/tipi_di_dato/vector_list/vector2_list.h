#ifndef VECTOR_LIST_H
#define VECTOR_LIST_H

#define STD_MAX_DIM 10

template <class T>
class vector_list {
	public:
		vector_list();
		vector_list(int);
		~vector_list();

		void create();
		bool empty() const;
		T read(int) const;
		void write(const T&, int);
		int begin() const;
		bool end(int) const;
		int next(int) const;
		int previous(int) const;
		void insert(const T&, int);
		void erase(int);

	private:
		void m_increase_dim(T*&, int, int);
		T* m_elements;
		int m_dim;
		int m_length;
};

template <class T>
vector_list<T>::vector_list() {
	m_dim = STD_MAX_DIM;
	this->create();
}

template <class T>
vector_list<T>::vector_list(int dim) {
	m_dim = dim;
	this->create();
}

template <class T>
vector_list<T>::~vector_list() {
	delete[] m_elements;
}

template <class T>
void vector_list<T>::create() {
	m_elements = new T[m_dim];
	this->m_length = 0;
}

template <class T>
bool vector_list<T>::empty() const {
	return m_length == 0;
}

template <class T>
T vector_list<T>::read(int pos) const {
	if (pos > 0 && pos <= m_length) {
		return m_elements[pos - 1];
	}
}

template <class T>
void vector_list<T>::write(const T& elem, int pos) {
	if (pos > 0 && pos <= m_length) {
		m_elements[pos - 1] = elem;
	}
}

template <class T>
int vector_list<T>::begin() const {
	return 1;
}

template <class T>
bool vector_list<T>::end(int pos) const {
	if (pos > 0 && pos <= m_length + 1) {
		return pos == m_length + 1;
	}
	return false;
}

template <class T>
int vector_list<T>::next(int pos) const {
	if (pos > 0 && pos <= m_length) {
		return pos + 1;
	}
	return pos;
}

template <class T>
int vector_list<T>::previous(int pos) const {
	if (pos > 1 && pos <= m_length) {
		return pos - 1;
	}
	return pos;
}

template <class T>
void vector_list<T>::insert(const T& e, int pos) {
	if (m_length == m_dim) {
		m_increase_dim(m_elements, m_dim, m_dim * 2);
		m_dim = m_dim * 2;
	}
	if (pos > 0 && pos <= m_length) {
		if (!empty()) {
			for (int i = m_length; i >= pos; i--) {
				m_elements[i] = m_elements[i - 1];
			}
			m_elements[pos - 1] = e;
			m_length++;
		}
	}
}

template <class T>
void vector_list<T>::erase(int pos) {
	if (pos > 0 && pos <= m_length) {
		if (!empty()) {
			for (int i = pos - 1; i < m_length - 1; i++) {
				m_elements[i] = m_elements[i + 1];
			}
			m_length--;
		}
	}
}


template <class T>
void vector_list<T>::m_increase_dim(T*& elements, int old_dim, int new_dim) {
	T* temp = new T[new_dim];
	int number = (old_dim < new_dim) ? old_dim : new_dim;
	for (int i = 0; i < number; i++) {
		temp[i] = elements[i];
	}
	delete[] elements;
	elements = temp;
}

#endif
