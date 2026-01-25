#ifndef EX5_H_
#define EX5_H_
#include <iostream>
#include "../tipi_di_dato/list/list.h"

class polynomial {
	public:
		polynomial();
		size_t grado() const;
		void input(std::istream&);
		void output(std::ostream&) const;
		polynomial somma(const polynomial&);
		polynomial moltiplica(const polynomial&);
		int valore(size_t) const;
	private:
		list<int> m_pol;
};

polynomial::polynomial() : m_pol() {}

size_t polynomial::grado() const {
	return m_pol.size() - 1;
}

void polynomial::input(std::istream& in) {
	int grado;
	while (in >> grado) {
		for (size_t i = 0; i <= grado; ++i) {
			int coefficiente;
			in >> coefficiente;
			m_pol.insert(coefficiente, m_pol.size());
		}
	}
}

void polynomial::output(std::ostream& out) const {
	size_t i = m_pol.begin();
	size_t count = 0;
	while (!m_pol.end(i)) {
		int val = m_pol.read(i);
		if (val != 0) {
			if (count > 0)
				out << " + ";
			out << val;
			if (count > 0)
				out << "x^" << count;
		}
		i = m_pol.next(i);
		++count;
	}
}

polynomial polynomial::somma(const polynomial& p) {
	polynomial sum;
	size_t i = m_pol.begin();
	size_t j = p.m_pol.begin();
	size_t start_idx = 0;
	while (!m_pol.end(i) || !m_pol.end(j)) {
		int val1 = (!m_pol.end(i)) ? m_pol.read(i) : 0;
		int val2 = (!p.m_pol.end(j)) ? m_pol.read(j) : 0;
		sum.m_pol.insert(val1 + val2, start_idx);
		if (!m_pol.end(i))
			i = m_pol.next(i);
		if (!m_pol.end(j))
			j = m_pol.next(j);
		++start_idx;
	}
	return sum;
}

polynomial polynomial::moltiplica(const polynomial& p) {
	polynomial mul;
	size_t mul_grado = grado() + p.grado();
	for (size_t i = 0; i <= mul_grado; ++i) {
		mul.m_pol.insert(0, i);
	}

	size_t i = m_pol.begin();
	while (!m_pol.end(i)) {
		size_t j = p.m_pol.begin();
		while (!p.m_pol.end(j)) {
			int cur_val = mul.m_pol.read(i + j);
			mul.m_pol.write(cur_val + (m_pol.read(i) * p.m_pol.read(j)), i + j);
			j = p.m_pol.next(j);
		}
		i = m_pol.next(i);
	}
	return mul;
}

int polynomial::valore(size_t idx) const {
	return m_pol.read(idx);
}

#endif
