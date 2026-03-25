def fibonacci(m, n):
    x_prev = 1;
    x_curr = 1;
    fib_list = [];
    if m <= x_prev <= n:
        fib_list.append(x_prev);
        fib_list.append(x_curr);
    while True:
        xi = x_curr + x_prev;
        if xi > n:
            break
        if xi >= m:
            fib_list.append(xi)
        x_prev = x_curr;
        x_curr = xi;
    return fib_list;

print(fibonacci(4, 90))

def fibonacci_x(x):
    x_prev = 1;
    x_curr = 1;
    x_next = 0;
    for i in range(2, x):
        x_next = x_prev + x_curr;
        x_prev = x_curr;
        x_curr = x_next;
    return x_next;
print(fibonacci_x(12)) # 12-esimo elemento nella sequenza di fibonacci

