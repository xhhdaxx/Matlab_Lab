clc;
clear;
f = @(x) (x(1)^2-x(1))*exp(-x(1)^2-x(2)^2-x(1)*x(2));
opt = optimset('Display', 'iter');
[x, fmin] = fminsearch(f, [2,1],opt);


