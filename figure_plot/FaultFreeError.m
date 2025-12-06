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

% % x方向
% figure
% xH = histogram(Full.ERROR_MATRIX(:,1)-mean(Full.ERROR_MATRIX(:,1)),'LineWidth',1,'Normalization', 'probability');
% title('无故障时x方向定位误差与高斯拟合','FontName','微软雅黑','FontSize',16,'FontWeight','bold')
% ylabel('频率或概率','FontName','微软雅黑','FontSize',14)
% xlabel('定位误差(m)','FontName','微软雅黑','FontSize',14)
% set(gca,'FontWeight','bold','LineWidth',1)
% xlim([-0.032 0.032])
% x_error = Full.ERROR_MATRIX(:,1)-mean(Full.ERROR_MATRIX(:,1));
% xplot = plot_guassian(x_error,70);
% legend([xH, xplot], {'误差频率', '高斯拟合曲线'}, 'Location', 'northeast');
% hold off;
% 
% % y方向
% figure
% yH = histogram(Full.ERROR_MATRIX(:,2)-mean(Full.ERROR_MATRIX(:,2)),'LineWidth',1,'Normalization', 'probability');
% title('无故障时y方向定位误差与高斯拟合','FontName','微软雅黑','FontSize',16,'FontWeight','bold')
% ylabel('频率或概率','FontName','微软雅黑','FontSize',14)
% xlabel('定位误差(m)','FontName','微软雅黑','FontSize',14)
% xlim([-0.15 0.15]); % 根据你的数据调整这个范围
% set(gca,'FontWeight','bold','LineWidth',1)
% % 拟合高斯分布
% y_error = Full.ERROR_MATRIX(:,2)-mean(Full.ERROR_MATRIX(:,2));
% % y方向呈现双峰高斯的形式，单峰和双峰绘图函数都提供，按需选择，目前使用的单峰
% yplot1 = plot_guassian(y_error,30); %30包络更紧，或选25更保守
% legend([yH, yplot1], {'误差频率', '高斯拟合曲线'}, 'Location', 'northeast');
% % yplot2 = plot_guassian(y_error,35);
% % legend([yH, yplot2], {'误差频率', '高斯拟合曲线'}, 'Location', 'northeast');
% hold off;
% 
% % z方向
% figure
% zH = histogram(Full.ERROR_MATRIX(:,3)-mean(Full.ERROR_MATRIX(:,3)),'LineWidth',1,'Normalization', 'probability');
% ylabel('频率或概率','FontName','微软雅黑','FontSize',14)
% xlabel('定位误差(m)','FontName','微软雅黑','FontSize',14)
% xlim([-0.12 0.12])
% set(gca,'FontWeight','bold','LineWidth',1,'FontSize',12)
% title('无故障时z方向定位误差与高斯拟合','FontName','微软雅黑','FontWeight','bold','FontSize',14)
% 
% % 拟合高斯分布
% z_error = Full.ERROR_MATRIX(:,3)-mean(Full.ERROR_MATRIX(:,3));
% % 绘制
% zplot = plot_guassian(z_error,60);
% legend([zH, zplot], {'误差频率', '高斯拟合曲线'}, 'Location', 'northeast');
% hold off;

%%

% x方向
figure
xH = histogram(Full.ERROR_MATRIX(:,1)-mean(Full.ERROR_MATRIX(:,1)),'LineWidth',1,'Normalization', 'probability');
title('Position Error in X Direction under Fault-Free Mode','FontName','Aria','FontSize',16,'FontWeight','bold')
ylabel('Frequency','FontName','Aria','FontSize',14)
xlabel('Position Error(m)','FontName','Aria','FontSize',14)
set(gca,'FontWeight','bold','LineWidth',1)
xlim([-0.032 0.032])
x_error = Full.ERROR_MATRIX(:,1)-mean(Full.ERROR_MATRIX(:,1));
xplot = plot_guassian(x_error,70);
legend([xH, xplot], {'Error Frequency', 'Gaussian fitting curve'}, 'Location', 'northeast');
hold off;

% y方向
figure
yH = histogram(Full.ERROR_MATRIX(:,2)-mean(Full.ERROR_MATRIX(:,2)),'LineWidth',1,'Normalization', 'probability');
title('Position Error in Y Direction under Fault-Free Mode','FontName','Aria','FontSize',16,'FontWeight','bold')
ylabel('Frequency','FontName','Aria','FontSize',14)
xlabel('Position Error(m)','FontName','Aria','FontSize',14)
xlim([-0.15 0.15]); % 根据你的数据调整这个范围
set(gca,'FontWeight','bold','LineWidth',1)
% 拟合高斯分布
y_error = Full.ERROR_MATRIX(:,2)-mean(Full.ERROR_MATRIX(:,2));
% y方向呈现双峰高斯的形式，单峰和双峰绘图函数都提供，按需选择，目前使用的单峰
yplot1 = plot_guassian(y_error,30); %30包络更紧，或选25更保守
legend([yH, yplot1], {'Error Frequency', 'Gaussian fitting curve'}, 'Location', 'northeast');
% yplot2 = plot_guassian(y_error,35);
% legend([yH, yplot2], {'误差频率', '高斯拟合曲线'}, 'Location', 'northeast');
hold off;

% z方向
figure
zH = histogram(Full.ERROR_MATRIX(:,3)-mean(Full.ERROR_MATRIX(:,3)),'LineWidth',1,'Normalization', 'probability');
ylabel('Frequency','FontName','Aria','FontSize',14)
xlabel('Position Error(m)','FontName','Aria','FontSize',14)
xlim([-0.12 0.12])
set(gca,'FontWeight','bold','LineWidth',1)
title('Position Error in Z Direction under Fault-Free Mode','FontName','Aria','FontWeight','bold','FontSize',16)

% 拟合高斯分布
z_error = Full.ERROR_MATRIX(:,3)-mean(Full.ERROR_MATRIX(:,3));
% 绘制
zplot = plot_guassian(z_error,60);
legend([zH, zplot], {'Error Frequency', 'Gaussian fitting curve'}, 'Location', 'northeast');
hold off;
