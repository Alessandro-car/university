function [x, n] = collaz(x0)
    n = 1;
    x(n) = x0; 
    while x0 ~= 1
        n = n + 1;
        if mod(x0, 2) == 0
            x0 = x0 / 2;
            x(n) = x0;
        else 
            x0 = 3 * x0 + 1;
            x(n) = x0;
        end
    end