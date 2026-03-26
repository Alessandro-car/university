import math;

def eval_sum(n):
    if n == 1:
        return (math.sqrt(2));
    return (math.sqrt(2 + eval_sum(n-1)));

def viete(tol = 1e-8, itmax = 100):
    i = 0;
    val = 2;
    arresto = False;
    while not arresto and i < itmax:
        i += 1;
        val *= (2 / eval_sum(i));
        arresto = abs(val - math.pi) <= tol;
    return val, i;

print(viete());
