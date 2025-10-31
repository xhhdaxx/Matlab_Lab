% ===== 1. 酒精含量变化数学模型 =====
clc;
clear; 
close all;

% 数据
t = [0.25 0.5 0.75 1 1.5 2 2.5 3 3.5 4 4.5 5 6 7 8 9 10 11 12 13 14 15 16]';
c = [30 68 75 82 82 77 68 68 58 51 50 41 38 35 28 25 18 15 12 10 7 7 4]';

% 拟合模型
% a1*(exp(-a2*x)-exp(-a3*x))
ft = fittype('a1*(exp(-a2*x)-exp(-a3*x))', 'independent', 'x', 'coefficients', {'a1','a2','a3'});

% 初始化
startPoints = [100 0.5 0.05];

% 拟合
[curve, gof] = fit(t, c, ft, 'StartPoint', startPoints);

% 输出结果
disp(curve);
disp(gof);

% 绘图
figure;
% 数据点
plot(t, c, 'r.', 'MarkerSize', 20, 'LineWidth', 1.5);
hold on;
% 拟合曲线
t_fit = linspace(min(t), max(t), 200);
c_fit = curve(t_fit);
plot(t_fit, c_fit, 'b-', 'LineWidth', 1.5);
% 标签
xlabel('时间 (小时)');
ylabel('酒精含量 (mg/100mL)');
title('血液酒精含量拟合曲线');
legend('实验数据', '拟合曲线', 'Location', 'best');
grid on;