a = 1;   
theta = linspace(0, 8*pi, 1000);
r_archimedean = a .* theta;
subplot(2,1,1);
polar(theta, r_archimedean);
title('阿基米德螺线 r = a * theta');