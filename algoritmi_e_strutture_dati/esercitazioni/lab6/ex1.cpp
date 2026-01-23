#include "../tipi_di_dato/queue/queue.h"
#include <iostream>

using std::cout;
using std::endl;

template <class T>
void print_queue(const queue<T>& q) {
	queue<T> tmp(q);
	while (!tmp.empty()) {
		cout << tmp.front() << " ";
		tmp.pop();
	}
	cout << endl;
}

queue<int> positive_queue(queue<int>& q) {
	queue<int> pos_q;
	while (!q.empty()) {
		if (q.front() >= 0)
			pos_q.push(q.front());
		q.pop();
	}
	return pos_q;
}

int main() {
	queue<int> q;
	q.push(-1);
	q.push(3);
	q.push(5);
	q.push(-2);
	q.push(10);
	q.push(-3);
	print_queue(q);
	queue<int> pos_q = positive_queue(q);
	print_queue(pos_q);
}
