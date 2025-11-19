clc;
clear;

[x_min, fval] = fminbnd(@fun7, -5, 5);
fplot(@fun7,'LineWidth',1);
hold on;
xlabel('x轴','FontSize',14);
ylabel('y轴','FontSize',14);
plot(x_min,fval,'o','LineWidth',2);