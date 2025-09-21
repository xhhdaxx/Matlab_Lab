%% lab_matlab_experiment.m
% 实验：掌握 MATLAB 基础（数组/矩阵、运算、流程控制、绘图）
% 保存并在 MATLAB 中运行此脚本。脚本按题目顺序组织。

%% ========================
%% 1. 命令窗口操作（创建数组/矩阵、基本运算）
%% ========================

% 创建数组
A = [3 10 1 6 5];           % 指定元素数组
a = 2:2:10;                 % 等差数组，起始2，步长2，终值10 -> [2 4 6 8 10]
b = 2:3:10;                 % 等差数组，起始2，步长3，终值不超过10 -> [2 5 8]
c = linspace(2,8,8);        % linspace 在 [2,8] 上创建包含8个元素的等差数组

disp('A ='); disp(A);
disp('a ='); disp(a);
disp('b ='); disp(b);
disp('c ='); disp(c);

% 创建矩阵 B ： 第一列和第四列是 A'，第2列为 (A+1)'，第3列为 (A-1)'
B = [A.' (A+1).' (A-1).' A.'];   % 各列按要求排列（注意转置）
disp('B ='); disp(B);

% 将矩阵 B 的第2~5行中的第1、3列元素赋值给矩阵 C
C = B(2:5, [1 3]);   % 索引行列并赋值
disp('C ='); disp(C);

% 数组与矩阵的运算
% 注意：A 与 a 长度相同，因此可以直接逐元素运算
sum_Aa = A + a;       % 向量加
mul_Aa = A .* a;      % 逐元素乘
pow_Aa = A .^ a;      % 逐元素幂

disp('A + a ='); disp(sum_Aa);
disp('A .* a ='); disp(mul_Aa);
disp('A .^ a ='); disp(pow_Aa);

% 删除矩阵 B 的第2行
B_deleted = B; B_deleted(2,:) = [];   % 保留原 B，生成 B_deleted
disp('删除第2行后的 B ='); disp(B_deleted);

% 求矩阵 B 的大小和维数
szB = size(B);
ndB = ndims(B);
disp(['B 大小 size = [', num2str(szB), ']']);
disp(['B 维数 ndims = ', num2str(ndB)]);


%% ========================
%% 2. MATLAB 程序设计
%%    (1) 求 n = 1..20 的 n! 和
%%    (2) 从键盘输入 4x5 矩阵，求最大/最小值及位置
%%    (3) 自由落体反弹问题（第10次落地总路程）
%% ========================

% (1) 使用循环求和：sum_{n=1}^{20} n!
sumFactorial = 0;
for n = 1:20
    sumFactorial = sumFactorial + factorial(n);
end
disp(['1..20 的阶乘之和（循环计算） = ', num2str(sumFactorial)]);

% 也可使用向量化（MATLAB 内置 factorial 支持向量）
sumFactorial_vec = sum(factorial(1:20));
disp(['1..20 的阶乘之和（向量化） = ', num2str(sumFactorial_vec)]);

% (2) 从键盘输入 4x5 矩阵，求最大/最小以及其所在位置
% 提示：输入时请以 MATLAB 矩阵格式输入，例如：
% [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20]
M = input('请输入一个 4x5 矩阵（例如 [1 2 3 4 5; 6 ...]）： ');

% 检查尺寸
if ~isequal(size(M), [4 5])
    error('输入矩阵尺寸不是 4x5，请重新运行并输入正确尺寸矩阵。');
end

% 最大值与位置
[maxVal, maxIdxLinear] = max(M(:));
[maxRow, maxCol] = ind2sub(size(M), maxIdxLinear);
disp(['最大值 = ', num2str(maxVal), '，位置 (row,col) = (', num2str(maxRow), ',', num2str(maxCol), ')']);

% 最小值与位置
[minVal, minIdxLinear] = min(M(:));
[minRow, minCol] = ind2sub(size(M), minIdxLinear);
disp(['最小值 = ', num2str(minVal), '，位置 (row,col) = (', num2str(minRow), ',', num2str(minCol), ')']);

% (3) 球从 100m 高度自由下落，每次落地后反弹回原高度的一半
% 求在第 10 次落地时，共经过多少 m？
H0 = 100;   % 初始高度
n = 10;     % 第 n 次落地
% 路程计算公式：D(n) = H0 + 2 * sum_{i=1}^{n-1} H0*(1/2)^i
% 解释：第一次落地走 H0；之后每次弹起再落下构成上下两段，共 2*H_i
Dn = H0 + 2 * H0 * sum((1/2).^(1:(n-1)));
disp(['第 ', num2str(n), ' 次落地时，总路程 = ', num2str(Dn), ' m']);

% 也可直接用闭式求和： sum_{i=1}^{n-1} (1/2)^i = 1 - (1/2)^(n-1)  （除以 1 - 1/2）
% 验证：
Dn_closed = H0 + 2*H0 * ( (1/2) * (1 - (1/2)^(n-1)) / (1 - 1/2) ); % 等价形式
% 简化后为： H0 + 2*H0*(1 - (1/2)^(n-1))
% 但是上式注意推导，二者数值应一致
disp(['（闭式）第 ', num2str(n), ' 次落地时，总路程 = ', num2str(Dn_closed), ' m']);


%% ========================
%% 3. MATLAB 绘图命令（函数绘制、隐函数、摆线、曲面、极坐标）
%% ========================

% 3.1 用 plot 和 fplot 绘制 y = cos(tan(pi * x)) 的图形
figure('Name','y = cos(tan(pi*x)) - plot & fplot','NumberTitle','off');
subplot(2,1,1);
% 使用显式采样并 plot（注意 tan(pi*x) 在 x = (k+1/2) 时有间断，图形可能非常振荡）
x = linspace(-1.4,1.4,2000);   % 注意范围避免太多奇点；可视化选取 -1.4..1.4
y = cos(tan(pi.*x));
plot(x,y);
title('y = cos(tan(pi*x)) using plot');
xlabel('x'); ylabel('y');
grid on;

subplot(2,1,2);
% 使用 fplot（自动处理）
fplot(@(xx) cos(tan(pi.*xx)), [-1.4 1.4]);
title('y = cos(tan(pi*x)) using fplot');
xlabel('x'); ylabel('y');
grid on;


% 3.2 用 ezplot 绘制隐函数 exp(x*y) - sin(x+y) = 0 在 [-3,3] 区间上的图形
figure('Name','隐函数 exp(x*y)-sin(x+y)=0','NumberTitle','off');
% ezplot(字符串, [xmin xmax ymin ymax])
ezplot('exp(x*y)-sin(x+y)', [-3 3 -3 3]);
title('exp(x*y) - sin(x+y) = 0');
xlabel('x'); ylabel('y');
grid on;

% 3.3 绘制摆线（cycloid）： x = a(t - sin t), y = a(1 - cos t), t ∈ [0, 2*pi]
a = 1;   % 你可以修改 a 的值
t = linspace(0, 2*pi, 1000);
x_cycloid = a*(t - sin(t));
y_cycloid = a*(1 - cos(t));
figure('Name','摆线 cycloid','NumberTitle','off');
plot(x_cycloid, y_cycloid, 'LineWidth', 1.2);
axis equal;
title(sprintf('摆线 (a=%.2f)', a));
xlabel('x'); ylabel('y');
grid on;

% 3.4 用 surf 和 mesh 绘制曲面 z = 2*x^2 + y^2
[xg, yg] = meshgrid(linspace(-3,3,80), linspace(-3,3,80));
zg = 2.*xg.^2 + yg.^2;
figure('Name','曲面 z = 2*x^2 + y^2','NumberTitle','off');
subplot(1,2,1);
surf(xg, yg, zg);
title('surf: z = 2*x^2 + y^2');
xlabel('x'); ylabel('y'); zlabel('z'); shading interp; % 着色平滑
subplot(1,2,2);
mesh(xg, yg, zg);
title('mesh: z = 2*x^2 + y^2');
xlabel('x'); ylabel('y'); zlabel('z');

% 3.5 用 polar 绘制阿基米德螺线 r = a*theta 和三叶玫瑰 r = a*cos(3*theta)
a = 1;   % 参数 a
theta = linspace(0, 8*pi, 1000);   % 螺线通常画到多个圈，这里取 0..8*pi
r_archimedean = a .* theta;
figure('Name','极坐标：阿基米德螺线 & 三叶玫瑰','NumberTitle','off');
subplot(2,1,1);
% 如果你的 MATLAB 推荐使用 polarplot，请使用 polarplot。这里兼容两者。
if exist('polarplot','file') == 2
    polarplot(theta, r_archimedean);
else
    polar(theta, r_archimedean);
end
title('阿基米德螺线 r = a * theta');

% 三叶玫瑰 r = a * cos(3*theta)
theta2 = linspace(0, 2*pi, 1000);
r_rose = a .* cos(3 .* theta2);
subplot(2,1,2);
if exist('polarplot','file') == 2
    polarplot(theta2, r_rose);
else
    polar(theta2, r_rose);
end
title('三叶玫瑰 r = a*cos(3*theta)');

