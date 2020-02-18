clear
close all
loadResultsName = '..\kmeans-results';

load(strcat(loadResultsName,'\Kmeans1D\Kmeans1D_Cluster_Results.mat'),'MSEMaxMin1D','TimeMaxMin1D');
load(strcat(loadResultsName,'\Threshold\KmeansThreshold_Cluster_Results.mat'),'MSEMaxMinThreshold','TimeMaxMinThreshold');

ClusterNumArray = 2:6;
NumberNum = 1:length(ClusterNumArray);

figure,
LeftX = NumberNum-0.2;
RightX = NumberNum+0.2;
%% remove 1000
TimeMaxMinThreshold(:,1) = []; 
TimeMaxMin1D(:,1) = [];


h1 = area(ClusterNumArray,[(TimeMaxMinThreshold(2,:))',((TimeMaxMinThreshold(1,:))' - (TimeMaxMinThreshold(2,:))')]); hold on%repmat(10,[4 1])
set(h1(1),'Visible','off');
set(h1(2),'EdgeColor',[247/255,186/255,133/256],'FaceColor',[240/255,213/255,190/256]);
alpha(0.7)
H1 = plot(ClusterNumArray,TimeMaxMinThreshold(3,:)','-^','Color',[239/255,124/255,33/256],'LineWidth',1,'MarkerSize',10);


h3 = area(ClusterNumArray,[(TimeMaxMin1D(2,:))',((TimeMaxMin1D(1,:))' - (TimeMaxMin1D(2,:))')]); %repmat(10,[4 1])
set(h3(1),'Visible','off');
set(h3(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
alpha(0.7)
H3 = plot(ClusterNumArray,TimeMaxMin1D(3,:)','r-^','LineWidth',1,'MarkerSize',10);

set(gca,'XTick',ClusterNumArray,'FontSize',22);
% set(gca,'xticklabel',ClusterNumArray);
set(gca,'YTick',0:0.2:2.6,'FontSize',22);
%set(gca,'XTick',NumberNum,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
% set(gca,'xticklabel',ClusterNumArray);
set(gca,'box','on');

%axis([NumberNum(1) NumberNum(end) 0 110]);
axis([ClusterNumArray(1) ClusterNumArray(end) 0 2.6]);
grid on;
legend([H1(1), H3(1)], 'Otsu','1D-k-means','location','northwest');
% legend('Kmeans++','Mini-Batch T','Mini-Batch','Fast-1D-kmeans');

xlabel('The number of clusters');
ylabel('Processing time (s)');
%
%%

%% remove 100

MSEMaxMin1D(:,1) = [];
MSEMaxMinThreshold(:,1) = [];
figure,
h1 = area(ClusterNumArray,[(MSEMaxMinThreshold(2,:))',((MSEMaxMinThreshold(1,:))' - (MSEMaxMinThreshold(2,:))')]); hold on%repmat(10,[4 1])
set(h1(1),'Visible','off');
set(h1(2),'EdgeColor',[247/255,186/255,133/256],'FaceColor',[240/255,213/255,190/256]);
alpha(0.7)
H1 = plot(ClusterNumArray,MSEMaxMinThreshold(3,:)','-^','Color',[239/255,124/255,33/256],'LineWidth',1,'MarkerSize',10);

h3 = area(ClusterNumArray,[(MSEMaxMin1D(2,:))',((MSEMaxMin1D(1,:))' - (MSEMaxMin1D(2,:))')]); %repmat(10,[4 1])
set(h3(1),'Visible','off');
set(h3(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
alpha(0.7)
H3 = plot(ClusterNumArray,MSEMaxMin1D(3,:)','r-^','LineWidth',1,'MarkerSize',10);

set(gca,'YTick',6:2:24,'FontSize',22);
set(gca,'XTick',ClusterNumArray,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
set(gca,'box','on');

axis([ClusterNumArray(1) ClusterNumArray(end) 6 24]);
grid on;
legend([H1(1), H3(1)], 'Otsu','1D-k-means');

xlabel('The number of clusters');
ylabel('MSE');


