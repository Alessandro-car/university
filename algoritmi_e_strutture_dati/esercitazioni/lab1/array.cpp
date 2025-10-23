#include <iostream>

using namespace std;

typedef struct {
	int pos;
	int value;
} element;

int greaterThan(const int (&A)[], int dim, int k);
bool member(const int (&A)[], int dim, int k);
element largest(const int (&A)[], int dim);
void remove(int (&A)[], int dim, int k);
void left_shift(int (&A)[], int dim, int index);
bool ascendent_order(const int (&A)[], int dim);
bool descended_order(const int (&A)[], int dim);
int ordering(const int (&A)[], int dim);
void reverse(int (&A)[], int dim);

int main() {
	int dim = 10;
	int A[10] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
	int k = 4;
	cout << greaterThan(A, dim, k) << endl;
	cout << member(A, dim, k) << endl;
	element greatest_value = largest(A, dim);
	cout << greatest_value.pos << " " << greatest_value.value << endl;
	cout << ordering(A, dim) << endl;
	reverse(A, dim);

	for (int i = 0; i < dim; i++) {
		cout << A[i] << ";";
	}
	cout << endl;

	remove(A, dim, k);
	for (int i = 0; i <  dim; i++) {
		cout << A[i] << ";";
	}
	cout << endl;
	return 0;
}

int greaterThan(const int (&A)[], int dim, int k) {
	int count = 0;
	for (int i = 0; i < dim; i++) {
		if (A[i] > k) {
			++count;
		}
	}
	return count;
}

bool member(const int (&A)[], int dim, int k) {
	for (int i = 0; i < dim; i++) {
		if (A[i] == k) {
			return true;
		}
	}
	return false;
}

element largest(const int (&A)[], int dim) {
	element greatest;
	greatest.pos = 0;
	greatest.value = 0;
	for (int i = 0; i < dim; i++) {
		if (A[i] > greatest.value) {
			greatest.value = A[i];
			greatest.pos = i;
		}
	}
	return greatest;
}

void left_shift(int (&A)[], int dim, int index) {
	for (int i = index; i < dim - 1; i++) {
		A[i] = A[i + 1];
	}
}

void remove(int (&A)[], int dim, int k) {
	int index = 0;
	for (int i = 0; i < dim; i++) {
		if (A[i] == k) {
			index = i;
		}
	}
	if (index < dim) {
		left_shift(A, dim, index);
	}
	A[dim - 1] = 0;
}

bool ascendent_order(const int (&A)[], int dim) {
	for (int i = 0; i < dim - 1; i++) {
		if (A[i] > A[i + 1]) {
			return false;
		}
	}
	return true;
}

bool descended_order(const int (&A)[], int dim) {
	for (int i = 0; i < dim - 1; i++) {
		if (A[i] < A[i + 1]) {
			return false;
		}
	}
	return true;
}

int ordering(const int (&A)[], int dim) {
	bool ascendent = ascendent_order(A, dim);
	bool descendent = descended_order(A, dim);

	if (ascendent) {
		return 0;
	}
	if (descendent) {
		return 1;
	}

	return 2;
}

void reverse(int (&A)[], int dim) {
	for (int i = 0; i <= dim / 2; i++) {
		swap(A[i], A[dim - i - 1]);
	}
}
