#ifndef _VECTOR_H
#define _VECTOR_H

#include <cstddef>
#include <cstring>
#include <iostream>
#include <iterator>
#include <limits>
#include <stdexcept>
#include <type_traits>
#include <utility>

namespace myvec {
	template <class T>
	class vector {
		public:
			using value_type = T;
			using reference = T&;
			using const_reference = const T&;
			using iterator = T*;
			using const_iterator = const T*;
			using reverse_iterator = std::reverse_iterator<iterator>;
			using const_reverse_iterator = std::reverse_iterator<const_iterator>;
			using difference_type = std::ptrdiff_t;

			// Constructor/Destructors
			vector() noexcept;
			explicit vector(size_t);
			vector(size_t, const_reference);
			template <class InputIt> vector(InputIt, InputIt);
			vector(vector<T>&&) noexcept;
			vector(std::initializer_list<T>);
			vector(const vector<T>&);
			~vector();
			vector<T>& operator=(vector<T>&&) noexcept;
			vector<T>& operator=(const vector<T>&);
			vector<T>& operator=(std::initializer_list<T>);
			void assign(size_t, const_reference);
			template <class InputIt> void assign(InputIt, InputIt);
			void assign(std::initializer_list<T>);

			// Element access:
			reference at(size_t);
			const_reference at(size_t) const;
			reference operator[](size_t);
			const_reference operator[](size_t) const;
			reference front();
			const_reference front() const;
			reference back();
			const_reference back() const;
			T* data();
			const T* data() const;

			// Iterators:
			iterator begin() const;
			const_iterator cbegin() const noexcept;
			iterator end() const;
			const_iterator cend() const noexcept;
			reverse_iterator rbegin() const;
			const_reverse_iterator crbegin() const noexcept;
			reverse_iterator rend() const;
			const_reverse_iterator crend() const noexcept;

			// Capacity:
			bool empty() const noexcept;
			size_t size() const noexcept;
			size_t max_size() const noexcept;
			void reserve(size_t);
			size_t capacity() const noexcept;
			void shrink();

			// Modifiers:
			void clear() noexcept;
			iterator insert(const_iterator, const_reference);
			iterator insert(const_iterator, T&&);
			iterator insert(const_iterator, size_t, const_reference);
			template <class InputIt> iterator insert(const_iterator, InputIt, InputIt);
			iterator insert(const_iterator, std::initializer_list<T>);
			iterator erase(iterator);
			iterator erase(const_iterator);
			iterator erase(iterator, iterator);
			iterator erase(const_iterator, const_iterator);
			void push_back(const_reference);
			void push_back(T&&);
			void pop_back();
			void resize(size_t);
			void resize(size_t, const_reference);
			void swap(vector&) noexcept;

			bool operator==(const vector<T>&) const;
			bool operator!=(const vector<T>&) const;

			void print() const;

		private:
			static constexpr size_t MAX_DIM = std::numeric_limits<difference_type>::max();
			static constexpr size_t STD_DIM = 100;
			T* m_arr;
			size_t m_len = 0;
			size_t m_dim = 100;
	};

	// Constructor/Destructors
	template <class T>
	vector<T>::vector() noexcept {
		m_arr = new T[m_dim];
	}

	template <class T>
	vector<T>::vector(size_t dim) {
		m_dim = dim;
		m_arr = new T[m_dim];
	}

	template <class T>
	vector<T>::vector(size_t dim, const_reference val) {
		m_dim = dim;
		m_arr = new T[m_dim];
		for (size_t i = 0; i < m_dim; i++) {
			m_arr[m_len++] = val;
		}
	}

	template <class T>
	template <class InputIt>
	vector<T>::vector(InputIt first, InputIt last) {
		if constexpr (!std::is_integral_v<InputIt>) {
			size_t count = last - first;
			m_arr = new T[m_dim];
			for (size_t i = 0; i < count; i++, ++first) {
				m_arr[m_len++] = *first;
			}
		}
	}

	template <class T>
	vector<T>::vector(vector<T>&& v) noexcept {
		m_dim = v.m_dim;
		m_arr = new T[m_arr];
		for (size_t i = 0; i < v.m_len; i++) {
			m_arr[i] = std::move(v.m_arr[i]);
		}
		m_len = v.m_len;
	}

	template <class T>
	vector<T>::vector(std::initializer_list<T> il) {
		m_dim = (STD_DIM < il.size()) ?  il.size() : STD_DIM;
		m_arr = new T[m_dim];
		for (auto &list_el: il) {
			m_arr[m_len++] = list_el;
		}
	}

	template <class T>
	vector<T>::vector(const vector<T>& v) {
		m_dim = v.m_dim;
		m_arr = new T[m_dim];
		for (size_t i = 0; i < v.size(); i++) {
			m_arr[m_len++] = v.m_arr[i];
		}
	}

	template <class T>
	vector<T>::~vector() {
		delete[] m_arr;
	}

	template <class T>
	vector<T>& vector<T>::operator=(vector<T>&& v) noexcept {
		if (this != &v) {
			m_dim = v.m_dim;
			delete[] m_arr;
			m_arr = new T[m_dim];
			m_len = 0;
			for (size_t i = 0; i < v.size(); i++) {
				m_arr[m_len++] = std::move(v.m_arr[i]);
			}
		}
		return *this;
	}

	template <class T>
	vector<T>& vector<T>::operator=(const vector<T>& v) {
		if (this != &v) {
			m_dim = v.m_dim;
			delete[] m_arr;
			m_arr = new T[m_dim];
			m_len = 0;
			for (size_t i = 0; i < v.size(); i++ ) {
				m_arr[m_len++] = v.m_arr[i];
			}
		}
		return *this;
	}

	template <class T>
	vector<T>& vector<T>::operator=(std::initializer_list<T> il) {
		if (m_dim < il.size()) {
			m_dim = il.size() * 2;
			delete[] m_arr;
			m_arr = new T[m_dim];
		}

		m_len = 0;
		for (auto &list_el: il) {
			m_arr[m_len++] = list_el;
		}
		return *this;
	}

	template <class T>
	void vector<T>::assign(size_t count, const_reference val) {
		if (m_dim < count) {
			m_dim = (m_dim + count) * 2;
			delete[] m_arr;
			m_arr = new T[m_dim];
		}
		m_len = 0;
		for (size_t i = 0; i < count; i++) {
			m_arr[m_len++] = val;
		}
	}

	template <class T>
	template <class InputIt>
	void vector<T>::assign(InputIt first, InputIt last) {
		if constexpr (std::is_integral_v<InputIt>) {
			assign(static_cast<size_t>(first), static_cast<T>(last));
		} else {
			size_t count = last - first;
			if (m_dim < count) {
				m_dim = (m_dim + count) * 2;
				delete[] m_arr;
				m_arr = new T[m_dim];
			}
			m_len = 0;
			for (size_t i = 0; i < count; i++, ++first)
				m_arr[m_len++] = *first;
		}
	}

	template <class T>
	void vector<T>::assign(std::initializer_list<T> il) {
		if (m_dim < il.size()) {
			m_dim = il.size() * 2;
			delete[] m_arr;
			m_arr = new T[m_dim];
		}
		m_len = 0;
		for (auto &list_el: il) {
			m_arr[m_len++] = list_el;
		}
	}

	// Element access:
	template <class T>
	typename vector<T>::reference vector<T>::at(size_t pos) {
		if (pos < m_len)
			return m_arr[pos];
		throw std::out_of_range("Index out of range");
	}

	template <class T>
	typename vector<T>::const_reference vector<T>::at(size_t pos) const {
		if (pos < m_len)
			return m_arr[pos];
		throw std::out_of_range("Index out of range");
	}

	template <class T>
	typename vector<T>::reference vector<T>::operator[](size_t pos) {
		return m_arr[pos];
	}

	template <class T>
	typename vector<T>::const_reference vector<T>::operator[](size_t pos) const {
		return m_arr[pos];
	}

	template <class T>
	typename vector<T>::reference vector<T>::front() {
		return m_arr[0];
	}

	template <class T>
	typename vector<T>::const_reference vector<T>::front() const {
		return m_arr[0];
	}

	template <class T>
	typename vector<T>::reference vector<T>::back() {
		return m_arr[m_len - 1];
	}

	template <class T>
	typename vector<T>::const_reference vector<T>::back() const {
		return m_arr[m_len - 1];
	}

	template <class T>
	T* vector<T>::data() {
		return m_arr;
	}

	template <class T>
	const T* vector<T>::data() const {
		return m_arr;
	}

	// Iterators:
	template <class T>
	typename vector<T>::iterator vector<T>::begin() const {
		return m_arr;
	}

	template <class T>
	typename vector<T>::const_iterator vector<T>::cbegin() const noexcept {
		return m_arr;
	}

	template <class T>
	typename vector<T>::iterator vector<T>::end() const {
		return m_arr + m_len;
	}

	template <class T>
	typename vector<T>::const_iterator vector<T>::cend() const noexcept {
		return m_arr + m_len;
	}

	template <class T>
	typename vector<T>::reverse_iterator vector<T>::rbegin() const {
		return reverse_iterator(m_arr + m_len);
	}

	template <class T>
	typename vector<T>::const_reverse_iterator vector<T>::crbegin() const noexcept {
		return reverse_iterator(m_arr + m_len);
	}

	template <class T>
	typename vector<T>::reverse_iterator vector<T>::rend() const {
		return reverse_iterator(m_arr);
	}

	template <class T>
	typename vector<T>::const_reverse_iterator vector<T>::crend() const noexcept {
		return reverse_iterator(m_arr);
	}

	template <class T>
	bool vector<T>::empty() const noexcept {
		return m_len == 0;
	}

	template <class T>
	size_t vector<T>::size() const noexcept {
		return m_len;
	}

	template <class T>
	size_t vector<T>::max_size() const noexcept{
		return MAX_DIM;
	}

	template <class T>
	void vector<T>::reserve(size_t new_dim) {
		if (new_dim > max_size())
			throw std::length_error("The new dimension cannot be bigger than the max capacity");
		if (new_dim > m_dim) {
			m_dim = new_dim;
			T* tmp_arr = new T[m_dim];
			memcpy(tmp_arr, m_arr, m_len * sizeof(T));
			delete[] m_arr;
			m_arr = tmp_arr;
		}
	}

	template <class T>
	size_t vector<T>::capacity() const noexcept {
		return m_dim;
	}

	template <class T>
	void vector<T>::shrink() {
		m_dim = m_len;
		T* tmp_arr = new T[m_dim];
		memcpy(tmp_arr, m_arr, m_len * sizeof(T));
		delete[] m_arr;
		m_arr = tmp_arr;
	}


	// Modifiers:

	template <class T>
	void vector<T>::clear() noexcept {
		for (size_t i = 0; i < m_len; i++)
			m_arr[i].~T();
		m_len = 0;
	}

	template <class T>
	typename vector<T>::iterator vector<T>::insert(const_iterator pos, const_reference val) {
		size_t insert_index = pos - begin();
		if (m_len == m_dim)
			reserve(m_dim * 2);
		for (size_t i = m_len; i > insert_index; --i)
			m_arr[i] = m_arr[i - 1];

		m_arr[insert_index] = val;
		m_len++;
		return &m_arr[insert_index];
	}

	template <class T>
	typename vector<T>::iterator vector<T>::insert(const_iterator pos, T&& val) {
		size_t insert_index = pos - begin();
		if (m_len == m_dim)
			reserve(m_dim * 2);

		for (size_t i = m_len; i > insert_index; --i)
			m_arr[i] = m_arr[i - 1];

		m_arr[insert_index] = std::move(val);
		m_len++;
		return &m_arr[pos - begin()];
	}

	template <class T>
	typename vector<T>::iterator vector<T>::insert(const_iterator pos, size_t count, const_reference val) {
		size_t insert_index = pos - begin();
		if (m_len + count >= m_dim)
			reserve((m_dim + count) * 2);
		for (size_t i = m_len + count - 1; i > insert_index; --i)
			m_arr[i] = m_arr[i - count];

		for (size_t i = insert_index; i < insert_index + count; i++)
			m_arr[i] = val;
		m_len += count;
		return &m_arr[insert_index];
	}

	template <class T>
	template <class InputIt>
	typename vector<T>::iterator vector<T>::insert(const_iterator pos, InputIt first, InputIt last) {
		if constexpr (std::is_integral_v<InputIt>)
			return insert(pos, static_cast<size_t>(first), static_cast<T>(last));
		size_t insert_index = pos - begin();
		size_t n_el = last - first;
		if (m_len + n_el >= m_dim)
			reserve((m_dim + n_el) * 2);

		for (size_t i = m_len + n_el - 1; i > insert_index; --i)
			m_arr[i] = m_arr[i - n_el];
		for (size_t i = insert_index; i < insert_index + n_el; ++i, ++first)
			m_arr[i] = *first;
		m_len += n_el;
		return &m_arr[insert_index];
	}

	template <class T>
	typename vector<T>::iterator vector<T>::insert(const_iterator pos, std::initializer_list<T> il) {
		size_t insert_index = pos - begin();
		if (m_len + il.size() >= m_dim)
			reserve((m_dim + il.size()) * 2);

		for (size_t i = m_len + il.size() - 1; i > insert_index; --i)
			m_arr[i] = m_arr[i - il.size()];

		size_t i = insert_index;
		for(auto &list_el: il)
			m_arr[i++] = list_el;
		m_len += il.size();
		return &m_arr[insert_index];
	}

	template <class T>
	typename vector<T>::iterator vector<T>::erase(iterator pos) {
		size_t delete_index = pos - begin();
		size_t n_shift = m_len - (pos - begin()) - 1;
		for (size_t i = delete_index; i < m_len - 1; i++) {
			m_arr[i] = m_arr[i + 1];
		}
		m_len--;
		return &m_arr[delete_index];

	}

	template <class T>
	typename vector<T>::iterator vector<T>::erase(const_iterator pos) {
		size_t delete_index = pos - begin();
		size_t n_shift = m_len - (pos - begin()) - 1;
		for (size_t i = delete_index; i < m_len - 1; i++) {
			m_arr[i] = m_arr[i + 1];
		}
		m_len--;
		return &m_arr[delete_index];	}

	template <class T>
	typename vector<T>::iterator vector<T>::erase(iterator first, iterator last) {
		size_t start_index = first - begin();
		size_t last_index = last - begin();
		if (first == last)
			return &m_arr[start_index];

		for (size_t i = start_index; i < start_index + (m_len - last_index); i++) {
			m_arr[i] = m_arr[i + (last_index - start_index)];
		}

		m_len -= last - first;
		return &m_arr[start_index];
	}

	template <class T>
	typename vector<T>::iterator vector<T>::erase(const_iterator first, const_iterator last) {
		size_t start_index = first - begin();
		size_t last_index = last - begin();
		if (first == last)
			return &m_arr[start_index];

		for (size_t i = start_index; i < start_index + (m_len - last_index); i++) {
			m_arr[i] = m_arr[i + (last_index - start_index)];
		}

		m_len -= last - first;
		return &m_arr[start_index];
	}

	template <class T>
	void vector<T>::push_back(const_reference val) {
		resize(m_len + 1, val);
	}

	template <class T>
	void vector<T>::push_back(T&& val) {
		resize(m_len + 1, std::move(val));
	}

	template <class T>
	void vector<T>::pop_back() {
		resize(m_len - 1);
	}

	template <class T>
	void vector<T>::resize(size_t size) {
		if (size > m_len) {
			if (size > m_dim)
				reserve(size);
			for (size_t i = m_len; i < size; i++) {
				m_arr[i] = T();
			}
		} else {
			for (size_t i = size; i < m_len; i++) {
				m_arr[i].~T();
			}
		}
		m_len = size;
	}

	template <class T>
	void vector<T>::resize(size_t size, const_reference val) {
	if (size > m_len) {
			if (size > m_dim)
				reserve(size);
			for (size_t i = m_len; i < size; i++) {
				m_arr[i] = val;
			}
		} else {
			for (size_t i = size; i < m_len; i++) {
				m_arr[i].~T();
			}
		}
		m_len = size;
	}

	template <class T>
	void vector<T>::swap(vector<T>& v) noexcept {
		T* tmp_arr = m_arr;
		size_t tmp_len = m_len;
		size_t tmp_dim = m_dim;

		m_len = v.size();
		m_dim = v.capacity();
		m_arr = v.m_arr;

		v.m_len = tmp_len;
		v.m_dim = tmp_dim;
		v.m_arr = tmp_arr;

	}

	template <class T>
	bool vector<T>::operator==(const vector<T>& v) const {
		if (m_len != v.size())
			return false;
		for (size_t i = 0; i < m_len; i++)
			if (m_arr[i] != v.m_arr[i])
				return false;
		return true;
	}

	template <class T>
	bool vector<T>::operator!=(const vector<T>& v) const {
		if (m_len != v.size())
			return true;
		for (size_t i = 0; i < m_len; i++)
			if (m_arr[i] != v.m_arr[i])
				return true;
		return false;
	}

	template <class T>
	void vector<T>::print() const {
		for (size_t i = 0; i < size(); i++)
			std::cout << "[" << m_arr[i] << "]";
		std::cout << std::endl;
	}
}
#endif
