clc; 
clear;
close all;

%  1. 函数求导

fprintf("---- 1.1 一阶导数 ----\n");

syms x

% y=e^x*sinx
y1 = exp(x)*sin(x);
dy1dx = diff(y1)

% y=ln(1-x^2)
y2 = log(1 - x^2);
dy2dx = diff(y2)

% y=x^x*lnx
y3 = x^x * log(x);
dy3dx = diff(y3)

% y=x^x
y4 = x^x;
dy4dx = diff(y4)

% y=sin(2^x)
y5 = sin(2^x);
dy5dx = diff(y5)

% y=ln(arccos2x)
y6 = log(acos(2*x));
dy6dx = diff(y6)



fprintf("\n---- 1.2 二阶导数 ----\n");

% y=(1+x^2)*arctanx
y7 = (1+x^2)*atan(x);
d2y7dx = diff(y7, x, 2)

% y=e^x*sinx
y8 = exp(x)*sin(x);
d2y8dx = diff(y8, x, 2)



fprintf("\n---- 1.3 隐函数导数 ----\n");

% (1) f(x,y)=0 求 dy/dx
% f = (x^2 + 2*x) * exp(x^2 + y^2 + 2*x*y)
syms x y
f = (x^2 + 2*x) * exp(x^2 + y^2 + 2*x*y);
dydx = - diff(f, x) / diff(f, y)


% (2) 隐函数二阶导 y''(0)
% x^2 - y + 1 = e^y

syms x y

F = x^2 - y + 1 - exp(y);

% y(0)
Y0 = solve(subs(F, x, 0) == 0, y);

% y'(x) = -F_x / F_y
dydx = - diff(F, x)/diff(F, y);
dydx0 = subs(dydx, [x y], [0 Y0]);

% y''(x)：用全导数链式法则
d2y = diff(dydx, x) + diff(dydx, y) * dydx;
d2y0 = subs(d2y, [x y], [0 Y0]);

% 输出
fprintf("y(0) = %.6f\n", double(Y0));
fprintf("y'(0) = %.6f\n", double(dydx0));
fprintf('d²y/dx²|x=0 = %.6f\n', double(d2y0));