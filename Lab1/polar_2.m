theta2 = linspace(0, 2*pi, 1000);
r_rose = a .* cos(3 .* theta2);
subplot(2,1,2);
polar(theta2, r_rose);
title('三叶玫瑰 r = a*cos(3*theta)');