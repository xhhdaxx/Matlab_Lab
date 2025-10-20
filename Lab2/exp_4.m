%% 2.2 男子举重比赛总冠军
clc; clear; close all;

% 数据
w = [56 62 69 77 85 94 105];        % 体重级别
y = [305 327 358 380 394 418 436];  % 世界纪录

% 线性处理
ln_w = log(w);
ln_y = log(y);

% 线性拟合 ln(y) = ln(a) + b*ln(w)
p = polyfit(ln_w, ln_y, 1);
b = p(1);
a = exp(p(2));

% 结果
fprintf('拟合结果：a = %.4f, b = %.4f\n', a, b);

% 使用拟合模型预测
y_fit = a * w.^b;

% 教材模型
y_book = 20.4711 * w.^(2/3);

% 计算拟合误差
err_fit = sqrt(mean((y - y_fit).^2));
err_book = sqrt(mean((y - y_book).^2));

fprintf('幂函数模型(拟合)：RMSE = %.4f\n', err_fit);
fprintf('幂函数模型(书中)：RMSE = %.4f\n', err_book);

% 绘图
figure;
plot(w, y, 'ro-', 'LineWidth',1.8); hold on;
plot(w, y_fit, 'b*-','LineWidth',1.8);
plot(w, y_book, 'g--','LineWidth',1.8);
xlabel('体重级别 w (kg)');
ylabel('举重纪录 y (kg)');
legend('实际纪录','拟合模型','教材模型','Location','NorthWest');
title('男子举重世界纪录拟合比较');
grid on;

% 折合成绩
w_tokyo = [61 67 73 81 96 109];
y_tokyo = [313 332 364 374 402 430];

% 以73kg级为基线
y_ref = 364;
w_ref = 73;

% 折合成绩（相对73kg基线）
fold_score = (y_tokyo ./ w_tokyo.^b) / (y_ref / w_ref^b);

[sorted_score, idx] = sort(fold_score, 'descend');

fprintf('\n=== 2020东京奥运会男子举重折合成绩排名（以73kg为基线）===\n');
fprintf('名次\t级别(kg)\t成绩(kg)\t折合成绩\n');
for i = 1:length(idx)
    fprintf('%d\t%d\t%.1f\t%.4f\n', i, w_tokyo(idx(i)), y_tokyo(idx(i)), sorted_score(i)*y_ref);
end

% 可视化
figure;
bar(w_tokyo, fold_score);
xlabel('体重级别 w (kg)');
ylabel('相对折合成绩（基于73kg）');
title('2020东京奥运会男子举重折合成绩（73kg基线）');
grid on;