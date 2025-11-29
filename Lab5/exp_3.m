% Exp3: 生猪销售模型
clear; 
clc;
close all;

% 定义符号变量
syms t real           % 时间参数
syms cost_daily real  % 饲养成本参数
syms weight_gain real % 增重速率参数

% --- 原始模型求解 ---
Profit_orig = (80 + 2*t) * (8 - 0.1*t) - 4*t;

% 求导找极值
d_Profit = diff(Profit_orig, t);
t_opt = double(solve(d_Profit == 0, t));
max_profit = double(subs(Profit_orig, t, t_opt));

% 输出
fprintf('=== 原始模型求解结果 ===\n');
fprintf('最佳出售时间 %.2f 天\n', t_opt);
fprintf('最大利润: %.2f 元\n', max_profit);

% --- 1. 饲养费用灵敏性分析 ---
fprintf('\n=== 1. 饲养费用灵敏性分析 ===\n');
% 设饲养费用为 x 元/天
Profit_sens = (80 + 2*t) * (8 - 0.1*t) - cost_daily*t;
t_sens_func = solve(diff(Profit_sens, t) == 0, t);

% 输出
fprintf('饲养费用(元/天)\t 最佳时间(天)\t 最大利润(元)\n');
costs_to_check = [2, 3, 4, 5, 6];
for c_val = costs_to_check
    t_val = double(subs(t_sens_func, cost_daily, c_val));
    p_val = double(subs(Profit_sens, {t, cost_daily}, {t_val, c_val}));
    fprintf('%.2f\t\t %.2f\t\t %.2f\n', c_val, t_val, p_val);
end

% --- 2 新饲养方法讨论 ---
fprintf('\n=== 2. 新饲养方式分析 ===\n');
% 新方法：费用6元，增重4kg
Profit_new = (80 + 4*t) * (8 - 0.1*t) - 6*t;
t_new_opt = double(solve(diff(Profit_new, t) == 0, t));
max_profit_new = double(subs(Profit_new, t, t_new_opt));

fprintf('最佳出售时间: %.2f 天，最大利润: %.2f 元\n', t_new_opt, max_profit_new);


% --- 求使饲养方式值得改变的最小增重率g ---
% 设增重率为g, 费用固定为6元
Profit_g = (80 + weight_gain*t) * (8 - 0.1*t) - 6*t;
% 计算最优时间
d_Profit_g = diff(Profit_g, t);
t_opt_g = solve(d_Profit_g == 0, t); 
% 只含g的最大利润函数 MaxP(g)
MaxP_g = subs(Profit_g, t, t_opt_g);

% 计算MaxP_g > max_profit临界值
g_critical_sol = solve(MaxP_g == max_profit, weight_gain);

% 取合理的实数解(大于2)
g_vals = double(g_critical_sol);
valid_g = g_vals(g_vals > 2); 

% 输出
fprintf('使新方式值得改变的最小增重率: %.2f kg/天\n', min(valid_g));