#ifndef HASH_TABLE_H_
#define HASH_TABLE_H_
#include "../vector/vector.h"
#include <stdexcept>
#include <string>

using std::string;

template <class K>
class hash {
	public:
		unsigned operator()(const K) const;
};

template <>
class hash<string>
{
	public:
		unsigned operator()(const string key) const {
			unsigned hash_val = factor;
			for (size_t i = 0; i < key.length(); ++i)
				hash_val = (hash_val * first_prime) ^ (key.at(i) * second_prime);

			return hash_val;
		}

	private:
		static constexpr size_t first_prime = 51001;
		static constexpr size_t second_prime = 60961;
		static constexpr size_t factor = 31;
};

template <class K, class V>
struct bucket {
	K key;
	V value;
	bool active;

	bucket() {
		active = false;
	}
	bucket(bucket<K, V>& b) {
		key = b.key;
		value = b.value;
		active = true;
	}
};

template <class K, class V>
class hash_table {
	public:
		typedef V value;
		hash_table();
		bool empty() const;
		size_t search(const K&) const;
		void insert(bucket<K, V>&);
		void erase(const K&);
		void modify(const K& , const V&);
		V find(const K&) const;
		bool contains(const K&) const;
	private:
		myvec::vector<bucket<K, V>*> m_data;
		hash<K> m_hash;
};

template <class K, class V>
hash_table<K, V>::hash_table() : m_data() {}

template <class K, class V>
bool hash_table<K, V>::empty() const {
	return m_data.size() == 0;
}

template <class K, class V>
size_t hash_table<K, V>::search(const K& key) const {
	size_t bucket_idx = (size_t) m_hash(key) % m_data.capacity();
	size_t j = bucket_idx;
	do {
		bucket<K, V>* el = m_data[j];
		if (el == nullptr)
			return j;
		if (el->active && el->key == key)
			return j;
		j  = (j + 1) % m_data.max_size();
	} while (j != bucket_idx);

	return j;
}

template <class K, class V>
void hash_table<K, V>::insert(bucket<K, V>& b) {
	size_t idx = search(b.key);
	if (m_data[idx] == nullptr) {
		m_data[idx] = new bucket<K, V>(b);
	} else if (m_data[idx]->key == b.key && !m_data[idx]->active) {
			m_data[idx]->value = b.value;
			m_data[idx]->active = true;
	} else {
		throw std::runtime_error("The hash table is full!");
	}
}

template <class K, class V>
void hash_table<K, V>::erase(const K& key) {
	size_t idx = search(key);
	if (m_data[idx] != nullptr && m_data[idx]->active && m_data[idx]->key == key) {
		m_data[idx]->active = false;
	} else {
		throw std::runtime_error("No element found with this list!");
	}
}

template <class K, class V>
void hash_table<K, V>::modify(const K& key, const V& val) {
	size_t idx = search(key);
	if (m_data[idx] != nullptr && m_data[idx]->active && m_data[idx]->key == key) {
		m_data[idx]->value = val;
	}
	else {
		throw std::runtime_error("No element found with this key!");
	}
}


template <class K, class V>
typename hash_table<K, V>::value hash_table<K, V>::find(const K& key) const {
	size_t idx = search(key);
	if (m_data[idx] != nullptr && m_data[idx]->active && m_data[idx]->key == key)
		return m_data[idx]->value;
	throw std::runtime_error("No element found with this key!");
}

template <class K, class V>
bool hash_table<K, V>::contains(const K& key) const {
	size_t idx = search(key);
	if (m_data[idx] != nullptr && m_data[idx]->active && m_data[idx]->key == key)
		return true;
	return false;
}

#endif
