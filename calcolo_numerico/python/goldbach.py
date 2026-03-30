def is_prime(n):
    for i in range(2, n - 1):
        if n % i == 0:
            return False
    return True

def goldbach():
    pairs = []
    for num in range(4, 200):
        if num % 2 == 0:
            found = False;
            i = 1;
            while i in range(200):
                j = 1;
                while j in range(200):
                    if is_prime(i) and is_prime(j) and i + j == num:
                        pairs.append({"Num": num, "P1": i, "P2": j})
                        found = True
                    j += 1;
                i += 1;
    return pairs
pairs = goldbach();
for pair in pairs:
    print(pair)
