clear;
clc;
syms x y a
f = exp(-1/(y^2-x^2));
L = limit(limit(f, x, 1/sqrt(y)), y, inf)