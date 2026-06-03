import numpy as np

def gauss_max_pivot(A, b):
    n = len(b)
    U = A.astype(float).copy()
    c = b.astype(float).copy()
    swap_row = 0
    for k in range(n - 1):
        max = abs(U[k, k])
        swap_row = k
        for i in range(k + 1, n):
            if abs(U[i, k]) > max:
                max = abs(U[i, k])
                swap_row = i
        if swap_row != k:
            U[[k, swap_row]] = U[[swap_row, k]]
            c[[k, swap_row]] = c[[swap_row, k]]
        for i in range(k + 1, n):
            m = U[i, k] / U[k, k]
            U[i, :] -= m * U[k, :]
            c[i] -= m * c[k]
    print(U)
    print(c)
    return np.linalg.solve(U, c)

A = np.array([[0, 2, 1],
              [1, 3, 2],
              [2, 1, 4]], dtype=float)
b = np.array([3, 7, 9], dtype=float)

x = gauss_max_pivot(A, b)
print(x)
