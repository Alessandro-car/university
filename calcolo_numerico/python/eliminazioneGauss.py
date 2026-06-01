import numpy as np

def eliminazione_gauss(matA, b):
    n = len(b)
    U = matA.astype(float).copy()
    c = b.astype(float).copy()

    for k in range(n - 1):
        if U[k, k] == 0:
            pivot = False
            for i in range(k + 1, n):
                if U[i, k] != 0:
                    U[[k, i]] = U[[i, k]]
                    c[[k, i]] = c[[i, k]]
                    pivot = True
                    break
            if not pivot:
                raise ValueError("Matrice singolare")
        for i in range(k + 1, n):
            m = U[i, k] / U[k, k]
            U[i, :] -= m * U[k, :]
            c[i] -= m * c[k]
    return U, c

matA = np.array([[0, 2, 1],
              [1, 3, 2],
              [2, 1, 4]], dtype=float)
b = np.array([3, 7, 9], dtype=float)

U, c = eliminazione_gauss(matA, b)

print("U =\n", U)
print("c =", c)

# Verifica: risolvi Ux = c con back substitution
x = np.linalg.solve(U, c)
print("x =", x)

# Controllo: Ax dovrebbe dare b
print("Ax =", A @ x)
