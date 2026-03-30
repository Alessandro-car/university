def recaman():
    sequence = [0]
    n = 0
    for i in range(1, 70):
        if (n - i) > 0 and (n - i) not in sequence:
            sequence.append((n - i))
            n -= i
        else:
            sequence.append(n + i)
            n += i
    return sequence

print(recaman())
