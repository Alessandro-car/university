def sort_sequence(x):
    for i in range(len(x) - 1):
        for j in range(i + 1, len(x)):
            if x[i] > x[j]:
                tmp = x[i]
                x[i] = x[j]
                x[j] = tmp
    return x

def farey(n):
    sequence = []
    for num in range(n):
        for den in range(1, n + 1):
            if num / den not in sequence and (0 <= num / den <= 1):
                sequence.append(round(num / den, 2))
    return sort_sequence(sequence)

print(farey(8))

