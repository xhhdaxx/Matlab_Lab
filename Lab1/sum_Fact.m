sumFactorial = 0;
for n = 1:20
    sumFactorial = sumFactorial + factorial(n);
end

disp(['sum_Fact = ', num2str(sumFactorial)]);