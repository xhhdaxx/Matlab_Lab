clc; 
clear;
close all;

% 2. 函数极值

fprintf("\n---- 2.1 一元函数极值 ----\n");

% (1) y = x + sqrt(1-x)在[-5,1]的最小值
f1 = @(x) x + sqrt(1 - x);
[xmin1, fmin1] = fminbnd(f1, -5, 1)


% (2) 平均成本最小值
% C(q)=0.25q^2+15q+1600
syms q
C = 0.25*q^2 + 15*q + 1600;
AC = C/q;            % 平均成本
dAC = diff(AC);
q_opt = solve(dAC == 0);     % 最优产量
AC_min = subs(AC, q, q_opt)


fprintf("---- 2.2 多元函数极值 ----\n");

% f(x,y) = (4x^2+2y^2+4xy+2y+1)*exp(x)
f2 = @(v) (4*v(1)^2 + 2*v(2)^2 + 4*v(1)*v(2) + 2*v(2) + 1) * exp(v(1));
opt = optimset('Display', 'iter');

[x_opt, f_min2] = fminsearch(f2, [1,1], opt)
