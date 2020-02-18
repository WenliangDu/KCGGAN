clear
close all
loadResultsName = '..\kmeans-results';

load(strcat(loadResultsName,'\Kmeans1D\Kmeans1D_Cluster_Results.mat'),'MSEMaxMin1D','TimeMaxMin1D');
load(strcat(loadResultsName,'\Plus\Plus_Cluster_Results.mat'),'MSEPlus','MSEMaxMinPlus','TimeMaxMinPlus');
load(strcat(loadResultsName,'\Minibatch\MiniBatch_Cluster_Results.mat'),'MSEMini','MSEMaxMinMini','TimeMaxMinMini');
load(strcat(loadResultsName,'\Ckmeans\Ck_Cluster_Results.mat'),'MSECk','MSEMaxMinCk','TimeMaxMinCk');



ClusterNumArray = 2:1:6;
%ClusterNumArray = [100 ClusterNumArray];
ClusterNum = 1:length(ClusterNumArray);

figure,
LeftX = ClusterNum-0.2;
RightX = ClusterNum+0.2;
%% remove cluster 1
TimeMaxMinPlus(:,1) = []; 
TimeMaxMinCk(:,1) = [];
TimeMaxMinMini(:,1) = [];
TimeMaxMin1D(:,1) = [];

h1 = area(ClusterNumArray,[(TimeMaxMinPlus(2,:))',((TimeMaxMinPlus(1,:))' - (TimeMaxMinPlus(2,:))')]); hold on%repmat(10,[4 1])
set(h1(1),'Visible','off');
set(h1(2),'EdgeColor',[1,180/255,1],'FaceColor',[1,223/255,1]);
alpha(0.7)
H1 = plot(ClusterNumArray,(TimeMaxMinPlus(3,:))','m-^','LineWidth',2,'MarkerSize',10);

h2 = area(ClusterNumArray,[(TimeMaxMinMini(2,:))',((TimeMaxMinMini(1,:))' - (TimeMaxMinMini(2,:))')]);%repmat(10,[4 1])
set(h2(1),'Visible','off');
set(h2(2),'EdgeColor',[180/255,180/255,1],'FaceColor',[223/255,223/255,1]);
alpha(0.7)
H2 = plot(ClusterNumArray,(TimeMaxMinMini(3,:))','b-^','LineWidth',2,'MarkerSize',10);

h3 = area(ClusterNumArray,[(TimeMaxMinCk(2,:))',((TimeMaxMinCk(1,:))' - (TimeMaxMinCk(2,:))')]); hold on%repmat(10,[4 1])
set(h3(1),'Visible','off');
set(h3(2),'EdgeColor',[210/255,233/255,210/256],'FaceColor',[229/255,255/255,229/256]);
alpha(0.7)
H3 = plot(ClusterNumArray,TimeMaxMinCk(3,:)','-^','Color',[56/255,205/255,56/256],'LineWidth',2,'MarkerSize',10);

h4 = area(ClusterNumArray,[(TimeMaxMin1D(2,:))',((TimeMaxMin1D(1,:))' - (TimeMaxMin1D(2,:))')]); %repmat(10,[4 1])
set(h4(1),'Visible','off');
set(h4(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
alpha(0.7)
H4 = plot(ClusterNumArray,(TimeMaxMin1D(3,:)),'r-^','LineWidth',2,'MarkerSize',10);


% h3 = area(ClusterNumArray,[(TimeMaxMin1D(2,:))',((TimeMaxMin1D(1,:))' - (TimeMaxMin1D(2,:))')]); %repmat(10,[4 1])
% set(h3(1),'Visible','off');
% set(h3(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
% alpha(0.7)
% H3 = plot(ClusterNumArray,mean(TimeMaxMin1D,1),'r-^','LineWidth',1,'MarkerSize',10);

set(gca,'YTick',0:2:18,'FontSize',22);
set(gca,'XTick',ClusterNumArray,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
% set(gca,'xticklabel',ClusterNumArray);
set(gca,'box','on');

axis([2 6 0 18]);
grid on;
% legend('K-means++','Mini-Batch T','Mini-Batch','1D-k-means');
legend([H1(1), H2(1), H3(1), H4(1)], 'K-means++','Mini-batch','Ckmeans.1d.dp','1D-k-means','location','northwest');

xlabel('The number of clusters');
ylabel('Processing time (s)');

%%

%% remove cluster 1
MSEMaxMinPlus(:,1) = []; 
MSEMaxMinCk(:,1) = [];
MSEMaxMinMini(:,1) = [];
MSEMaxMin1D(:,1) = [];
figure,
h2 = area(ClusterNumArray,[(MSEMaxMinMini(2,:))',((MSEMaxMinMini(1,:))' - (MSEMaxMinMini(2,:))')]);hold on%repmat(10,[4 1])
set(h2(1),'Visible','off');
set(h2(2),'EdgeColor',[180/255,180/255,1],'FaceColor',[223/255,223/255,1]);
alpha(0.7)
H2 = plot(ClusterNumArray,(MSEMaxMinMini(3,:))','b-^','LineWidth',2,'MarkerSize',10);

% h3 = area(ClusterNumArray,[(MSEMaxMin1D(2,:))',((MSEMaxMin1D(1,:))' - (MSEMaxMin1D(2,:))')]); %repmat(10,[4 1])
% set(h3(1),'Visible','off');
% set(h3(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
% alpha(0.7)
% H3 = plot(ClusterNumArray,mean(MSEMaxMin1D,1),'r-^','LineWidth',2,'MarkerSize',10);

h4 = area(ClusterNumArray,[(MSEMaxMin1D(2,:))',((MSEMaxMin1D(1,:))' - (MSEMaxMin1D(2,:))')]); %repmat(10,[4 1])
set(h4(1),'Visible','off');
set(h4(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
alpha(0.7)
H4 = plot(ClusterNumArray,(MSEMaxMin1D(3,:))','r-^','LineWidth',2,'MarkerSize',10);

h1 = area(ClusterNumArray,[(MSEMaxMinPlus(2,:))',((MSEMaxMinPlus(1,:))' - (MSEMaxMinPlus(2,:))')]); hold on%repmat(10,[4 1])
set(h1(1),'Visible','off');
set(h1(2),'EdgeColor',[1,180/255,1],'FaceColor',[1,223/255,1]);
alpha(0.7)
H1 = plot(ClusterNumArray,(MSEMaxMinPlus(3,:))','m-^','LineWidth',2,'MarkerSize',10);

h3 = area(ClusterNumArray,[(MSEMaxMinCk(2,:))',((MSEMaxMinCk(1,:))' - (MSEMaxMinCk(2,:))')]); hold on%repmat(10,[4 1])
set(h3(1),'Visible','off');
set(h3(2),'EdgeColor',[210/255,233/255,210/256],'FaceColor',[229/255,255/255,229/256]);
alpha(0.7)
H3 = plot(ClusterNumArray,(MSEMaxMinCk(3,:))','-^','Color',[56/255,205/255,56/256],'LineWidth',2,'MarkerSize',10);

set(gca,'YTick',6:2:24,'FontSize',22);
set(gca,'XTick',ClusterNumArray,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
set(gca,'xticklabel',ClusterNumArray);
set(gca,'box','on');

axis([2 6 6 24]);
grid on;
% legend('K-means++','Mini-Batch T','Mini-Batch','1D-k-means');
legend([H1(1), H2(1), H3(1), H4(1)], 'K-means++','Mini-batch','Ckmeans.1d.dp','1D-k-means','location','northeast');

xlabel('The number of clusters');
ylabel('MSE');
