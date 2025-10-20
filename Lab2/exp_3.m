%% 2.1 汽车刹车距离拟合
clc; clear; close all;

% 数据
v = [20 40 60 80 100 120 140]';    % 车速 (km/h)
d = [6.5 17.8 33.6 57.1 83.4 118.0 153.5]';  % 刹车距离 (m)

% 单位换算：km/h -> m/s
v = v * 1000 / 3600;

% 模型
% d = p1*v^2 + p2*v + p3
p = polyfit(v, d, 2);
p(3) = 0;

% 输出
fprintf('模型：d = %.4f*v^2 + %.4f*v\n', p(1), p(2));

% 参数
c2 = p(1);
c1 = p(2);
a = 1 / (2 * c2);

fprintf('c1 (反应时间) = %.4f s\n', c1);
fprintf('c2 (比例系数) = %.6f s^2/m\n', c2);
fprintf('刹车时的减速度 a = %.3f m/s^2\n', a);

% 拟合曲线
v_fit = linspace(min(v), max(v), 200);
d_fit = polyval(p, v_fit);

% 绘图
figure;
plot(v, d, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', '实验数据'); hold on;
plot(v_fit, d_fit, 'b-', 'LineWidth', 1.5, 'DisplayName', 'polyfit拟合曲线');
xlabel('速度 v (m/s)');
ylabel('刹车距离 d (m)');
title('刹车距离最小二乘拟合（polyfit方法）');
legend('Location', 'northwest');
grid on;