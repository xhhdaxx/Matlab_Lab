% ===== 3. 鲈鱼体重-长度关系模型 =====
clc; 
clear;
close all;

% 数据
L = [36.8 31.8 43.8 36.8 32.1 45.1 35.9 32.1]'; 
W = [765 482 1162 737 482 1389 652 454]'; 

% 拟合模型
% W = a * L^b
ft = fittype('a*x^b', 'independent', 'x', 'coefficients', {'a','b'});

% 初始化
startPoints = [1e-5, 1];

% 拟合
[curve, gof] = fit(L, W, ft, 'StartPoint', startPoints);

% 输出结果
disp(curve);
disp(gof);

% 绘图
figure;
% 数据点
plot(L, W, 'r.', 'MarkerSize', 20, 'LineWidth', 1.5);
hold on;
% 拟合曲线
L_fit = linspace(min(L), max(L), 200);
W_fit = curve(L_fit);
plot(L_fit, W_fit, 'b-', 'LineWidth', 1.5);
% 标签
xlabel('鱼长度 L (cm)');
ylabel('鱼质量 W (g)');
title('鲈鱼长度-质量关系拟合');
legend('实验数据', '拟合曲线', 'Location', 'best');
grid on;