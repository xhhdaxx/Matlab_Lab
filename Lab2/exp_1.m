%% 1.1 多项式拟合（线性最小二乘拟合）
clc; clear; close all;

% 数据
x = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
y = [-0.447 1.978 3.28 6.16 7.08 7.34 7.66 9.56 9.48 9.30 11.2];

% 模型
p = polyfit(x, y, 2);
disp('二次多项式拟合结果：');
fprintf('y = (%.4fx^2)+ (%.4fx) + (%.4f)\n', p(1), p(2), p(3));

% 绘图
xx = linspace(0, 1, 100);
yy = polyval(p, xx);
plot(x, y, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(xx, yy, 'b-', 'LineWidth', 1.5);
xlabel('x'); ylabel('y');
title('二次多项式最小二乘拟合');
legend('原始数据', '拟合曲线');
grid on;