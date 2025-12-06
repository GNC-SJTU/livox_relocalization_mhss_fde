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
%  human2----------------------------------
human2Full = load("data\human2\Full\Result.mat");
human2No1 = load("data\human2\No1\Result.mat");
human2No2 = load("data\human2\No2\Result.mat");
human2No3 = load("data\human2\No3\Result.mat");
human2No4 = load("data\human2\No4\Result.mat");
human2No5 = load("data\human2\No5\Result.mat");
human2No6 = load("data\human2\No6\Result.mat");
%  human3-----------------------------------
human3Full = load("data\human3\Full\Result.mat");
human3No1 = load("data\human3\No1\Result.mat");
human3No2 = load("data\human3\No2\Result.mat");
human3No3 = load("data\human3\No3\Result.mat");
human3No4 = load("data\human3\No4\Result.mat");
human3No5 = load("data\human3\No5\Result.mat");
human3No6 = load("data\human3\No6\Result.mat");
%  human4-----------------------------------
human4Full = load("data\human4\Full\Result.mat");
human4No1 = load("data\human4\No1\Result.mat");
human4No2 = load("data\human4\No2\Result.mat");
human4No3 = load("data\human4\No3\Result.mat");
human4No4 = load("data\human4\No4\Result.mat");
human4No5 = load("data\human4\No5\Result.mat");
human4No6 = load("data\human4\No6\Result.mat");
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

%  human2----------------------------------------------
% r2：实验次数
% human2: 检验统计量
%       r2: 实验次数
%       3：x,y,z
%       6: 6个故障模式
% human2_error: 检验统计量
%       r2: 实验次数
%       6: 6个故障模式
%       3：x,y,z
[r2,~] = size(human2Full.ERROR_MATRIX);
human2 = zeros(r2,3,6);
human2_error = zeros(6,3,r2);
human2(:,:,1) = human2No1.ERROR_MATRIX-human2Full.ERROR_MATRIX;
human2(:,:,2) = human2No2.ERROR_MATRIX-human2Full.ERROR_MATRIX;
human2(:,:,3) = human2No3.ERROR_MATRIX-human2Full.ERROR_MATRIX;
human2(:,:,4) = human2No4.ERROR_MATRIX-human2Full.ERROR_MATRIX;
human2(:,:,5) = human2No5.ERROR_MATRIX-human2Full.ERROR_MATRIX;
human2(:,:,6) = human2No6.ERROR_MATRIX-human2Full.ERROR_MATRIX;
for i = 1:r2
    human2_test = [];
    for j = 1 : 6
        human2_test = [human2_test ; human2(i,:,j)];
    end
    human2_error(:,:,i) = human2_test;
end

%  human3----------------------------------------------
% r3：实验次数
% human3: 检验统计量
%       r3: 实验次数
%       3：x,y,z
%       6: 6个故障模式
% human3_error: 检验统计量
%       r3: 实验次数
%       6: 6个故障模式
%       3：x,y,z
[r3,~] = size(human3Full.ERROR_MATRIX);
human3 = zeros(r3,3,6);
human3_error = zeros(6,3,r3);
human3(:,:,1) = human3No1.ERROR_MATRIX-human3Full.ERROR_MATRIX;
human3(:,:,2) = human3No2.ERROR_MATRIX-human3Full.ERROR_MATRIX;
human3(:,:,3) = human3No3.ERROR_MATRIX-human3Full.ERROR_MATRIX;
human3(:,:,4) = human3No4.ERROR_MATRIX-human3Full.ERROR_MATRIX;
human3(:,:,5) = human3No5.ERROR_MATRIX-human3Full.ERROR_MATRIX;
human3(:,:,6) = human3No6.ERROR_MATRIX-human3Full.ERROR_MATRIX;
for i = 1:r3
    human3_test = [];
    for j = 1 : 6
        human3_test = [human3_test ; human3(i,:,j)];
    end
    human3_error(:,:,i) = human3_test;
end

%  human4----------------------------------------------
% r4：实验次数
% human4: 检验统计量
%       r4: 实验次数
%       3：x,y,z
%       6: 6个故障模式
% human4_error: 检验统计量
%       r4: 实验次数
%       6: 6个故障模式
%       3：x,y,z
[r4,~] = size(human4Full.ERROR_MATRIX);
human4 = zeros(r4,3,6);
human4_error = zeros(6,3,r4);
human4(:,:,1) = human4No1.ERROR_MATRIX-human4Full.ERROR_MATRIX;
human4(:,:,2) = human4No2.ERROR_MATRIX-human4Full.ERROR_MATRIX;
human4(:,:,3) = human4No3.ERROR_MATRIX-human4Full.ERROR_MATRIX;
human4(:,:,4) = human4No4.ERROR_MATRIX-human4Full.ERROR_MATRIX;
human4(:,:,5) = human4No5.ERROR_MATRIX-human4Full.ERROR_MATRIX;
human4(:,:,6) = human4No6.ERROR_MATRIX-human4Full.ERROR_MATRIX;
for i = 1:r4
    human4_test = [];
    for j = 1 : 6
        human4_test = [human4_test ; human4(i,:,j)];
    end
    human4_error(:,:,i) = human4_test;
end

%% plot
% 1
figure
t = tiledlayout('vertical','TileSpacing','loose');
nexttile;
title(t,'Normalized Test Statistic under Fault Mode 1','FontName','Aria','FontSize',16,'FontWeight','bold')
for i = 1:6
    bar(r2*(i-1)+1:r2*i,abs(human2(:,1,i))/5/std_error(i,1));
    % 在每组数据的中间下方添加标签
    x_pos = r2*(i-1) + r2/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

nexttile;
for i = 1:6
    bar(r2*(i-1)+1:r2*i,abs(human2(:,2,i))/5/std_error(i,2));
    % 在每组数据的中间下方添加标签
    x_pos = r2*(i-1) + r2/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{2}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:6
    bar((r2)*(i-1)+1:(r2)*i,[abs(human2(:,3,i))]/5/std_error(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = r2*(i-1) + r2/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{3}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontSize',10,'FontWeight','bold');
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

lgd.Layout.Tile = 'east';

%xlabel(t,'实验')

%% 2
figure
t = tiledlayout('vertical','TileSpacing','loose');

nexttile;
for i = 1:6
    bar((r3)*(i-1)+1:(r3)*i,abs([human3(:,1,i)])/5/std_error(i,1))
    % 在每组数据的中间下方添加标签
    x_pos = r3*(i-1) + r3/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment',  'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])


nexttile;
for i = 1:6
    bar((r3)*(i-1)+1:(r3)*i,abs([human3(:,2,i)])/5/std_error(i,2))
    % 在每组数据的中间下方添加标签
    x_pos = r3*(i-1) + r3/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{2}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment','top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])


% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:6
    bar((r3)*(i-1)+1:(r3)*i,abs([human3(:,3,i)])/5/std_error(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = r3*(i-1) + r3/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{3}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment',  'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'XTickLabels','');
set(gca,'xtick',[])

lgd.Layout.Tile = 'east';
title(t,'Normalized Test Statistic under Fault Mode 2','FontName','Aria','FontSize',16,'FontWeight','bold')
%xlabel(t,'实验')
%% 3
figure
t = tiledlayout('vertical','TileSpacing','loose');

nexttile;
for i = 1:6
    bar((r4)*(i-1)+1:(r4)*i,abs([human4(:,1,i)])/5/std_error(i,1))
    % 在每组数据的中间下方添加标签
    x_pos = r4*(i-1) + r4/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{1}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('x direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

nexttile;
for i = 1:6
    bar((r4)*(i-1)+1:(r4)*i,abs([human4(:,2,i)])/5/std_error(i,2))
    % 在每组数据的中间下方添加标签
    x_pos = r4*(i-1) + r4/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{2}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('y direction','FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

% lgd = legend('1','2','3','4','5','6','');
% lgd.Title.String = '抛除的点云号';
% lgd.Layout.Tile = 4;

nexttile;
for i = 1:6
    bar((r4)*(i-1)+1:(r4)*i,abs([human4(:,3,i)])/5/std_error(i,3))
    % 在每组数据的中间下方添加标签
    x_pos = r4*(i-1) + r4/2; % 计算每组数据中间的x坐标位置
    y_pos = 0; % 设置y坐标为0或更小的值，以便标签显示在柱状图下方
    text(x_pos, y_pos, ['\Delta_{3}^{(', num2str(i), ')}'], 'HorizontalAlignment', 'center', 'VerticalAlignment',  'top','FontWeight','bold','FontSize',10);
    hold on
end
yline(1,'--black','LineWidth',1.5)
ylabel('z direction' ,'FontName','Aria','FontSize',10,'FontWeight','bold')
set(gca,'xtick',[])

lgd.Layout.Tile = 'east';
title(t,'Normalized Test Statistic under Fault Mode 3','FontName','Aria','FontSize',16,'FontWeight','bold')
%xlabel(t,'实验')