def interpolazione(x, y, z):
    n = len(x)
    if n != len(y):
        raise ValueError
    pn = 0
    for i in range(n):
        Lk = 1
        for j in range(n):
            if i != j:
                Lk *= (z - x[j]) / (x[i] - x[j])
        pn += Lk * y[i]

    return pn

x1 = [0, 1, 2]
y1 = [1, 3, 5]
z1 = 1.5
print(interpolazione(x1, y1, z1))

