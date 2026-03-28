from numpy import *;

def count_zeros_col(mat):
    result = [];
    for col in range(len(mat)):
        count = 0;
        for row in range(len(mat)):
            if mat[row][col] == 0:
                count += 1;
        result.append((count, col));
    return sorted(result, reverse=True);

def swap(mat):
    new_m = empty((len(mat), len(mat)));
    zero_count = count_zeros_col(mat);
    idx = 0;
    for col in range(len(mat)):
        for row in range(len(mat)):
            new_m[row][col] = mat[row][zero_count[idx][1]];
        idx += 1;
    return new_m;

A = array([[1, 1, 5, 0], [9, 7, 0, 0], [1, 2, -1, 1], [0, 1, 0, 0]]);
print(swap(A));


