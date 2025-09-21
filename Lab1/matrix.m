% [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20]
M = input('Input a matrix:');

% 检查
if ~isequal(size(M), [4 5])
    error('ERROR');
end

disp('Matrix:');
disp(M);

% 最大值与位置
[maxVal, maxIdxLinear] = max(M(:));
[maxRow, maxCol] = ind2sub(size(M), maxIdxLinear);
disp(['Max = ', num2str(maxVal), '，Position (row,col) = (', num2str(maxRow), ',', num2str(maxCol), ')']);

% 最小值与位置
[minVal, minIdxLinear] = min(M(:));
[minRow, minCol] = ind2sub(size(M), minIdxLinear);
disp(['Min = ', num2str(minVal), '，Position (row,col) = (', num2str(minRow), ',', num2str(minCol), ')']);