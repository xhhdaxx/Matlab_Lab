[xg, yg] = meshgrid(linspace(-3,3,80), linspace(-3,3,80));
zg = 2.*xg.^2 + yg.^2;
subplot(1,2,1);
surf(xg, yg, zg);
title('surf: z = 2*x^2 + y^2');
xlabel('x'); ylabel('y'); zlabel('z');
shading interp; % 着色平滑