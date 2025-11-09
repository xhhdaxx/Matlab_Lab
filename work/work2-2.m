% 证券配置模型

clc;
clear; 
close all;

% 证券数据：证券名、税前收益、市政（1为市政、0为非市政）、信用等级、到期年限
securities = {
    'A', 4.3, 1, 2, 9;    % 市政证券
    'B', 5.4, 0, 2, 15;   % 代办机构
    'C', 5.0, 0, 1, 4;    % 政府
    'D', 4.4, 0, 1, 3;    % 政府
    'E', 4.5, 1, 5, 2     % 市政证券
};

% 税前收益向量
profits = [4.3, 5.4, 4.8, 4.4, 4.5];

% 证券种类，市政证券标记为1，其他为0
municipal = [1, 0, 0, 0, 1];

% 信用等级向量
credit_rating = [2, 2, 1, 1, 5];

% 到期年限向量
maturity_years = [9, 15, 4, 3, 2];

% 目标函数：最大化税后收益
% 非市政证券税后收益是原来的50%
taxed_profits = profits .* (1 - 0.5*(1-municipal)); 

% 约束条件：
Aeq = ones(1, 5);  % 证券总投资额限制
beq = 1000;        % 资金总额

A1 = -[0, 1, 1, 1, 0]; % 代办机构+政府的证券
b1 = -400;             % 至少购进400万元

A2 = credit_rating; % 各种证券的信用等级
b2 = 1.4 * beq;    % 限制总投资的平均信用等级

A3 = maturity_years; % 各种证券的到期年限
b3 = 5 * beq;       % 限制总投资的平均到期年限

A = [A1; A2; A3];    % 不等式约束矩阵
b = [b1; b2; b3];    % 不等式约束向量

f = -taxed_profits;  

lb = zeros(5,1);  % 变量下界

% 求解线性规划
options = optimoptions('linprog', 'Display', 'off', 'Algorithm', 'dual-simplex');
[x, fval, exitflag, output] = linprog(f, A, b, Aeq, beq, lb, [], options);

% 输出结果
% 输出最优投资方案
disp('最优投资方案：');
for i = 1:5
    fprintf('证券%s: %.4f 万元\n', securities{i,1}, x(i));
end

% 验证约束条件
disp(' ');
fprintf('1. 总投资额 = %.2f 万元\n', sum(x));

gov_agency_invest = x(2) + x(3) + x(4);
fprintf('2. 政府及代办机构投资 = %.2f 万元 (要求: ≥400万元)\n', gov_agency_invest);

avg_credit = sum(credit_rating .* x') / sum(x);
fprintf('3. 平均信用等级 = %.4f (要求: ≤1.4)\n', avg_credit);

avg_maturity = sum(maturity_years .* x') / sum(x);
fprintf('4. 平均到期年限 = %.4f 年 (要求: ≤5年)\n', avg_maturity);

% 计算税后收益
total_profit = sum(taxed_profits .* x' / 100);  
fprintf('\n最大年税后收益: %.4f 万元\n', total_profit);
