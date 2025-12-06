clear
close all
clc
%% Load data
%  noFault-----------------------------------------
Full = load("data\noFault\Full\Result.mat");
No1 = load("data\noFault\No1\Result.mat");
No2 = load("data\noFault\No2\Result.mat");
No3 = load("data\noFault\No3\Result.mat");
No4 = load("data\noFault\No4\Result.mat");
No5 = load("data\noFault\No5\Result.mat");
No6 = load("data\noFault\No6\Result.mat");

%  human20No0----------------------------------------
human20No0Full = load("data_fe\human20\no0\resultNo0.txt");
human20No0No10 = load("data_fe\human20\no0\resultNo0-10.txt");
human20No0No20 = load("data_fe\human20\no0\resultNo0-20.txt");
human20No0No30 = load("data_fe\human20\no0\resultNo0-30.txt");
human20No0No40 = load("data_fe\human20\no0\resultNo0-40.txt");
human20No0No50 = load("data_fe\human20\no0\resultNo0-50.txt");

%  human20No10----------------------------------------
human20No10Full = load("data_fe\human20\no10\resultNo10.txt");
human20No10No0 = load("data_fe\human20\no10\resultNo10-0.txt");
human20No10No20 = load("data_fe\human20\no10\resultNo10-20.txt");
human20No10No30 = load("data_fe\human20\no10\resultNo10-30.txt");
human20No10No40 = load("data_fe\human20\no10\resultNo10-40.txt");
human20No10No50 = load("data_fe\human20\no10\resultNo10-50.txt");

%  human20No20----------------------------------------
human20No20Full = load("data_fe\human20\no20\resultNo20.txt");
human20No20No0 = load("data_fe\human20\no20\resultNo20-0.txt");
human20No20No10 = load("data_fe\human20\no20\resultNo20-10.txt");
human20No20No30 = load("data_fe\human20\no20\resultNo20-30.txt");
human20No20No40 = load("data_fe\human20\no20\resultNo20-40.txt");
human20No20No50 = load("data_fe\human20\no20\resultNo20-50.txt");

%  human20No30----------------------------------------
human20No30Full = load("data_fe\human20\no30\resultNo30.txt");
human20No30No0 = load("data_fe\human20\no30\resultNo30-0.txt");
human20No30No10 = load("data_fe\human20\no30\resultNo30-10.txt");
human20No30No20 = load("data_fe\human20\no30\resultNo30-20.txt");
human20No30No40 = load("data_fe\human20\no30\resultNo30-40.txt");
human20No30No50 = load("data_fe\human20\no30\resultNo30-50.txt");

%  human20No40----------------------------------------
human20No40Full = load("data_fe\human20\no40\resultNo40.txt");
human20No40No0 = load("data_fe\human20\no40\resultNo40-0.txt");
human20No40No10 = load("data_fe\human20\no40\resultNo40-10.txt");
human20No40No20 = load("data_fe\human20\no40\resultNo40-20.txt");
human20No40No30 = load("data_fe\human20\no40\resultNo40-30.txt");
human20No40No50 = load("data_fe\human20\no40\resultNo40-50.txt");

%  human20No50----------------------------------------
human20No50Full = load("data_fe\human20\no50\resultNo50.txt");
human20No50No0 = load("data_fe\human20\no50\resultNo50-0.txt");
human20No50No10 = load("data_fe\human20\no50\resultNo50-10.txt");
human20No50No20 = load("data_fe\human20\no50\resultNo50-20.txt");
human20No50No30 = load("data_fe\human20\no50\resultNo50-30.txt");
human20No50No40 = load("data_fe\human20\no50\resultNo50-40.txt");
%% Process data-----------------------------------------
%  nofault----------------------------------------------
% r0：实验次数
% error: 检验统计量
%       r0: 实验次数
%       3：x,y,z
%       6: 6个故障模式
% error_xyz: 检验统计量
%       r0: 实验次数
%       6: 6个故障模式
%       3：x,y,z
[r0,~] = size(Full.ERROR_MATRIX);  
error = zeros(r0,3,6);             
error_xyz = zeros(r0,6,3);
std_error = zeros(6,3);
mean_error = zeros(6,3);
min_error = zeros(6,3);
max_error = zeros(6,3);
error(:,:,1) = No1.ERROR_MATRIX-Full.ERROR_MATRIX;
error(:,:,2) = No2.ERROR_MATRIX-Full.ERROR_MATRIX;
error(:,:,3) = No3.ERROR_MATRIX-Full.ERROR_MATRIX;
error(:,:,4) = No4.ERROR_MATRIX-Full.ERROR_MATRIX;
error(:,:,5) = No5.ERROR_MATRIX-Full.ERROR_MATRIX;
error(:,:,6) = No6.ERROR_MATRIX-Full.ERROR_MATRIX;
for i = 1:3
    for j = 1 : 6
        error_xyz(:,j,i) = error(:,i,j);
    end
    std_error(1,i) = std(error_xyz(:,1,i));
    std_error(2,i) = std(error_xyz(:,2,i));
    std_error(3,i) = std(error_xyz(:,3,i));
    std_error(4,i) = std(error_xyz(:,4,i));
    std_error(5,i) = std(error_xyz(:,5,i));
    std_error(6,i) = std(error_xyz(:,6,i));
    mean_error(1,i) = mean(error_xyz(:,1,i));
    mean_error(2,i) = mean(error_xyz(:,2,i));
    mean_error(3,i) = mean(error_xyz(:,3,i));
    mean_error(4,i) = mean(error_xyz(:,4,i));
    mean_error(5,i) = mean(error_xyz(:,5,i));
    mean_error(6,i) = mean(error_xyz(:,6,i));
    min_error(1,i) = min(error_xyz(:,1,i));
    min_error(2,i) = min(error_xyz(:,2,i));
    min_error(3,i) = min(error_xyz(:,3,i));
    min_error(4,i) = min(error_xyz(:,4,i));
    min_error(5,i) = min(error_xyz(:,5,i));
    min_error(6,i) = min(error_xyz(:,6,i));
    max_error(1,i) = max(error_xyz(:,1,i));
    max_error(2,i) = max(error_xyz(:,2,i));
    max_error(3,i) = max(error_xyz(:,3,i));
    max_error(4,i) = max(error_xyz(:,4,i));
    max_error(5,i) = max(error_xyz(:,5,i));
    max_error(6,i) = max(error_xyz(:,6,i));
end

%% FE-human20No0
[rNo0,~] = size(human20No0Full);  
human20No0 = zeros(rNo0,3,5);
std_errorNo0 = zeros(5,3);
human20No0(:,:,1) = human20No0No10(:,4:6)-human20No0Full(:,4:6);
human20No0(:,:,2) = human20No0No20(:,4:6)-human20No0Full(:,4:6);
human20No0(:,:,3) = human20No0No30(:,4:6)-human20No0Full(:,4:6);
human20No0(:,:,4) = human20No0No40(:,4:6)-human20No0Full(:,4:6);
human20No0(:,:,5) = human20No0No50(:,4:6)-human20No0Full(:,4:6);
std_errorNo0(1,:) = std_error(2,:);
std_errorNo0(2,:) = std_error(3,:);
std_errorNo0(3,:) = std_error(4,:);
std_errorNo0(4,:) = std_error(5,:);
std_errorNo0(5,:) = std_error(6,:);

% human20No0
figure
t = tiledlayout('vertical','TileSpacing','loose');

nexttile;
title(t,'Normalized Test Statistics without ① (Fault Mode: 2)','FontName','Aria','FontSize',16,'FontWeight','bold')
for i = 1:5
    bar(rNo0*(i-1)+1:rNo0*i,abs(human20No0(:,1,i))/4/std_errorNo0(i,1));
    % 在每组数据的中间下方添加标签
    x_pos = rNo0*(i-1) + rNo0/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(1), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

nexttile;
for i = 1:5
    bar(rNo0*(i-1)+1:rNo0*i,abs(human20No0(:,2,i))/4/std_errorNo0(i,2));
    % 在每组数据的中间下方添加标签
    x_pos = rNo0*(i-1) + rNo0/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{2}^{(', num2str(i+1), ',', num2str(1), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:5
    bar((rNo0)*(i-1)+1:(rNo0)*i,abs(human20No0(:,3,i))/4/std_errorNo0(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = rNo0*(i-1) + rNo0/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{3}^{(', num2str(i+1), ',', num2str(1), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontSize',10,'FontWeight','bold');
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])
lgd.Layout.Tile = 'east';

%% FE-human20No10
[rNo10,~] = size(human20No10Full);  
human20No10 = zeros(rNo10,3,5);
std_errorNo10 = zeros(5,3);
human20No10(:,:,1) = human20No10No0(:,4:6)-human20No10Full(:,4:6);
human20No10(:,:,2) = human20No10No20(:,4:6)-human20No10Full(:,4:6);
human20No10(:,:,3) = human20No10No30(:,4:6)-human20No10Full(:,4:6);
human20No10(:,:,4) = human20No10No40(:,4:6)-human20No10Full(:,4:6);
human20No10(:,:,5) = human20No10No50(:,4:6)-human20No10Full(:,4:6);
std_errorNo10(1,:) = std_error(1,:);
std_errorNo10(2,:) = std_error(3,:);
std_errorNo10(3,:) = std_error(4,:);
std_errorNo10(4,:) = std_error(5,:);
std_errorNo10(5,:) = std_error(6,:);

% human20No10
figure
t = tiledlayout('vertical','TileSpacing','loose');
nexttile;
title(t,'Normalized Test Statistics without ② (Fault Mode: 2)','FontName','Aria','FontSize',16,'FontWeight','bold')
for i = 1:5
    bar(rNo10*(i-1)+1:rNo10*i,abs(human20No10(:,1,i))/4/std_errorNo10(i,1));
    % 在每组数据的中间下方添加标签
    x_pos = rNo10*(i-1) + rNo10/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i == 1
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(1), ',', num2str(2), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(2), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

nexttile;
for i = 1:5
    bar(rNo10*(i-1)+1:rNo10*i,abs(human20No10(:,2,i))/4/std_errorNo10(i,2));
    % 在每组数据的中间下方添加标签
    x_pos = rNo10*(i-1) + rNo10/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i == 1
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(1), ',', num2str(2), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(2), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:5
    bar((rNo10)*(i-1)+1:(rNo10)*i,abs(human20No10(:,3,i))/4/std_errorNo10(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = rNo10*(i-1) + rNo10/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i == 1
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(1), ',', num2str(2), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(2), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])
lgd.Layout.Tile = 'east';

%% FE-human20No20
[rNo20,~] = size(human20No20Full);  
human20No20 = zeros(rNo20,3,5);
std_errorNo20 = zeros(5,3);
human20No20(:,:,1) = human20No20No0(:,4:6)-human20No20Full(:,4:6);
human20No20(:,:,2) = human20No20No10(:,4:6)-human20No20Full(:,4:6);
human20No20(:,:,3) = human20No20No30(:,4:6)-human20No20Full(:,4:6);
human20No20(:,:,4) = human20No20No40(:,4:6)-human20No20Full(:,4:6);
human20No20(:,:,5) = human20No20No50(:,4:6)-human20No20Full(:,4:6);
std_errorNo20(1,:) = std_error(1,:);
std_errorNo20(2,:) = std_error(2,:);
std_errorNo20(3,:) = std_error(4,:);
std_errorNo20(4,:) = std_error(5,:);
std_errorNo20(5,:) = std_error(6,:);

% human20No20
figure
t = tiledlayout('vertical','TileSpacing','loose');
nexttile;
title(t,'Normalized Test Statistics without ③ (Fault Mode: 2)','FontName','Aria','FontSize',16,'FontWeight','bold')
for i = 1:5
    bar(rNo20*(i-1)+1:rNo20*i,abs(human20No20(:,1,i))/4/std_errorNo20(i,1));
    % 在每组数据的中间下方添加标签
    x_pos = rNo20*(i-1) + rNo20/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 2
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(3), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(3), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

nexttile;
for i = 1:5
    bar(rNo20*(i-1)+1:rNo20*i,abs(human20No20(:,2,i))/4/std_errorNo20(i,2));
    % 在每组数据的中间下方添加标签
    x_pos = rNo20*(i-1) + rNo20/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 2
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(3), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(3), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:5
    bar((rNo20)*(i-1)+1:(rNo20)*i,abs(human20No20(:,3,i))/4/std_errorNo20(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = rNo20*(i-1) + rNo20/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 2
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(3), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(3), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])
lgd.Layout.Tile = 'east';

%% FE-human20No30
[rNo30,~] = size(human20No30Full);  
human20No30 = zeros(rNo30,3,5);
std_errorNo30 = zeros(5,3);
human20No30(:,:,1) = human20No30No0(:,4:6)-human20No30Full(:,4:6);
human20No30(:,:,2) = human20No30No10(:,4:6)-human20No30Full(:,4:6);
human20No30(:,:,3) = human20No30No20(:,4:6)-human20No30Full(:,4:6);
human20No30(:,:,4) = human20No30No40(:,4:6)-human20No30Full(:,4:6);
human20No30(:,:,5) = human20No30No50(:,4:6)-human20No30Full(:,4:6);
std_errorNo30(1,:) = std_error(1,:);
std_errorNo30(2,:) = std_error(2,:);
std_errorNo30(3,:) = std_error(3,:);
std_errorNo30(4,:) = std_error(5,:);
std_errorNo30(5,:) = std_error(6,:);

% human20No30
figure
t = tiledlayout('vertical','TileSpacing','loose');
nexttile;
title(t,'Normalized Test Statistics without ④ (Fault Mode: 2)','FontName','Aria','FontSize',16,'FontWeight','bold')
for i = 1:5
    bar(rNo30*(i-1)+1:rNo30*i,abs(human20No30(:,1,i))/4/std_errorNo30(i,1));
    % 在每组数据的中间下方添加标签
    x_pos = rNo30*(i-1) + rNo30/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 3
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(4), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(4), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

nexttile;
for i = 1:5
    bar(rNo30*(i-1)+1:rNo30*i,abs(human20No30(:,2,i))/4/std_errorNo30(i,2));
    % 在每组数据的中间下方添加标签
    x_pos = rNo30*(i-1) + rNo30/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 3
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(4), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(4), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:5
    bar((rNo30)*(i-1)+1:(rNo30)*i,abs(human20No30(:,3,i))/4/std_errorNo30(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = rNo30*(i-1) + rNo30/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 3
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(4), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(4), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])
lgd.Layout.Tile = 'east';

%% FE-human20No40
[rNo40,~] = size(human20No40Full);  
human20No40 = zeros(rNo40,3,5);
std_errorNo40 = zeros(5,3);
human20No40(:,:,1) = human20No40No0(:,4:6)-human20No40Full(:,4:6);
human20No40(:,:,2) = human20No40No10(:,4:6)-human20No40Full(:,4:6);
human20No40(:,:,3) = human20No40No20(:,4:6)-human20No40Full(:,4:6);
human20No40(:,:,4) = human20No40No30(:,4:6)-human20No40Full(:,4:6);
human20No40(:,:,5) = human20No40No50(:,4:6)-human20No40Full(:,4:6);
std_errorNo40(1,:) = std_error(1,:);
std_errorNo40(2,:) = std_error(2,:);
std_errorNo40(3,:) = std_error(3,:);
std_errorNo40(4,:) = std_error(4,:);
std_errorNo40(5,:) = std_error(6,:);

% human20No40
figure
t = tiledlayout('vertical','TileSpacing','loose');
nexttile;
title(t,'Normalized Test Statistics without ⑤ (Fault Mode: 2)','FontName','Aria','FontSize',16,'FontWeight','bold')
for i = 1:5 
    bar(rNo40*(i-1)+1:rNo40*i,abs(human20No40(:,1,i))/4/std_errorNo40(i,1));
    % 在每组数据的中间下方添加标签
    x_pos = rNo40*(i-1) + rNo40/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 4
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(5), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(5), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

nexttile;
for i = 1:5
    bar(rNo40*(i-1)+1:rNo40*i,abs(human20No40(:,2,i))/4/std_errorNo40(i,2));
    % 在每组数据的中间下方添加标签
    x_pos = rNo40*(i-1) + rNo40/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 4
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(5), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(5), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:5
    bar((rNo40)*(i-1)+1:(rNo40)*i,abs(human20No40(:,3,i))/4/std_errorNo40(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = rNo40*(i-1) + rNo40/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    if i <= 4
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(5), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    else
        text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i+1), ',', num2str(5), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    end
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])
lgd.Layout.Tile = 'east';

%% FE-human20No50
[rNo50,~] = size(human20No50Full);  
human20No50 = zeros(rNo50,3,5);
std_errorNo50 = zeros(5,3);
human20No50(:,:,1) = human20No50No0(:,4:6)-human20No50Full(:,4:6);
human20No50(:,:,2) = human20No50No10(:,4:6)-human20No50Full(:,4:6);
human20No50(:,:,3) = human20No50No20(:,4:6)-human20No50Full(:,4:6);
human20No50(:,:,4) = human20No50No30(:,4:6)-human20No50Full(:,4:6);
human20No50(:,:,5) = human20No50No40(:,4:6)-human20No50Full(:,4:6);
std_errorNo50(1,:) = std_error(1,:);
std_errorNo50(2,:) = std_error(2,:);
std_errorNo50(3,:) = std_error(3,:);
std_errorNo50(4,:) = std_error(4,:);
std_errorNo50(5,:) = std_error(5,:);

% human20No50
figure
t = tiledlayout('vertical','TileSpacing','loose');
nexttile;
title(t,'Normalized Test Statistics without ⑥ (Fault Mode: 2)','FontName','Aria','FontSize',16,'FontWeight','bold')
for i = 1:5
    bar(rNo50*(i-1)+1:rNo50*i,abs(human20No50(:,1,i))/4/std_errorNo50(i,1));
    % 在每组数据的中间下方添加标签
    x_pos = rNo50*(i-1) + rNo50/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ',', num2str(6), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

nexttile;
for i = 1:5
    bar(rNo50*(i-1)+1:rNo50*i,abs(human20No50(:,2,i))/4/std_errorNo50(i,2));
    % 在每组数据的中间下方添加标签
    x_pos = rNo50*(i-1) + rNo50/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{2}^{(', num2str(i), ',', num2str(6), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:5
    bar((rNo50)*(i-1)+1:(rNo50)*i,abs(human20No50(:,3,i))/4/std_errorNo50(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = rNo50*(i-1) + rNo50/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{3}^{(', num2str(i), ',', num2str(6), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontSize',10,'FontWeight','bold');
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])
lgd.Layout.Tile = 'east';
