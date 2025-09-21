x = linspace(-1.4,1.4,2000);   % 注意范围避免太多奇点；可视化选取 -1.4..1.4
y = cos(tan(pi.*x));
plot(x,y);
title('plot: y = cos(tan(pi*x))');
