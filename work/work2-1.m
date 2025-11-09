% 学生营养需求模型

clc;
clear; 
close all;
% 目标函数系数
f = [10, 15, 5, 60, 8]; 

% 约束条件（Ax <= b）
A = [
    -0.3, -1.2, -0.7, -3.5, -5.5;  % 蛋白质约束
    -73, -96, -20253, -890, -279;  % 维生素A约束
    -9.6, -7, -19, -57, -22        % 钙约束
];

b = [-50, -4000, -1000];  % 各个需求的右侧常数

% 非负约束
lb = [0, 0, 0, 0, 0];  

% 调用linprog求解线性规划
options = optimoptions('linprog', 'Display', 'off'); 
[x, fval] = linprog(f, A, b, [], [], lb, [], options);

% 输出结果
disp('最优食物用量:');
disp(['苹果: ', num2str(x(1)), ' 个']);
disp(['香蕉: ', num2str(x(2)), ' 个']);
disp(['胡萝卜: ', num2str(x(3)), ' 个']);
disp(['枣汁: ', num2str(x(4)), ' 杯']);
disp(['鸡蛋: ', num2str(x(5)), ' 个']);

disp(['最小费用: ', num2str(fval/10), ' 元']);
