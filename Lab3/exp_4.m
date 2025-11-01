% ===== 4. 录像带计数器模型 =====
clc; 
clear;
close all;

% 数据
% T: 时间
% N: 计数器读数
T = [0 10 20 30 40 50 60 70 80 90 100 110 120 130 140 150 160 170 184]';
N = [0000 0617 1141 1601 2019 2403 2760 3096 3413 3715 4004 4280 4545 4803 5051 5291 5525 5752 6061]';

% 拟合模型
% N = a*T^b
ft = fittype('a*x^b', 'independent', 'x', 'coefficients', {'a','b'});

% 初始化
startPoints = [30, 1];

% 拟合
[curve, gof] = fit(T, N, ft, 'StartPoint', startPoints);

% 输出结果
disp(curve);

% TOTAL值
T_total = 184; 
N_total = 6061; 

% 当前计数读数
N_now = 4450;

% 求对应时间
T_now = (N_now/curve.a)^(1/curve.b);
remain_time = T_total - T_now;

fprintf('录像带剩余时间约为 %.2f 分钟。\n', remain_time);

if remain_time >= 60
    disp('可以录下一小时节目。');
else
    disp('不能录下一小时节目。');
end

% 绘图验证计数器变慢
figure;
% 数据点
plot(T, N, 'r.', 'MarkerSize', 20, 'LineWidth', 1.5);
hold on;
% 拟合曲线
T_fit = linspace(min(T), max(T), 200);
N_fit = curve(T_fit);
plot(T_fit, N_fit, 'b-', 'LineWidth', 1.5);
% 标签
xlabel('时间 (min)');
ylabel('计数器读数');
title('录像带计数器模型拟合');
legend('实验数据', '拟合曲线', 'Location', 'best');
grid on;