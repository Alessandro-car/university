import numpy as np

def potenze(A, tol):
    n = A.shape[0]
    x = np.ones(n)

    lam_old = 0
    while True:
        y = np.dot(A, x)

        # Autovalore sigma_k = (x^T * y) / (x^T * x)
        num = np.dot(np.transpose(x), y)
        denom = np.dot(np.transpose(x), x)
        lam = num / denom
        if abs(lam - lam_old) < tol:
            return lam

        lam_old = lam
        x = y
    return lam

A = np.array([[0, 2, 1],
              [1, 3, 2],
              [2, 1, 4]], dtype=float)
print(potenze(A, 1e-16))
