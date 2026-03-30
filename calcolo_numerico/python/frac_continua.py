def frac_continua(x):
    if len(x) == 1:
        return x[0]
    sum = x[0] + 1 / frac_continua(x[1::])
    return sum

print(frac_continua([3, 4, 12, 4]))
