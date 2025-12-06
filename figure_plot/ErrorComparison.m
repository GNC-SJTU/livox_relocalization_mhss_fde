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

%% plot0-nofault error
% % Chinese
% figure
% t = tiledlayout(3,1,'TileSpacing','compact');
% 
% t1 = nexttile;
% bar(abs(Full.ERROR_MATRIX(1:100,1)),'FaceColor',[0.00,0.45,0.74],'LineWidth',1)
% xticklabels({})
% ylabel('x方向','FontName','微软雅黑')
% set(gca,'FontWeight','bold','LineWidth',1)
% 
% t2 = nexttile;
% bar(abs(Full.ERROR_MATRIX(1:100,2)),'FaceColor',[0.47,0.67,0.19],'LineWidth',1)
% xticklabels({})
% ylabel('y方向','FontName','微软雅黑')
% set(gca,'FontWeight','bold','LineWidth',1)
% 
% t3 = nexttile;
% bar(abs(Full.ERROR_MATRIX(1:100,3)),'FaceColor',[1.00,0.41,0.16],'LineWidth',1)
% ylabel('z方向','FontName','微软雅黑')
% set(gca,'FontWeight','bold','LineWidth',1)
% 
% title(t,'无故障时的定位误差(m)','FontName','微软雅黑','FontSize',12,'FontWeight','bold')
% xlabel(t3,'数据ID','FontName','微软雅黑')

% English
figure
t = tiledlayout(3,1,'TileSpacing','compact');

t1 = nexttile;
bar(abs(Full.ERROR_MATRIX(1:100,1)),'FaceColor',[0.00,0.45,0.74],'LineWidth',1)
xticklabels({})
ylabel('x direction','FontName','Aria')
set(gca,'FontWeight','bold','LineWidth',1)

t2 = nexttile;
bar(abs(Full.ERROR_MATRIX(1:100,2)),'FaceColor',[0.47,0.67,0.19],'LineWidth',1)
xticklabels({})
ylabel('y direction','FontName','Aria')
set(gca,'FontWeight','bold','LineWidth',1)

t3 = nexttile;
bar(abs(Full.ERROR_MATRIX(1:100,3)),'FaceColor',[1.00,0.41,0.16],'LineWidth',1)
ylabel('z direction','FontName','Aria')
set(gca,'FontWeight','bold','LineWidth',1)

title(t,'Position Error under Fault Free Mode(m)','FontName','Aria','FontSize',12,'FontWeight','bold')
xlabel(t3,'Data ID','FontName','Aria')

% %% plot1-nofault histogram(0mean)
% figure
% histogram(Full.ERROR_MATRIX(:,1)-mean(Full.ERROR_MATRIX(:,1)),'LineWidth',1)
% title('无故障时x方向定位误差直方图','FontName','微软雅黑','FontSize',16,'FontWeight','bold')
% ylabel('频数','FontName','微软雅黑','FontSize',14)
% xlabel('定位误差(m)','FontName','微软雅黑','FontSize',14)
% set(gca,'FontWeight','bold','LineWidth',1)
% xlim([-0.032 0.032])
% 
% figure
% histogram(Full.ERROR_MATRIX(:,2)-mean(Full.ERROR_MATRIX(:,2)),'LineWidth',1)
% title('无故障时y方向定位误差直方图','FontName','微软雅黑','FontSize',16,'FontWeight','bold')
% ylabel('频数','FontName','微软雅黑','FontSize',14)
% xlabel('定位误差(m)','FontName','微软雅黑','FontSize',14)
% set(gca,'FontWeight','bold','LineWidth',1)
% 
% 
% 
% figure
% histogram(Full.ERROR_MATRIX(:,3)-mean(Full.ERROR_MATRIX(:,3)),'LineWidth',1)
% ylabel('频数','FontName','微软雅黑')
% xlabel('定位误差(m)','FontName','微软雅黑')
% xlim([-0.12 0.12])
% set(gca,'LineWidth',1,'FontSize',12)
% title('无故障时z方向定位误差直方图','FontName','微软雅黑','FontWeight','bold','FontSize',14)

% figure
% creatFit(Full.ERROR_MATRIX(:,1))

% %% plot0-compare error(all tests)
% % Chinese 
% figure
% t = tiledlayout(3,1,'TileSpacing','tight');
% 
% nexttile
% bar(abs([Full.ERROR_MATRIX(1:100,1);human2Full.ERROR_MATRIX(:,1);human3Full.ERROR_MATRIX(:,1);human4Full.ERROR_MATRIX(:,1)]),'FaceColor',[0.00,0.45,0.74])
% xticks({})
% ylabel('x方向','FontName','微软雅黑')
% yl = ylim;
% xl = xlim;
% patch([100.5 100.5+r2 100.5+r2 100.5],[yl(1) yl(1) yl(2) yl(2)],[0.90,0.90,0.90],'FaceAlpha',0.3,'EdgeColor','none')
% patch([100.5+r2 100.5+r2+r3 100.5+r2+r3 100.5+r2],[yl(1) yl(1) yl(2) yl(2)],[0.65,0.65,0.65],'FaceAlpha',0.3,'EdgeColor','none')
% patch([100.5+r2+r3 xl(2) xl(2) 100.5+r2+r3],[yl(1) yl(1) yl(2) yl(2)],[0.15,0.15,0.15],'FaceAlpha',0.3,'EdgeColor','none')
% set(gca,'FontWeight','bold','LineWidth',1)
% 
% nexttile
% bar(abs([Full.ERROR_MATRIX(1:100,2);human2Full.ERROR_MATRIX(:,2);human3Full.ERROR_MATRIX(:,2);human4Full.ERROR_MATRIX(:,2)]),'FaceColor',[0.47,0.67,0.19])
% xticks({})
% ylabel('y方向','FontName','微软雅黑')
% yl = ylim;
% xl = xlim;
% patch([100.5 100.5+r2 100.5+r2 100.5],[yl(1) yl(1) yl(2) yl(2)],[0.90,0.90,0.90],'FaceAlpha',0.3,'EdgeColor','none')
% patch([100.5+r2 100.5+r2+r3 100.5+r2+r3 100.5+r2],[yl(1) yl(1) yl(2) yl(2)],[0.65,0.65,0.65],'FaceAlpha',0.3,'EdgeColor','none')
% patch([100.5+r2+r3 xl(2) xl(2) 100.5+r2+r3],[yl(1) yl(1) yl(2) yl(2)],[0.15,0.15,0.15],'FaceAlpha',0.3,'EdgeColor','none')
% set(gca,'FontWeight','bold','LineWidth',1)
% 
% nexttile
% bar(abs([Full.ERROR_MATRIX(1:100,3);human2Full.ERROR_MATRIX(:,3);human3Full.ERROR_MATRIX(:,3);human4Full.ERROR_MATRIX(:,3)]),'FaceColor',[1.00,0.41,0.16])
% ylabel('z方向','FontName','微软雅黑')
% yl = ylim;
% xl = xlim;
% patch([100.5 100.5+r2 100.5+r2 100.5],[yl(1) yl(1) yl(2) yl(2)],[0.90,0.90,0.90],'FaceAlpha',0.3,'EdgeColor','none')
% patch([100.5+r2 100.5+r2+r3 100.5+r2+r3 100.5+r2],[yl(1) yl(1) yl(2) yl(2)],[0.65,0.65,0.65],'FaceAlpha',0.3,'EdgeColor','none')
% patch([100.5+r2+r3 xl(2) xl(2) 100.5+r2+r3],[yl(1) yl(1) yl(2) yl(2)],[0.15,0.15,0.15],'FaceAlpha',0.3,'EdgeColor','none')
% set(gca,'FontWeight','bold','LineWidth',1)
% 
% title(t,'定位误差对比(m)','FontName','微软雅黑','FontSize',12,'FontWeight','bold')
% xlabel('数据ID','FontName','微软雅黑')

% English
figure
t = tiledlayout(3,1,'TileSpacing','tight');

nexttile
bar(abs([Full.ERROR_MATRIX(1:100,1);human2Full.ERROR_MATRIX(:,1);human3Full.ERROR_MATRIX(:,1);human4Full.ERROR_MATRIX(:,1)]),'FaceColor',[0.00,0.45,0.74])
xticks({})
ylabel('x direction','FontName','Aria')
yl = ylim;
xl = xlim;
patch([100.5 100.5+r2 100.5+r2 100.5],[yl(1) yl(1) yl(2) yl(2)],[0.90,0.90,0.90],'FaceAlpha',0.3,'EdgeColor','none')
patch([100.5+r2 100.5+r2+r3 100.5+r2+r3 100.5+r2],[yl(1) yl(1) yl(2) yl(2)],[0.65,0.65,0.65],'FaceAlpha',0.3,'EdgeColor','none')
patch([100.5+r2+r3 xl(2) xl(2) 100.5+r2+r3],[yl(1) yl(1) yl(2) yl(2)],[0.15,0.15,0.15],'FaceAlpha',0.3,'EdgeColor','none')
set(gca,'FontWeight','bold','LineWidth',1)

nexttile
bar(abs([Full.ERROR_MATRIX(1:100,2);human2Full.ERROR_MATRIX(:,2);human3Full.ERROR_MATRIX(:,2);human4Full.ERROR_MATRIX(:,2)]),'FaceColor',[0.47,0.67,0.19])
xticks({})
ylabel('y direction','FontName','Aria')
yl = ylim;
xl = xlim;
patch([100.5 100.5+r2 100.5+r2 100.5],[yl(1) yl(1) yl(2) yl(2)],[0.90,0.90,0.90],'FaceAlpha',0.3,'EdgeColor','none')
patch([100.5+r2 100.5+r2+r3 100.5+r2+r3 100.5+r2],[yl(1) yl(1) yl(2) yl(2)],[0.65,0.65,0.65],'FaceAlpha',0.3,'EdgeColor','none')
patch([100.5+r2+r3 xl(2) xl(2) 100.5+r2+r3],[yl(1) yl(1) yl(2) yl(2)],[0.15,0.15,0.15],'FaceAlpha',0.3,'EdgeColor','none')
set(gca,'FontWeight','bold','LineWidth',1)

nexttile
bar(abs([Full.ERROR_MATRIX(1:100,3);human2Full.ERROR_MATRIX(:,3);human3Full.ERROR_MATRIX(:,3);human4Full.ERROR_MATRIX(:,3)]),'FaceColor',[1.00,0.41,0.16])
ylabel('z direction','FontName','Aria')
yl = ylim;
xl = xlim;
patch([100.5 100.5+r2 100.5+r2 100.5],[yl(1) yl(1) yl(2) yl(2)],[0.90,0.90,0.90],'FaceAlpha',0.3,'EdgeColor','none')
patch([100.5+r2 100.5+r2+r3 100.5+r2+r3 100.5+r2],[yl(1) yl(1) yl(2) yl(2)],[0.65,0.65,0.65],'FaceAlpha',0.3,'EdgeColor','none')
patch([100.5+r2+r3 xl(2) xl(2) 100.5+r2+r3],[yl(1) yl(1) yl(2) yl(2)],[0.15,0.15,0.15],'FaceAlpha',0.3,'EdgeColor','none')
set(gca,'FontWeight','bold','LineWidth',1)

title(t,'Comparison of Position Errors(m)','FontName','Aria','FontSize',12,'FontWeight','bold')
xlabel('Data ID','FontName','Aria')

% %% plot3-histogram-of-test-statistics
% figure
% histogram(error_xyz(:,1,1))
% xll = xline(-std_error(1,1),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(1,1),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(1,1),'--r','-5sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(1,1),'--r','+5sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% title('无故障时x方向上X1-X0误差直方图')

