#include <cctype>
#include <iostream>
#include "../tipi_di_dato/bin_tree/bin_tree.h"
#include "../tipi_di_dato/queue/queue.h"
#include "../tipi_di_dato/stack/stack.h"

using namespace std;

template <class T>
void print_inorder(bin_tree<T>& tree, node<T>* n) {
    if (n == nullptr) return;

    if (!tree.left_empty(*n)) {
        print_inorder(tree, tree.left(*n));
    }

    cout << tree.read(*n) << " ";

    if (!tree.right_empty(*n)) {
        print_inorder(tree, tree.right(*n));
    }
}

// Helper function to print tree structure
template <class T>
void print_tree(bin_tree<T>& tree, node<T>* n, int level = 0) {
    if (n == nullptr) return;

    if (!tree.right_empty(*n)) {
        print_tree(tree, tree.right(*n), level + 1);
    }

    for (int i = 0; i < level; i++) cout << "    ";
    cout << tree.read(*n) << endl;

    if (!tree.left_empty(*n)) {
        print_tree(tree, tree.left(*n), level + 1);
    }
}

bool check_operator(char c) {
	switch (c) {
			case '+':
			case '-':
			case '*':
			case '/':
					return true;
			default:
					return false;
	}
}

std::string get_num(const std::string& exp, size_t& idx) {
	std::string num = "";
	while (idx < exp.size() && std::isdigit(exp[idx])) {
		num.push_back(exp[idx]);
		++idx;
	}
	if (idx > 0)
		--idx;
	return num;
}

queue<string> parse_expression(const std::string& expression) {
	queue<string> s_operand;
	stack<char> s_operator;
	for (size_t i = 0; i < expression.length(); ++i) {
		if (expression.at(i) == ' ')
			continue;

		if (std::isdigit(expression.at(i))) {
			s_operand.push(get_num(expression, i));
		}
		if (expression.at(i) == '(')
			s_operator.push(expression.at(i));

		if (expression.at(i) == ')') {
			while (!s_operator.empty()) {
				if (s_operator.top() != '(')
					s_operand.push(std::string(1, s_operator.top()));
				s_operator.pop();
			}
		}

		if (check_operator(expression.at(i)))
			s_operator.push(expression.at(i));
	}
	while (!s_operator.empty()) {
		if (s_operator.top() != '(')
			s_operand.push(std::string(1, s_operator.top()));

		s_operator.pop();
	}
	return s_operand;
}

bin_tree<string> build_ast(queue<string>& postfix_exp) {
	stack<bin_tree<string>*> ast_stack;
	while (!postfix_exp.empty()) {
		string tok = postfix_exp.front();
		postfix_exp.pop();

		if (check_operator(tok[0])) {
			if (ast_stack.size() < 2)
				continue;

			bin_tree<string>* right = ast_stack.top();
			ast_stack.pop();

			bin_tree<string>* left = ast_stack.top();
			ast_stack.pop();

			left->insert_subtree(std::move(*right));

			if (left->root() != nullptr)
				left->write(tok, *left->root());
			ast_stack.push(left);
			delete right;
		} else {
			bin_tree<string>* leaf = new bin_tree<string>();
			leaf->insert_root();
			leaf->write(tok, *leaf->root());
			ast_stack.push(std::move(leaf));
		}
	}

	bin_tree<string> ast = std::move(*ast_stack.top());
	delete ast_stack.top();
	return ast;
}


int main() {
	string exp = "(5-3)*(9-2)";
	queue<string> postfix_exp = parse_expression(exp);
	postfix_exp.print();
	bin_tree<string> btree = build_ast(postfix_exp);
	print_tree(btree, btree.root());
	return 0;
}
