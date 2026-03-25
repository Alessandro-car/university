#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 23 10:35:41 2026

@author: alessandro
"""

import math;
from numpy import *;

def eq2(a, b, c):
    delta = b*b - (4 * a * c)
    if (delta >= 0):
            x1 = (-b + math.sqrt(delta)) / (2 * a)
            x2 = (-b - math.sqrt(delta)) / (2 * a)
            return [x1, x2]
    else:
        print("Il delta e' negativo!")
        return

def inverti(s):
    s = list(s)
    for i in range(0, int(len(s) / 2)):
        tmp = s[i]
        s[i] = s[len(s) - i - 1]
        s[len(s) - i - 1] = tmp
    return "".join(s)
        
def mcd(m, n):
    if n == m:
        return m
    if m > n:
        return mcd(m - n, n)
    else:
        return mcd(m, n - m)

def somma(x):
    sum_el = 0
    for el in x:
        sum_el += el
    print(sum_el == sum(x))
    return sum_el

def media(x):
    media_el = somma(x) / len(x)
    print(media_el == mean(x))
    return media_el

def varianza(x):
    squared = list()
    for el in x:
        squared.append(el * el)
    variance = media(squared) - (media(x) * media(x))
    print(variance == var(x))
    return variance

def main():
    sol = eq2(1, -5, 6)
    if sol != None:
        print(sol)
    print(inverti("prov"))
    print(mcd(30, 18))
    x = [1.5, -0.2, -3.1, 2.6]
    print(somma(x))
    media(x)
    varianza(x)

if __name__ == '__main__':
    main()
