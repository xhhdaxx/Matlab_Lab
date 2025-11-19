clc; 
clear;
close all;

% 3. 模型求解：效用最大化模型

% 假设量
a = 2; 
alpha = 0.4;
beta = 0.6;
% 约束条件：p1*x + p2*y = s
p1 = 3;
p2 = 2;
s = 100;

% 效用函数（带预算约束）
% U(x,y)=a(x^α)(y^β)
U = @(v) - a * v(1)^alpha * v(2)^beta;   % 取负，便于最大化→最小化

% 约束 y = (s - p1*x)/p2
U1d = @(x) - a * x.^alpha .* ((s - p1*x)/p2).^beta;

% 定义可行域：x ∈ (0, s/p1)
lb = 1e-6;
ub = s/p1 - 1e-6;

[x_star, U_star_neg] = fminbnd(U1d, lb, ub);
y_star = (s - p1*x_star)/p2;

U_star = -U_star_neg;

fprintf("最优 x = %.4f\n", x_star);
fprintf("最优 y = %.4f\n", y_star);
fprintf("最大效用 U = %.4f\n", U_star);

