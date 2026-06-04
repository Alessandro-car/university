import numpy as np

def norma_uno(A):
    [row, col] = np.shape(A)
    if row == col:
        raise ValueError("La matrice deve essere rettangolare")
    norma1 = 0
    for j in range(col):
        sum_col = 0
        for i in range(row):
            sum_col += abs(A[i, j])
        if sum_col > norma1:
            norma1 = sum_col
    return norma1

matrix_a1 = np.array([
    [1, -6, 5],
    [2, 8, -3]
])

# Second Matrix A (3 rows, 2 columns)
matrix_a2 = np.array([
    [1, 2],
    [-3, -2],
    [-1, -3]
])

# Display the results
print(matrix_a1)
print(norma_uno(matrix_a1))
print(matrix_a2)
print(norma_uno(matrix_a2))

