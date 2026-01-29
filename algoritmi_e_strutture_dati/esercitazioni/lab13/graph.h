#ifndef GRAPH_H_
#define GRAPH_H_
#include "../tipi_di_dato/vector/vector.h"

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
		void ins_node(label);
		void ins_bow(label, label, weight);
		void erase_node(label);
		void erase_bow(label, label);
		Node<E> get_node(label) const;
		weight read_weight(label, label) const;
		label read_label(node) const;
		void write_label(node, label);
		myvec::vector<node> adjacent(label) const;
		size_t in_degree(label) const;
		size_t out_degree(label) const;
		double mean_out_degree() const;
		void find_path(label, label) const;
		graph<E> operator=(const graph<label>&);
		bool operator==(const graph<label>&) const;
		void print_mat() const;
	private:
		bool find_path_h(label, label, myvec::vector<label>&) const;
		bool label_exists(label) const;
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
void graph<E>::ins_node(label l) {
	if (label_exists(l))
		throw std::runtime_error("The label already exists");
	node n;
	n.set_label(l);
	n.set_id(m_nodes.size());
	m_nodes.push_back(n);

	m_mat.resize(m_nodes.size());

	for (size_t i = 0; i < m_nodes.size(); ++i)
		m_mat[i].resize(m_nodes.size(), 0);
}

template <class E>
void graph<E>::ins_bow(label n, label u, weight w) {
	int id_n = -1;
	int id_u = -1;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_nodes[i].m_label == n)
			id_n = m_nodes[i].m_id;
		if (m_nodes[i].m_label == u)
			id_u = m_nodes[i].m_id;
	}

	if (id_n == -1 || id_u == -1)
		return;

	m_mat[id_n][id_u] = w;
}


template <class E>
void graph<E>::erase_node(label n) {
	int id = -1;
	for (size_t i = 0; i < m_nodes.size(); i++) {
		if (m_nodes[i].m_label == n) {
			id = m_nodes[i].m_id;
			break;
		}
	}

	if (id == -1)
		return;

	m_nodes.erase(m_nodes.begin() + id);
	for (size_t i = 0; i < m_nodes.size(); i++)
		m_nodes[i].m_id -= 1;
}

template <class E>
void graph<E>::erase_bow(label n, label u) {
	int id_n = -1;
	int id_u = -1;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_nodes[i].m_label == n)
			id_n = m_nodes[i].m_id;
		if (m_nodes[i].m_label == u)
			id_u = m_nodes[i].m_id;
	}

	if (id_n == -1 || id_u == -1)
		return;

	m_mat[id_n][id_u] = 0;
}

template <class E>
Node<E> graph<E>::get_node(label l) const {
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_nodes[i].m_label == l)
			return m_nodes[i];
	}
	throw std::runtime_error("The node doesn't exists");
}

template <class E>
typename graph<E>::weight graph<E>::read_weight(label n, label u) const {
	int id_n = -1;
	int id_u = -1;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_nodes[i].m_label == n)
			id_n = m_nodes[i].m_id;
		if (m_nodes[i].m_label == u)
			id_u = m_nodes[i].m_id;
	}

	if (id_n == -1 || id_u == -1)
		throw std::runtime_error("The nodes don't exist");

	return m_mat[id_n][id_u];
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
myvec::vector<Node<E>> graph<E>::adjacent(label n) const {
	int id_n = -1;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_nodes[i].m_label == n) {
			id_n = m_nodes[i].m_id;
			break;
		}
	}

	if (id_n == -1)
		throw std::runtime_error("The node doesn't exists");

	myvec::vector<node> adj;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_mat[id_n][i] != 0)
			adj.push_back(m_nodes[i]);
	}
	return adj;
}

template <class E>
size_t graph<E>::in_degree(label l) const {
	Node<E> n = get_node(l);
	size_t count = 0;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_mat[i][n.get_id()] != 0)
			++count;
	}
	return count;
}

template <class E>
size_t graph<E>::out_degree(label l) const {
	return adjacent(l).size();
}

template <class E>
double graph<E>::mean_out_degree() const {
	float mean = 0;
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		mean += out_degree(m_nodes[i].m_label);
	}
	return mean / m_nodes.size();
}

template <class E>
void graph<E>::find_path(label l, label n) const {
	myvec::vector<label> visited;
	if (!find_path_h(l, n, visited))
		std::cout << "No path found from " << l << " to " << n << std::endl;
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
bool graph<E>::find_path_h(label l, label n, myvec::vector<label>& visited) const {
	if (l == n) {
		std::cout << l;
		return true;
	}
	for (size_t i = 0; i < visited.size(); ++i) {
		if (visited[i] == l)
			return false;
	}

	visited.push_back(l);
	myvec::vector<Node<E>> l_adj = adjacent(l);
	for (size_t i = 0; i < l_adj.size(); ++i) {
		if (find_path_h(l_adj[i].m_label, n, visited)) {
			std::cout << " <- " << l;
			return true;
		}
	}
	return false;
}

template <class E>
bool graph<E>::label_exists(label l) const {
	for (size_t i = 0; i < m_nodes.size(); ++i) {
		if (m_nodes[i].m_label == l)
			return true;
	}
	return false;
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

#endif
