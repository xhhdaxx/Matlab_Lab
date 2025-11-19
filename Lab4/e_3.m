syms a x y z
f = x^2-y^2+2*z^2-a^2;
zx = -diff(f, x)/diff(f, z)
zy = -diff(f, y)/diff(f, z)
