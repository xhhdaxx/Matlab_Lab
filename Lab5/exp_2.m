% Exp2: 汽车销售折扣模型
clear; 
clc;
close all;

syms x real % 折扣金额
syms S real % 每100美元带来的销量增长率

% --- 1. 求解最优折扣(S=0.15) ---
fprintf('=== 1. 求解最优折扣(S=0.15) ===\n');
S_val = 0.15;
% 销量增长因子 (每100元增长15% -> x元增长 x/100 * 0.15)
Growth_factor = 1 + (S_val/100) * x; 
Unit_Profit = 1500 - x;

% 目标函数 (忽略常数n0)
Obj_Func = Growth_factor * Unit_Profit;

% 求导并解方程
dObj = diff(Obj_Func, x);
x_opt = solve(dObj == 0, x);
x_opt_val = double(x_opt);

% 输出
fprintf('最佳折扣金额: %.2f 美元\n', x_opt_val);


% --- 2. 灵敏性分析 ---
fprintf('\n=== 2. 灵敏性分析 ===\n');
% 销量增长因子
Growth_factor_sym = 1 + (S/100) * x;
Unit_Profit_sym = 1500 - x;

% 目标函数
Obj_sym = Growth_factor_sym * Unit_Profit_sym;

% 求导并解方程
dObj_sym = diff(Obj_sym, x);
x_opt_sym = solve(dObj_sym == 0, x);

% 代入S不同值并观察变化
S_range = [0.10, 0.15, 0.20];
x_sens = double(subs(x_opt_sym, S, S_range));

% 计算各S值对应的最优收益
profit_ratio = zeros(1, length(S_range));
for i = 1:length(S_range)
    current_S = S_range(i);
    current_x_opt = x_sens(i);
    % 计算当前最优收益
    current_profit = double(subs(subs(Obj_sym, S, current_S), x, current_x_opt));
    % 计算相对于原始收益的百分比
    profit_ratio(i) = (current_profit / 1500) * 100;
end

% 输出
fprintf('最优折扣x关于增长率S的函数关系: x(S) = %s\n', char(x_opt_sym));
fprintf('S=0.10时, x=%.2f, 收益为原来的%.2f%%;\n', x_sens(1), profit_ratio(1));
fprintf('S=0.15时, x=%.2f, 收益为原来的%.2f%%;\n', x_sens(2), profit_ratio(2));
fprintf('S=0.20时, x=%.2f, 收益为原来的%.2f%%;\n', x_sens(3), profit_ratio(3));


% --- 3. 假设增长率为10% ---
fprintf('\n=== 3. 模型增长率为10%% ===\n');
S_new = 0.10;
x_new_opt = double(subs(x_opt_sym, S, S_new));
fprintf('最佳折扣应为: %.2f 美元\n', x_new_opt);