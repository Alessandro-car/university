function x = frac_continua(a, index)
    if nargin == 1
        index = 1;
    end
    x = 0;
    if index == length(a)
        x = a(index);
    else
        x = a(index) + (1 / (frac_continua(a, index + 1)));
    end

