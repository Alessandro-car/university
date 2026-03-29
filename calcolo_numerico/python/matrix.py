from numpy import *;

def sum(mat1, mat2):
    if (len(mat1) != len(mat2) or len(mat1[0]) != len(mat2[0])):
        print("The number of rows and columns of the matrices must be equal!");
        return;
    new_m = empty((len(mat1), len(mat1[0])));
    for i in range(len(mat1)):
        for j in range(len(mat1[i])):
            new_m[i][j] = mat1[i][j] + mat2[i][j];
    return new_m;

def matT(mat):
    new_m = empty((len(mat[0]), len(mat)));
    for row in range(len(mat[0])):
        for col in range(len(mat)):
            new_m[row][col] = mat[col][row];
    return new_m;

def submatrix(mat, rows, cols):
    new_m = empty((len(rows), len(cols)));
    for i, row in enumerate(rows):
        for j, col in enumerate(cols):
            new_m[i][j] = mat[row][col];
    return new_m;

def product(mat1, mat2):
    if (len(mat1[0]) != len(mat2)):
        print("The number of columns of the first matrix must be equal to the number of the rows of the second matrix!")
        return;
    new_m = empty((len(mat1), len(mat2[0])));
    for i in range(len(mat1)):
        for j in range(len(mat2[0])):
            el = 0;
            for k in range(len(mat2)):
                el += mat1[i][k] * mat2[k][j];
            new_m[i][j] = el;
    return new_m;

def det(mat):
    if (len(mat) != len(mat[0])):
        print("The matrix must be square.");
        return;
    if len(mat) == 1:
        return mat[0][0];
    if len(mat) == 2:
        return mat[0][0] * mat[1][1] - mat[0][1] * mat[1][0];
    val = 0;
    remaining_rows = arange(1, len(mat));
    for col in range(len(mat)):
        sign = (-1) ** col;
        remaining_cols = [c for c in range(len(mat)) if c != col];
        sub_mat = submatrix(mat, remaining_rows, remaining_cols);
        val += sign * mat[0][col] * det(sub_mat);
    return val;

def cofactor_mat(mat):
    new_m = empty((len(mat), len(mat)));
    for i in range(len(mat)):
        remaining_rows = [r for r in range(len(mat)) if r != i];
        for j in range(len(mat)):
            sign = (-1) ** (i + j);
            remaining_cols = [c for c in range(len(mat)) if c != j];
            sub_mat = submatrix(mat, remaining_rows, remaining_cols);
            new_m[i][j] = sign * det(sub_mat);
    return new_m;

def scalar_prod(mat, scalar):
    new_m = empty((len(mat), len(mat)));
    for i in range(len(mat)):
        for j in range(len(mat)):
            new_m[i][j] = mat[i][j] * scalar;
    return new_m;

def agg(mat):
    return matT(cofactor_mat(mat));

def inverse(mat):
    m_det = det(mat);
    if m_det == 0:
        print("The inverse exists only if the determinant is not zero!");
        return;
    return scalar_prod(agg(mat), 1 / m_det);

def get_ax(mat, x):
    if (len(mat[0]) != len(x)):
        print("The number of columns of the matrix and the length of the vector must be equal");
        return;
    ax = empty(len(mat));
    for i in range(len(mat)):
        el = 0;
        for j in range(len(x)):
            el += mat[i][j] * x[j];
        ax[i] = el;
    return ax;

def max(mat):
    val = {};
    max = 0;
    for i in range(len(mat)):
        for j in range(len(mat[i])):
            if mat[i][j] > max:
                max = mat[i][j];
                val = {"val": max, "row": i, "col": j};
    return val

def min(mat):
    val = {};
    min = mat[0][0];
    for i in range(len(mat)):
        for j in range(len(mat[i])):
            if mat[i][j] < min:
                min = mat[i][j];
                val = {"val": min, "row": i, "col": j};
    return val;


def main():
    mat1 = array([[1, 2, 3], [-1, 0, 1], [3, 1, -2]]);
    mat2 = array([[1, 0, 1], [-1, -2, 0], [3, -4, 3]]);
    print(sum(mat1, mat2));
    print(matT(mat1));
    print(submatrix(mat1, arange(len(mat1)), [0, 2]));
    print(product(mat1, mat2));
    print(det(mat1));
    print(det(mat2));
    print(inverse(mat1));
    print(get_ax(mat1, [3, 4, 5]));
    print(max(mat1));
    print(max(mat2));
    print(min(mat1));
    print(min(mat2));

if __name__ == '__main__':
    main();

