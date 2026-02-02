#ifndef GRAPH_H_
#define GRAPH_H_
#include "../tipi_di_dato/vector/vector.h"
#include <stdexcept>

template <class E>
class graph;

template <class E>
class Node {
	public:
		friend graph<E>;
		Node(){}
		Node(size_t id, E label) {
			m_id = id;
			m_label = label;
		}
		size_t get_id() const { return m_id; }
		void set_id(size_t id) { m_id = id; }
		E get_label() const { return m_label; }
		void set_label(E label) { m_label = label; }
		bool operator==(const Node<E>& n) const {
			return m_id == n.m_id;
		}
	private:
		size_t m_id;
		E m_label;
};


template <class E>
class graph {
	public:
		typedef Node<E> node;
		typedef E label;
		typedef size_t weight;

		graph();
		graph(size_t);
		graph(const graph<label>&);

		bool empty() const;
		size_t n_nodes() const;

		node ins_node(label);
		void ins_edge(node, node, weight);
		void erase_node(node);
		void erase_edge(node, node);

		weight read_weight(node, node) const;
		label read_label(node) const;
		void write_label(node, label);
		myvec::vector<node> adjacent(node) const;
		myvec::vector<node> list_node() const;
		bool sum_path(int, node, node) const;
		bool same_color_path(node, node, myvec::vector<node>&) const;

		graph<E> operator=(const graph<label>&);
		bool operator==(const graph<label>&) const;
		void print_mat() const;
	private:
		int _find_path(node, node, myvec::vector<node>&) const;
		myvec::vector<node> m_nodes;
		myvec::vector<myvec::vector<size_t>> m_mat;
};

template <class E>
graph<E>::graph() : m_nodes(), m_mat() {}

template <class E>
graph<E>::graph(size_t n) : m_nodes(n), m_mat(n) {
	for (size_t i = 0; i < n; ++i)
		m_mat[i].resize(n);
}

template <class E>
graph<E>::graph(const graph<E>& g) : m_nodes(g.m_nodes), m_mat(g.m_mat) {}

template <class E>
size_t graph<E>::n_nodes() const {
	return m_nodes.size();
}

template <class E>
bool graph<E>::empty() const {
	return m_nodes.size() == 0;
}

template <class E>
typename graph<E>::node graph<E>::ins_node(label l) {
	node n;
	n.set_label(l);
	n.set_id(m_nodes.size());
	m_nodes.push_back(n);

	m_mat.resize(m_nodes.size());

	for (size_t i = 0; i < m_nodes.size(); ++i)
		m_mat[i].resize(m_nodes.size(), 0);

	return n;
}

template <class E>
void graph<E>::ins_edge(node n, node u, weight w) {
 	if (n.m_id < m_nodes.size() && u.m_id < m_nodes.size())
		m_mat[n.m_id][u.m_id] = w;
}


template <class E>
void graph<E>::erase_node(node n) {
	size_t id = n.m_id;
	if (id >= m_nodes.size())
		return;

	m_mat.erase(m_mat.begin() + id);
	for (size_t i = 0; i < m_mat.size(); ++i) {
		m_mat[i].erase(m_mat[i].begin() + id);
	}

	m_nodes.erase(m_nodes.begin() + id);
	for (size_t i = 0; i < m_nodes.size(); i++)
		m_nodes[i].m_id = i;
}

template <class E>
void graph<E>::erase_edge(node n, node u) {
	int id_n = -1;
	int id_u = -1;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_nodes[i] == n)
			id_n = m_nodes[i].m_id;
		if (m_nodes[i] == u)
			id_u = m_nodes[i].m_id;
	}

	if (id_n == -1 || id_u == -1)
		return;

	m_mat[id_n][id_u] = 0;
}

template <class E>
typename graph<E>::weight graph<E>::read_weight(node n, node u) const {
	if (n.m_id >= m_nodes.size() || u.m_id >= m_nodes.size())
		throw std::runtime_error("Nodes do not exists");
	return m_mat[n.m_id][u.m_id];
}

template <class E>
typename graph<E>::label graph<E>::read_label(node n) const {
	int id_n = -1;
	for (node tmp: m_nodes) {
		if (n.get_id() == tmp.get_id()) {
			id_n = n.get_id();
			break;
		}
	}
	if (id_n == -1)
		throw std::runtime_error("The node doesn't exists");

	return n.get_label();
}

template <class E>
void graph<E>::write_label(node n, label l) {
	int id_n = -1;
	for (node tmp: m_nodes) {
		if (n == tmp) {
			id_n = n.get_id();
			break;
		}
	}
	if (id_n == -1)
		throw std::runtime_error("The node doesn't exists");
	m_nodes[id_n].m_label = l;
}


template <class E>
myvec::vector<Node<E>> graph<E>::adjacent(node n) const {
	int id_n = -1;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_nodes[i] == n) {
			id_n = m_nodes[i].m_id;
			break;
		}
	}

	if (id_n == -1)
		throw std::runtime_error("The node does not exists!");

	myvec::vector<node> adj;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_mat[id_n][i] != 0)
			adj.push_back(m_nodes[i]);
	}
	return adj;
}

template <class E>
myvec::vector<Node<E>> graph<E>::list_node() const {
	return m_nodes;
}

template <class E>
bool graph<E>::sum_path(int sum, node a, node b) const {
	myvec::vector<node> visited;
	if (_find_path(a, b, visited) == sum)
		return true;
	return false;
}


template <class E>
graph<E> graph<E>::operator=(const graph<E>& g) {
	if (this != &g) {
		m_nodes = g.m_nodes;
		m_mat = g.m_mat;
	}
	return *this;
}

template <class E>
bool graph<E>::operator==(const graph<E>& g) const {
	if (m_mat.size() != g.n_nodes())
		return false;
	for (size_t i = 0; i < g.n_nodes(); ++i) {
		for (size_t j = 0; j < g.n_nodes(); ++j) {
			if (m_mat[i][j] != g.m_mat[i][j])
				return false;
		}
	}
	return true;
}

template <class E>
void graph<E>::print_mat() const {
    if (m_nodes.size() == 0) {
        std::cout << "Graph is empty." << std::endl;
        return;
    }

    std::cout << "\t";
    for (size_t i = 0; i < m_nodes.size(); ++i) {
        std::cout << m_nodes[i].get_label() << "\t";
    }
    std::cout << "\n";

    for (size_t i = 0; i < m_nodes.size(); ++i) {
        std::cout << m_nodes[i].get_label() << "\t";
        for (size_t j = 0; j < m_nodes.size(); ++j) {
            std::cout << m_mat[i][j] << "\t";
        }
        std::cout << std::endl;
    }
}

// For uniform color path, the check for the label is !=
template <class E>
bool graph<E>::same_color_path(node a, node b, myvec::vector<node>& visited) const {
	for (node n : visited)
		if (n == a)
			return false;
	if (a == b)
		return true;
	for (node n : adjacent(a)) {
		if (n.get_label() == a.get_label()) {
			if (same_color_path(n, b, visited))
				return true;
		}
	}
	return false;
}

template <class E>
int graph<E>::_find_path(node a, node b, myvec::vector<node>& visited) const {
	for (node n : visited)
		if (n == a)
			return 0;

	if (a == b)
		return a.get_label();

	int sum = 0;
	visited.push_back(a);
	myvec::vector<node> a_adj = adjacent(a);
	for (node n : a_adj) {
		sum = a.get_label() + _find_path(n, b, visited);
	}
	visited.pop_back();
	return sum;
}


#endif
