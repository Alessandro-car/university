from numpy import *;
def find_el(mat, e):
    for i in range(len(mat)):
        if mat[i][0] == e:
            return True;
    return False;

def convert(x):
    mat = empty((4, 2));
    n_row = 0;
    for i in range(len(x)):
        if not find_el(mat, x[i]):
            mat[n_row][0] = x[i];
            mat[n_row][1] = x.count(x[i]);
            n_row += 1;
    return mat;

x = [6, 4, 0, 6, 8, 0, 0];
print(convert(x));
