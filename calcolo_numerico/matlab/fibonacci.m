function y = fibonacci(x)
if x <= 1
    y = x;
else
    y = fibonacci(x - 1) + fibonacci(x - 2);
end
