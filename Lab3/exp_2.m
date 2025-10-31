% ===== 2. 指数模型拟合 =====
clc; 
clear;
close all;

% 数据
t = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]'; 
y = [4.54, 4.99, 5.35, 5.65, 5.90, 6.10, 6.26, 6.39, 6.50, 6.59]' * 1e-3; 

% 拟合模型
% a+b*exp(-0.02*k*t)
ft = fittype('a+b*exp(-0.02*k*t)', 'independent', 't', 'coefficients', {'a','b','k'});

% 设置拟合选项
opts = fitoptions('Method', 'NonlinearLeastSquares', ...
    'StartPoint', [0.007, -0.001, 0.1], ...
    'Lower', [0.005, -0.01, 0], ...
    'Upper', [0.01, 0, 10], ...
    'MaxIter', 1000, ...
    'TolFun', 1e-10);

% 拟合
[curve, gof] = fit(t, y, ft, opts);

% 输出结果
disp(curve);
disp(gof);

% 绘图
figure;
% 数据点
plot(t, y, 'r.', 'MarkerSize', 20, 'LineWidth', 1.5);
hold on;
% 拟合曲线
t_fit = linspace(min(t), max(t), 200);
y_fit = curve(t_fit);
plot(t_fit, y_fit, 'b-', 'LineWidth', 1.5);
% 标签
xlabel('t');
ylabel('y(t)');
title('指数模型拟合结果');
legend('实验数据', '拟合曲线', 'Location', 'best');
grid on;