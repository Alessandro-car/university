#ifndef GRAPH_H_
#define GRAPH_H_
#include "../vector/vector.h"
#include <stdexcept>

template <class E, class P>
class graph;

template <class E, class P>
class Node {
	public:
		friend graph<E, P>;
		Node(){}
		Node(size_t id, E label) {
			m_id = id;
			m_label = label;
		}
		size_t get_id() const { return m_id; }
		void set_id(size_t id) { m_id = id; }
		E get_label() const { return m_label; }
		void set_label(E label) { m_label = label; }
		bool operator==(const Node<E, P>& n) const {
			return m_id == n.m_id;
		}
	private:
		size_t m_id;
		E m_label;
};


template <class E, class P>
class graph {
	public:
		typedef Node<E, P> node;
		typedef E label;
		typedef P weight;

		graph();
		graph(size_t);
		graph(const graph<label, weight>&);

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

		graph<E, P> operator=(const graph<label, weight>&);
		bool operator==(const graph<label, weight>&) const;
		void print_mat() const;
	private:
		myvec::vector<node> m_nodes;
		myvec::vector<myvec::vector<weight>> m_mat;
};

template <class E, class P>
graph<E, P>::graph() : m_nodes(), m_mat() {}

template <class E, class P>
graph<E, P>::graph(size_t n) : m_nodes(n), m_mat(n) {
	for (size_t i = 0; i < n; ++i)
		m_mat[i].resize(n);
}

template <class E, class P>
graph<E, P>::graph(const graph<E, P>& g) : m_nodes(g.m_nodes), m_mat(g.m_mat) {}

template <class E, class P>
size_t graph<E, P>::n_nodes() const {
	return m_nodes.size();
}

template <class E, class P>
bool graph<E, P>::empty() const {
	return m_nodes.size() == 0;
}

template <class E, class P>
typename graph<E, P>::node graph<E, P>::ins_node(label l) {
	node n;
	n.set_label(l);
	n.set_id(m_nodes.size());
	m_nodes.push_back(n);

	m_mat.resize(m_nodes.size());

	for (size_t i = 0; i < m_nodes.size(); ++i)
		m_mat[i].resize(m_nodes.size(), 0);

	return n;
}

template <class E, class P>
void graph<E, P>::ins_edge(node n, node u, weight w) {
 	if (n.m_id < m_nodes.size() && u.m_id < m_nodes.size())
		m_mat[n.m_id][u.m_id] = w;
}


template <class E, class P>
void graph<E, P>::erase_node(node n) {
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

template <class E, class P>
void graph<E, P>::erase_edge(node n, node u) {
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

template <class E, class P>
typename graph<E, P>::weight graph<E, P>::read_weight(node n, node u) const {
	if (n.m_id >= m_nodes.size() || u.m_id >= m_nodes.size())
		throw std::runtime_error("Nodes do not exists");
	return m_mat[n.m_id][u.m_id];
}

template <class E, class P>
typename graph<E, P>::label graph<E, P>::read_label(node n) const {
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

template <class E, class P>
void graph<E, P>::write_label(node n, label l) {
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


template <class E, class P>
myvec::vector<Node<E, P>> graph<E, P>::adjacent(node n) const {
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

template <class E, class P>
myvec::vector<Node<E, P>> graph<E, P>::list_node() const {
	return m_nodes;
}

template <class E, class P>
graph<E, P> graph<E, P>::operator=(const graph<E, P>& g) {
	if (this != &g) {
		m_nodes = g.m_nodes;
		m_mat = g.m_mat;
	}
	return *this;
}

template <class E, class P>
bool graph<E, P>::operator==(const graph<E, P>& g) const {
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

template <class E, class P>
void graph<E, P>::print_mat() const {
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

#endif
