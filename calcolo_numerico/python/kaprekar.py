def check_input(n):
    if len(str(n)) < 4:
        return False
    for c in str(n):
        if str(n).count(c) >= 3:
            return False
    return True

def cond(n1, n2, desc):
    if desc:
        return n1 < n2
    return n1 > n2

def order_num(n, desc):
    for i in range(len(n) - 1):
        for j in range(i + 1, len(n)):
            if cond(n[i], n[j], desc):
                tmp = n[i]
                n[i] = n[j]
                n[j] = tmp
    return int(''.join(str(digit) for digit in n))

def kaprekar(n):
    i = 1
    num = n
    while num != 6174:
        largest = order_num(list(map(int, str(num))), desc = True)
        smallest = order_num(list(map(int, str(num))), desc = False)
        num = largest - smallest
        if num != 6174:
            i += 1
    return ({"Num": n, "Steps": i})

data = [{}]
for i in range(1001, 10000):
    if check_input(i):
        data.append(kaprekar(i))

max_steps = max(data, key=lambda x: x.get("Steps", 0))
print(f"The number that has the maximum steps is {max_steps["Num"]} with {max_steps["Steps"]} steps.")
