H0 = 100;   % 初始高度
n = 10;     % 第 n 次落地

Dn = H0 + 2 * H0 * sum((1/2).^(1:(n-1)));
disp(['Distance = ', num2str(Dn), ' m']);