import numpy as np

def normalizza_vettore(v):
    return np.divide(v, np.linalg.norm(v))

def potenze_normalizzazione(A, tol, itmax):
    x = np.ones((len(A), 1))
    z = normalizza_vettore(x)

    idx = 0
    lam_old = 0
    err = tol + 1
    while (err > tol) and (idx < itmax):
        t = np.dot(A, z)
        z = normalizza_vettore(t)
        lam = np.dot(np.transpose(t), z)
        err = (lam - lam_old)
        idx += 1
    if idx == itmax and err > tol:
        print("Max iterazioni raggiunte")

    return lam, z


A_test = [
        [4, 1, 1],
        [1, 3, -1],
        [1, -1, 2]
    ]

tolleranza = 1e-6
iterazioni_max = 100

autovalore, autovettore = potenze_normalizzazione(A_test, tolleranza, iterazioni_max)
print(autovalore)
print(autovettore)

