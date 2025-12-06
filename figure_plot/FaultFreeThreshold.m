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

% %%  3-histogram-std-x-X1-X0---------------
% figure
% subplot(3,6,1)
% histogram(error_xyz(:,1,1))
% xll = xline(-std_error(1,1),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(1,1),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(1,1),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(1,1),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.01 0.01])
% % title('\fontname{微软雅黑}无故障时', '\fontname{Helvetica} x方向上X1-X0误差', '\fontname{微软雅黑}直方图'])
% % title('$\Delta \hat{x}_q^{(d)}$', 'Interpreter', 'latex');
% % title(['\fontname{微软雅黑}无故障时', '\fontname{Helvetica} Δx̂_1^{(1)}', '\fontname{微软雅黑}直方图'],  'FontSize', 8, 'FontWeight', 'bold');
% title(['\fontname{Aria}histogram of ','\fontname{Helvetica} Δx̂_1^{(1)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-y-X1-X0---------------
% subplot(3,6,7)
% histogram(error_xyz(:,1,2))
% xll = xline(-std_error(1,2),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(1,2),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(1,2),'--r','Threshold');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(1,2),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.05 0.05])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_2^{(1)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-z-X1-X0---------------
% subplot(3,6,13)
% histogram(error_xyz(:,1,3))
% xll = xline(-std_error(1,3),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(1,3),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(1,3),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(1,3),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.05 0.05])
% title(['\fontname{Aria}histogram of ','\fontname{Helvetica}Δx̂_3^{(1)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-x-X2-X0---------------
% subplot(3,6,2)
% histogram(error_xyz(:,2,1))
% xll = xline(-std_error(2,1),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(2,1),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(2,1),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(2,1),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.15 0.15])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_1^{(2)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-y-X2-X0---------------
% subplot(3,6,8)
% histogram(error_xyz(:,2,2))
% xll = xline(-std_error(2,2),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(2,2),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(2,2),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(2,2),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.15 0.15])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_2^{(2)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-z-X2-X0---------------
% subplot(3,6,14)
% histogram(error_xyz(:,2,3))
% xll = xline(-std_error(2,3),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(2,3),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(2,3),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(2,3),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.15 0.15])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_3^{(2)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-x-X3-X0---------------
% subplot(3,6,3)
% histogram(error_xyz(:,3,1))
% xll = xline(-std_error(3,1),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(3,1),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(3,1),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(3,1),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.02 0.02])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_1^{(3)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-y-X3-X0---------------
% subplot(3,6,9)
% histogram(error_xyz(:,3,2))
% xll = xline(-std_error(3,2),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(3,2),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(3,2),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(3,2),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.06 0.06])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_2^{(3)}'],  'FontSize',12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-z-X3-X0---------------
% subplot(3,6,15)
% histogram(error_xyz(:,3,3))
% xll = xline(-std_error(3,3),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(3,3),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(3,3),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(3,3),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.05 0.05])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_3^{(3)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-x-X4-X0---------------
% subplot(3,6,4)
% histogram(error_xyz(:,4,1))
% xll = xline(-std_error(4,1),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(4,1),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(4,1),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(4,1),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.03 0.03])
% title(['\fontname{Aria}histogram of ','\fontname{Helvetica}Δx̂_1^{(4)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-y-X4-X0---------------
% subplot(3,6,10)
% histogram(error_xyz(:,4,2))
% xll = xline(-std_error(4,2),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(4,2),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(4,2),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(4,2),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.09 0.09])
% title(['\fontname{Aria}histogram of ','\fontname{Helvetica}Δx̂_2^{(4)}'],  'FontSize',12, 'FontWeight', 'bold');
% 
% 
% %  3-histogram-std-z-X4-X0---------------
% subplot(3,6,16)
% histogram(error_xyz(:,4,3))
% xll = xline(-std_error(4,3),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(4,3),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(4,3),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(4,3),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.07 0.07])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_3^{(4)}'],  'FontSize',12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-x-X5-X0---------------
% subplot(3,6,5)
% histogram(error_xyz(:,5,1))
% xll = xline(-std_error(5,1),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(5,1),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(5,1),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(5,1),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.1 0.1])
% title(['\fontname{Aria}histogram of ','\fontname{Helvetica}Δx̂_1^{(5)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-y-X5-X0---------------
% subplot(3,6,11)
% histogram(error_xyz(:,5,2))
% xll = xline(-std_error(5,2),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(5,2),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(5,2),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(5,2),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.16 0.16])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_2^{(5)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-z-X5-X0---------------
% subplot(3,6,17)
% histogram(error_xyz(:,5,3))
% xll = xline(-std_error(5,3),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(5,3),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(5,3),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(5,3),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.1 0.1])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_3^{(5)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-x-X6-X0---------------
% subplot(3,6,6)
% histogram(error_xyz(:,6,1))
% xll = xline(-std_error(6,1),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(6,1),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(6,1),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(6,1),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.04 0.04])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_1^{(6)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-y-X6-X0---------------
% subplot(3,6,12)
% histogram(error_xyz(:,6,2))
% xll = xline(-std_error(6,2),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(6,2),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(6,2),'--r','检验门限');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(6,2),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.12 0.12])
% title(['\fontname{Aria}histogram of ','\fontname{Helvetica}Δx̂_2^{(6)}'],  'FontSize', 12, 'FontWeight', 'bold');
% 
% %  3-histogram-std-z-X6-X0---------------
% subplot(3,6,18)
% histogram(error_xyz(:,6,3))
% xll = xline(-std_error(6,3),'--black','-sigma');
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(std_error(6,3),'--black','+sigma');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% % xll = xline(-5*std_error(6,3),'--r','检验门限');
% xll = xline(-5*std_error(6,3),'--r','检验门限');
% % 如果需要加粗需要调用下面的语句，效果不好
% % xll = xline(-5*std_error(6,3), '--r');  % 添加红色虚线
% % 
% % % 获取当前图表的句柄
% % ax = gca;
% % 
% % % 计算标签的垂直位置（中间位置）
% % x_value = -5 * std_error(6,3); % 计算x位置
% % y_position = (ax.YLim(1) + ax.YLim(2)) / 2;  % 计算y轴中点
% % 
% % % 添加自定义文本
% % text(x_value, y_position, {'+5', '\sigma'}, 'Color', 'red', 'FontWeight', 'bold', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle', 'Rotation', 0);
% 
% xll.LabelVerticalAlignment = 'middle';
% xll.LabelHorizontalAlignment = 'center';
% xlr = xline(5*std_error(6,3),'--r','检验门限');
% xlr.LabelVerticalAlignment = 'middle';
% xlr.LabelHorizontalAlignment = 'center';
% xlim([-0.1 0.1])
% title(['\fontname{Aria}histogram of ', '\fontname{Helvetica}Δx̂_3^{(6)}'], 'FontSize',12, 'FontWeight', 'bold');

%%  3-histogram-std-x-X1-X0---------------
% Englishs
figure
subplot(3,6,1)
histogram(error_xyz(:,1,1))
xll = xline(-std_error(1,1),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(1,1),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(1,1),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(1,1),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.01 0.01])
% title('\fontname{微软雅黑}无故障时', '\fontname{Helvetica} x方向上X1-X0误差', '\fontname{微软雅黑}直方图'])
% title('$\Delta \hat{x}_q^{(d)}$', 'Interpreter', 'latex');
% title(['\fontname{微软雅黑}无故障时', '\fontname{Helvetica} Δx̂_1^{(1)}', '\fontname{微软雅黑}直方图'],  'FontSize', 8, 'FontWeight', 'bold');
title(['\fontname{Aria}histogram of','\fontname{Helvetica} Δ_1^{(1)}'],  'FontSize', 12, 'FontWeight', 'bold');


%  3-histogram-std-y-X1-X0---------------
subplot(3,6,7)
histogram(error_xyz(:,1,2))
xll = xline(-std_error(1,2),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(1,2),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(1,2),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(1,2),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.05 0.05])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_2^{(1)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-z-X1-X0---------------
subplot(3,6,13)
histogram(error_xyz(:,1,3))
xll = xline(-std_error(1,3),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(1,3),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(1,3),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(1,3),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.05 0.05])
title(['\fontname{Aria}histogram of','\fontname{Helvetica} Δ_3^{(1)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-x-X2-X0---------------
subplot(3,6,2)
histogram(error_xyz(:,2,1))
xll = xline(-std_error(2,1),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(2,1),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(2,1),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(2,1),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.15 0.15])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_1^{(2)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-y-X2-X0---------------
subplot(3,6,8)
histogram(error_xyz(:,2,2))
xll = xline(-std_error(2,2),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(2,2),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(2,2),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(2,2),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.15 0.15])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_2^{(2)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-z-X2-X0---------------
subplot(3,6,14)
histogram(error_xyz(:,2,3))
xll = xline(-std_error(2,3),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(2,3),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(2,3),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(2,3),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.15 0.15])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_3^{(2)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-x-X3-X0---------------
subplot(3,6,3)
histogram(error_xyz(:,3,1))
xll = xline(-std_error(3,1),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(3,1),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(3,1),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(3,1),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.02 0.02])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_1^{(3)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-y-X3-X0---------------
subplot(3,6,9)
histogram(error_xyz(:,3,2))
xll = xline(-std_error(3,2),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(3,2),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(3,2),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(3,2),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.06 0.06])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_2^{(3)}'],  'FontSize',12, 'FontWeight', 'bold');

%  3-histogram-std-z-X3-X0---------------
subplot(3,6,15)
histogram(error_xyz(:,3,3))
xll = xline(-std_error(3,3),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(3,3),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(3,3),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(3,3),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.05 0.05])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_3^{(3)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-x-X4-X0---------------
subplot(3,6,4)
histogram(error_xyz(:,4,1))
xll = xline(-std_error(4,1),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(4,1),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(4,1),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(4,1),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.03 0.03])
title(['\fontname{Aria}histogram of','\fontname{Helvetica} Δ_1^{(4)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-y-X4-X0---------------
subplot(3,6,10)
histogram(error_xyz(:,4,2))
xll = xline(-std_error(4,2),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(4,2),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(4,2),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(4,2),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.09 0.09])
title(['\fontname{Aria}histogram of','\fontname{Helvetica} Δ_2^{(4)}'],  'FontSize',12, 'FontWeight', 'bold');


%  3-histogram-std-z-X4-X0---------------
subplot(3,6,16)
histogram(error_xyz(:,4,3))
xll = xline(-std_error(4,3),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(4,3),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(4,3),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(4,3),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.07 0.07])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_3^{(4)}'],  'FontSize',12, 'FontWeight', 'bold');

%  3-histogram-std-x-X5-X0---------------
subplot(3,6,5)
histogram(error_xyz(:,5,1))
xll = xline(-std_error(5,1),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(5,1),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(5,1),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(5,1),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.1 0.1])
title(['\fontname{Aria}histogram of','\fontname{Helvetica} Δ_1^{(5)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-y-X5-X0---------------
subplot(3,6,11)
histogram(error_xyz(:,5,2))
xll = xline(-std_error(5,2),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(5,2),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(5,2),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(5,2),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.16 0.16])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_2^{(5)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-z-X5-X0---------------
subplot(3,6,17)
histogram(error_xyz(:,5,3))
xll = xline(-std_error(5,3),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(5,3),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(5,3),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(5,3),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.1 0.1])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_3^{(5)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-x-X6-X0---------------
subplot(3,6,6)
histogram(error_xyz(:,6,1))
xll = xline(-std_error(6,1),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(6,1),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(6,1),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(6,1),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.04 0.04])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_1^{(6)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-y-X6-X0---------------
subplot(3,6,12)
histogram(error_xyz(:,6,2))
xll = xline(-std_error(6,2),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(6,2),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(6,2),'--r','Threshold');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(6,2),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.12 0.12])
title(['\fontname{Aria}histogram of','\fontname{Helvetica} Δ_2^{(6)}'],  'FontSize', 12, 'FontWeight', 'bold');

%  3-histogram-std-z-X6-X0---------------
subplot(3,6,18)
histogram(error_xyz(:,6,3))
xll = xline(-std_error(6,3),'--black','-sigma');
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(6,3),'--black','+sigma');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
% xll = xline(-5*std_error(6,3),'--r','Threshold');
xll = xline(-5*std_error(6,3),'--r','Threshold');
% 如果需要加粗需要调用下面的语句，效果不好
% xll = xline(-5*std_error(6,3), '--r');  % 添加红色虚线
% 
% % 获取当前图表的句柄
% ax = gca;
% 
% % 计算标签的垂直位置（中间位置）
% x_value = -5 * std_error(6,3); % 计算x位置
% y_position = (ax.YLim(1) + ax.YLim(2)) / 2;  % 计算y轴中点
% 
% % 添加自定义文本
% text(x_value, y_position, {'+5', '\sigma'}, 'Color', 'red', 'FontWeight', 'bold', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle', 'Rotation', 0);

xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(6,3),'--r','Threshold');
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.1 0.1])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_3^{(6)}'], 'FontSize',12, 'FontWeight', 'bold');
%%
%  3-histogram-std-y-X5-X0---------------
figure
histogram(error_xyz(:,5,2))
xll = xline(-std_error(5,2),'--black','-sigma','LineWidth',1.5,'FontSize', 12 );
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(std_error(5,2),'--black','+sigma','LineWidth',1.5,'FontSize', 12);
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xll = xline(-5*std_error(5,2),'--r','Threshold','LineWidth',1.5,'FontSize', 12);
xll.LabelVerticalAlignment = 'middle';
xll.LabelHorizontalAlignment = 'center';
xlr = xline(5*std_error(5,2),'--r','Threshold','LineWidth',1.5,'FontSize', 12);
xlr.LabelVerticalAlignment = 'middle';
xlr.LabelHorizontalAlignment = 'center';
xlim([-0.16 0.16])
title(['\fontname{Aria}histogram of', '\fontname{Helvetica} Δ_2^{(5)}'],  'FontSize', 12, 'FontWeight', 'bold');
set(gca,'FontName','Times New Roman','FontSize',11,'FontWeight','bold');
set(gca,'linewidth',1)
