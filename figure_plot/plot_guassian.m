function zplot = plot_guassian1(error,numofEdge)

% 生成直方图数据
edges = linspace(min(error), max(error), numofEdge); % 边界
% 双峰高斯模型
z_count = edges(1:end-1) + diff(edges)/2; % 计算每个区间的中点作为x值
z_pdf = histcounts(error,edges); % 生成直方图数据
z_pdf = z_pdf / sum(z_pdf); % 归一化频率数据，确保总和为1

% 双峰高斯模型拟合
[f, ~] = fit(z_count(:), z_pdf(:), 'gauss1'); % 'gauss2'代表双峰高斯模型

hold on;
% 绘制拟合曲线
z_x_fit = linspace(min(z_count), max(z_count), 300); % 生成更密集的x值以得到平滑的曲线
z_y_fit = feval(f, z_x_fit); % 计算拟合曲线的y值
zplot = plot(z_x_fit, z_y_fit, 'r', 'LineWidth', 2); % 绘制平滑的拟合曲线

end