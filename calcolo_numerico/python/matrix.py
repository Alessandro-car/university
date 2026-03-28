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
    for row in rows:
        for col in cols:
            new_m[row % len(rows)][col % len(cols)] = mat[row][col];
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



def main():
    mat1 = array([[1, 2, 3], [-1, 0, 1], [3, 1, -2]]);
    mat2 = array([[1, 0, 1], [-1, -2, 0], [3, -4, 3]]);
    print(sum(mat1, mat2));
    print(matT(mat1));
    print(submatrix(mat1, arange(len(mat1)), [len(mat1[0]) - 2]));
    print(product(mat1, mat2));
if __name__ == '__main__':
    main();

