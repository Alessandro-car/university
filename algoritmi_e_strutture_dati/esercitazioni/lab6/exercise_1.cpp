#include "../tipi_di_dato/queue/queue.h"

template <class T>
queue<T> get_positive_queue(const queue<T>& q);

int main() {
	queue<int> q;
	q.push(10);
	q.push(-2);
	q.push(-4);
	q.push(5);
	q.push(-7);
	q.push(1);
	q.print();
	queue<int> pos_q = get_positive_queue(q);
	pos_q.print();
	return 0;
}

template <class T>
queue<T> get_positive_queue(const queue<T>& q) {
	queue<T> pos_q;
	queue<T> tmp_q(q);
	while (!tmp_q.empty()) {
		if (tmp_q.front() >= 0)
			pos_q.push(tmp_q.front());
		tmp_q.pop();
	}
	return pos_q;
}
