clear
close all
loadResultsName = '..\kmeans-results';

load(strcat(loadResultsName,'\Plus\Plus_Shift_Cluster_Results.mat'),'CenterShiftPlus');
load(strcat(loadResultsName,'\MiniBatch\MiniBatch_Shift_Cluster_Results.mat'),'CenterShiftMini');

ClusterNumArray = 2:1:6;
%ClusterNumArray = [100 ClusterNumArray];
% ClusterNum = 1:length(ClusterNumArray);

figure,
% LeftX = ClusterNum-0.2;
% RightX = ClusterNum+0.2;
%% remove cluster 1
CenterShiftPlus(:,1) = []; 
CenterShiftMini(:,1) = [];

plot(ClusterNumArray,CenterShiftPlus,'m-^','LineWidth',2,'MarkerSize',10);hold on
% plot(ClusterNum,CenterShiftMini,'g-^','LineWidth',2,'MarkerSize',10);
plot(ClusterNumArray,CenterShiftMini,'b-^','LineWidth',2,'MarkerSize',10);
plot(ClusterNumArray,[0 0 0 0 0],'-^','Color',[56/255,205/255,56/256],'LineWidth',4,'MarkerSize',15);
plot(ClusterNumArray,[0 0 0 0 0],'r-^','LineWidth',2,'MarkerSize',10);

set(gca,'YTick',0:5:40,'FontSize',22);
set(gca,'XTick',ClusterNumArray,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
set(gca,'xticklabel',ClusterNumArray);

axis([2 6 0 40]);
grid on;
% legend('K-means++','Mini-Batch','Mini-Batch T','1D-k-means');
legend('K-means++','Mini-batch','Ckmeans.1d.dp','1D-k-means','location','northwest');
xlabel('The number of clusters');
ylabel('Center Shift (pixels)');

%%
load(strcat(loadResultsName,'\Plus\Plus_Shift_Results.mat'),'CenterShiftPlus');
load(strcat(loadResultsName,'\MiniBatch\MiniBatch_Shift_Results.mat'),'CenterShiftMini');

NumberNumArray = 500:500:2000;
NumberNum = 1:length(NumberNumArray);

figure,
% LeftX = NumberNum-0.2;
% RightX = NumberNum+0.2;
%% remove 100
% TimeMaxMinPlus(:,1) = []; 
% TimeMaxMinMiniT(:,1) = [];
% TimeMaxMinMini(:,1) = [];
% TimeMaxMin1D(:,1) = [];

plot(NumberNumArray,CenterShiftPlus,'m-^','LineWidth',2,'MarkerSize',10);hold on
% plot(NumberNum,CenterShiftMini,'g-^','LineWidth',2,'MarkerSize',10);
plot(NumberNumArray,CenterShiftMini,'b-^','LineWidth',2,'MarkerSize',10);
plot(NumberNumArray,[0 0 0 0],'-^','Color',[56/255,205/255,56/256],'LineWidth',4,'MarkerSize',15);
plot(NumberNumArray,[0 0 0 0],'r-^','LineWidth',2,'MarkerSize',10);

set(gca,'YTick',0:2:14,'FontSize',22);
set(gca,'XTick',NumberNumArray,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
set(gca,'xticklabel',NumberNumArray);

axis([500 2000 0 14]);
grid on;
legend('K-means++','Mini-batch','Ckmeans.1d.dp','1D-k-means','location','northwest');
% legend('K-means++','Mini-Batch','Mini-Batch T','1D-k-means');
xlabel('The number of images');
ylabel('Center Shift (pixels)');
x = 1;
