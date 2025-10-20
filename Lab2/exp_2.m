%% 1.2 非线性曲线拟合
clc; clear; close all;

% 数据
t = [100 200 300 400 500 600 700 800 900 1000];
y = [4.54 4.99 5.35 5.65 5.90 6.10 6.26 6.39 6.50 6.59]*0.001;
A0 = [0.1, 0.05, 0.05];

% 模型
% y(t) = a + b * exp(-0.02 * k * t)
fun = @(A, t) A(1) + A(2) * exp(-0.02 * A(3) * t);
fun2 = @(A) A(1) + A(2)*exp(-0.02*A(3)*t) - y;

% 1. lsqcurvefit 
options = optimoptions('lsqcurvefit','Display','off');
A_lsq = lsqcurvefit(fun, A0, t, y, [], [], options);

% 2. lsqnonlin 
options = optimoptions('lsqnonlin','Display','off');
A_nonlin = lsqnonlin(fun2, A0, [], [], options);

% 输出
fprintf('lsqcurvefit结果：a=%.5f, b=%.5f, k=%.5f\n', A_lsq);
fprintf('lsqnonlin结果：a=%.5f, b=%.5f, k=%.5f\n', A_nonlin);

% 绘图
t_fit = linspace(100, 1000, 200);
y_fit_lsq = fun(A_lsq, t_fit);
y_fit_nonlin = fun(A_nonlin, t_fit);

figure;
plot(t, y, 'ro', 'MarkerFaceColor','r', 'DisplayName','原始数据'); hold on;
plot(t_fit, y_fit_lsq, 'b-', 'LineWidth', 1.5, 'DisplayName','lsqcurvefit拟合');
plot(t_fit, y_fit_nonlin, 'g--', 'LineWidth', 1.5, 'DisplayName','lsqnonlin拟合');

xlabel('t');
ylabel('y');
title('非线性拟合结果比较（lsqcurvefit vs lsqnonlin）');
legend('Location','best');
grid on;