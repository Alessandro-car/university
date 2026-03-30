def sum_of_divisors(n):
    sum = 0
    for i in range(1, n // 2 + 1):
        if n % i == 0:
            sum += i
    return sum

def is_perfect(n):
    if sum_of_divisors(n) == n:
        return True
    return False

def is_prime(n):
    for i in range(2, n - 1):
        if n % i == 0:
            return False
    return True

def mersenne_perfect(p):
    if is_prime(2 ** p - 1):
        return True
    return False

def main():
    for i in range(2, 10000):
        if is_perfect(i):
            print(f"Num {i} is perfect.")
    p_arr = [2, 3, 5, 7, 13]
    for p in range(2, 20):
        if mersenne_perfect(p):
            print(f"Num {(2 ** (p-1)) * (2 ** p - 1)} is perfect (p = {p})")
if __name__ == "__main__":
    main()
