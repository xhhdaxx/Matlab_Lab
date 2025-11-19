clc;
clear;

syms x
y = x^3+6*x^2+8*x-1;
dy = diff(y);
xx = solve(dy); %求解方程（(𝒅𝒇(𝒙))/𝒅𝒙=𝟎）的符号解

f = xx.^3+6.*xx.^2+8.*xx-1;

fplot(y,'LineWidth',1); %默认在[-5,5]区间绘制函数图
xlabel('x');
ylabel('y');
hold on;

dxx2=cast(xx(2),'double'); %将xx(2)转换成双精度数
plot(dxx2,f(2),'*r','LineWidth', 2); %绘制极值点
