a = 1;
ezplot(@(t) a*(t - sin(t)), @(t) a*(1 - cos(t)), [0, 2*pi]);
