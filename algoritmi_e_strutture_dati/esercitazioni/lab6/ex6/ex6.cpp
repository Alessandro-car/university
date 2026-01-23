#include <iostream>
#include <stdexcept>
#include <string>
#include "../../tipi_di_dato/stack/stack.h"
#include "../../tipi_di_dato/queue/queue.h"

using std::cout;
using std::endl;

bool check_operator(char c) {
	if ((c < 40 || c > 43) && (c != 45 && c != 47))
		return false;
	return true;
}

int get_num(const std::string& exp, size_t idx) {
	std::string num = "";
	for (size_t i = idx; i < exp.size(); ++i) {
		if (exp.at(i) < 48 || exp.at(i) > 57)
			break;
		num.push_back(exp.at(i));
	}
	return std::stoi(num);
}

int parse_expression(const std::string& expression) {
	queue<std::string> s_operand;
	stack<char> s_operator;
	int result = 0;
	for (size_t i = 0; i < expression.length(); ++i) {
		if (check_operator(expression.at(i))) {
			if (expression.at(i) == ')') {
				while (!s_operator.empty()) {
					if (s_operator.top() != '(') {
						std::string op = std::to_string(s_operator.top());
						s_operand.push(op);
					}
					s_operator.pop();
				}
			} else {
				s_operator.push(expression.at(i));
			}
		} else {
			s_operand.push(std::to_string(get_num(expression, i)));
			while (expression.at(i) < 48 || expression.at(i) > 57)
				i += 1;
		}
	}
	s_operand.print();
	return result;
}

typedef struct {
	char name;
	int value;
} symbol;

int get_value(myvec::vector<symbol>& symbols, char symbol) {
	for (size_t i = 0; i < symbols.size(); ++i) {
		if (symbols[i].name == symbol)
			return symbols[i].value;
	}
	throw std::runtime_error("No symbol found with that name");
}

void handle_assignment(myvec::vector<symbol>* symbols, std::string& exp) {
	symbol s;
	s.name = exp.at(1);
	exp.replace(1, 1, " ");
	std::string charset = "abcdefghijklmnopqrstuvwxyz";
	size_t idx = exp.find_first_of(charset);
	if (idx != std::string::npos) {
		int val = get_value(*symbols, exp.at(idx));
		exp.replace(idx, 1, std::to_string(val));
	}
	int val = parse_expression(exp.substr(3));
	s.value = val;
	symbols->push_back(s);
}

int main() {
	std::string expression = "35+17*(40-9)-7";
	cout << parse_expression(expression) << endl;
}
