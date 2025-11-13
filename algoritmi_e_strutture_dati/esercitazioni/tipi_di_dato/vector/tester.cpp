#include <iostream>
#include "vector.h"

using std::cout;
using std::endl;

int main() {
	myvec::vector<int> v1;
	srand(time(NULL));

	for(size_t i = 0 ; i < 100; i++)
	{
		v1.push_back(rand() % 100);
	}

	v1.print();

	myvec::vector<int> v2(v1.begin(), v1.end());

	cout << "v2 -> capacity = " << v1.capacity() << " ,size = " << v1.size() << endl;
	//v2.print();

	//cout << "Checking if v1 != v2: " << (v1 != v2) << endl;

	myvec::vector<int> v3 = {1,2,3,4,5,6,7};
  //v3.print();
	v3 = {6,7,8,9};
	//v3.print();

	myvec::vector<int> v4(5, 1.0);
	//v4.print();
	v4.assign(v3.begin(), v3.end());
	//v4.print();

	myvec::vector<int> v5;
	v5.assign(static_cast<size_t>(10), static_cast<int>(2));
	v5.print();

	cout << v5.size() << " " << v5.capacity() <<  endl;
	v5.push_back(5);
	v5.print();
	cout << v5.size() << " " << v5.capacity() << endl;
	v5.shrink();
	cout << v5.size() << " " << v5.capacity() << endl;
	v5.push_back(3);
	cout << v5.size() << " " << v5.capacity() << endl;
	v5.print();
	v5.insert(v5.begin() + 3, {1, 2, 3, 4});
	v5.print();
	v5.assign(5, 1);
	v5.print();
	return 0;
}
