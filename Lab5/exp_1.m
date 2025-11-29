% Exp1: 压缩机生产销售存贮模型
clear; 
clc;
close all;

% 定义符号变量
syms T positive % 生产周期-正数

% 参数定义
r = 100;    % 需求速率
k = 500;    % 生产速率
c1 = 5;     % 准备费
c2 = 0.2;   % 存储费

% 目标函数：平均每月费用
CT = c1/T + (c2 * r * T / 2) * (1 - r/k);

% 求解导数为0的点
dT = diff(CT, T);
T_opt = solve(dT == 0, T);
T_val = double(T_opt); % 转换为数值

% 计算最优产量Q和最小费用
Q_opt = r * T_val;
Min_Cost = double(subs(CT, T, T_opt));

% 输出结果
fprintf('最佳生产周期 T: %.2f 月\n', T_val);
fprintf('最佳生产批量 Q: %.2f 套\n', Q_opt);
fprintf('最小平均每月费用: %.2f 万元\n', Min_Cost);