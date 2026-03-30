def is_prime(n):
    for i in range(2, n - 1):
        if n % i == 0:
            return False
    return True

def twin_prime():
    pairs = []
    for i in range(2, 1000):
        if is_prime(i) and is_prime(i + 2):
            pairs.append((i, i + 2))
    return pairs

pairs = twin_prime()
for pair in pairs:
    print(pair)

