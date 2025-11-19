syms x a b;
f = x*(1-2*a/x)^x*sin(3*b/x);
L = limit(f, x, inf)

