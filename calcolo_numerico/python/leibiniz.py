import math;
def leibiniz(tol = 1e-8, itmax = 1000000):
    i = 0;
    val = 0;
    arresto = False;
    to_add = 1;
    while not arresto:
        val +=  4 * ((-1)**i / to_add);
        arresto = abs(val - math.pi) <= tol;
        i += 1;
        to_add += 2;
    return val, i;

print(leibiniz())
