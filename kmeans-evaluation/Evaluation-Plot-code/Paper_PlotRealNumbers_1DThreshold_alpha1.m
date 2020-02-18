clear
close all
loadResultsName = '..\kmeans-results';

load(strcat(loadResultsName,'\Kmeans1D\Kmeans1D_Manynumbers_Results.mat'),'MSEMaxMin1D','TimeMaxMin1D');
load(strcat(loadResultsName,'\Threshold\KmeansThreshold_Manynumbers_Results.mat'),'MSEMaxMinThreshold','TimeMaxMinThreshold');
% load(strcat(loadResultsName,'\Minibatch\Mini_numbers_Results.mat'),'MSEMini','MSEMaxMinMini','TimeMaxMinMini');
% load(strcat(loadResultsName,'\MinibatchT\MiniT_numbers_Results.mat'),'MSEMiniT','MSEMaxMinMiniT','TimeMaxMinMiniT');

% NumberNumArray = [2000 4000 6000 8000];
NumberNumArray = 2000:2000:8000;
% NumberNumArray = [100 NumberNumArray];
NumberNum = 1:length(NumberNumArray);

figure,
LeftX = NumberNum-0.2;
RightX = NumberNum+0.2;
%% remove 1000
TimeMaxMinThreshold(:,1) = []; 
TimeMaxMin1D(:,1) = [];
% TimeMaxMinMini(:,1) = [];
% TimeMaxMin1D(:,1) = [];

h1 = area(NumberNumArray,[(TimeMaxMinThreshold(2,:))',((TimeMaxMinThreshold(1,:))' - (TimeMaxMinThreshold(2,:))')]); hold on%repmat(10,[4 1])
set(h1(1),'Visible','off');
set(h1(2),'EdgeColor',[247/255,186/255,133/256],'FaceColor',[240/255,213/255,190/256]);
alpha(0.7)
H1 = plot(NumberNumArray,TimeMaxMinThreshold(3,:)','-^','Color',[239/255,124/255,33/256],'LineWidth',1,'MarkerSize',10);

% h2 = area(NumberNumArray,[(TimeMaxMinMiniT(2,:))',((TimeMaxMinMiniT(1,:))' - (TimeMaxMinMiniT(2,:))')]);%repmat(10,[4 1])
% set(h2(1),'Visible','off');
% set(h2(2),'EdgeColor',[180/255,180/255,1],'FaceColor',[223/255,223/255,1]);
% alpha(0.7)
% H2 = plot(NumberNumArray,mean(TimeMaxMinMiniT,1),'b-^','LineWidth',1,'MarkerSize',10);

h3 = area(NumberNumArray,[(TimeMaxMin1D(2,:))',((TimeMaxMin1D(1,:))' - (TimeMaxMin1D(2,:))')]); %repmat(10,[4 1])
set(h3(1),'Visible','off');
set(h3(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
alpha(0.7)
H3 = plot(NumberNumArray,TimeMaxMin1D(3,:)','r-^','LineWidth',1,'MarkerSize',10);

set(gca,'XTick',NumberNumArray,'FontSize',22);
% set(gca,'xticklabel',NumberNumArray);
set(gca,'YTick',5:5:45,'FontSize',22);
%set(gca,'XTick',NumberNum,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
% set(gca,'xticklabel',NumberNumArray);
set(gca,'box','on');

%axis([NumberNum(1) NumberNum(end) 0 110]);
axis([NumberNumArray(1) NumberNumArray(end) 5 45]);
grid on;
legend([H1(1), H3(1)], 'Otsu','1D-k-means','location','northwest');
% legend('Kmeans++','Mini-Batch T','Mini-Batch','Fast-1D-kmeans');

xlabel('The number of images');
ylabel('Processing time (s)');
%
%%

%% remove 100
% MSEMaxMinPlus(:,1) = []; 
% MSEMaxMinMiniT(:,1) = [];
% MSEMaxMinMini(:,1) = [];
MSEMaxMin1D(:,1) = [];
MSEMaxMinThreshold(:,1) = [];
figure,
h1 = area(NumberNumArray,[(MSEMaxMinThreshold(2,:))',((MSEMaxMinThreshold(1,:))' - (MSEMaxMinThreshold(2,:))')]); hold on%repmat(10,[4 1])
set(h1(1),'Visible','off');
set(h1(2),'EdgeColor',[247/255,186/255,133/256],'FaceColor',[240/255,213/255,190/256]);
alpha(0.7)
H1 = plot(NumberNumArray,MSEMaxMinThreshold(3,:)','-^','Color',[239/255,124/255,33/256],'LineWidth',1,'MarkerSize',10);

% h2 = area(NumberNumArray,[(MSEMaxMinMiniT(2,:))',((MSEMaxMinMiniT(1,:))' - (MSEMaxMinMiniT(2,:))')]);%repmat(10,[4 1])
% set(h2(1),'Visible','off');
% set(h2(2),'EdgeColor',[180/255,180/255,1],'FaceColor',[223/255,223/255,1]);
% alpha(0.7)
% H2 = plot(NumberNumArray,mean(MSEMaxMinMiniT,1),'b-^','LineWidth',1,'MarkerSize',10);

h3 = area(NumberNumArray,[(MSEMaxMin1D(2,:))',((MSEMaxMin1D(1,:))' - (MSEMaxMin1D(2,:))')]); %repmat(10,[4 1])
set(h3(1),'Visible','off');
set(h3(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
alpha(0.7)
H3 = plot(NumberNumArray,MSEMaxMin1D(3,:)','r-^','LineWidth',1,'MarkerSize',10);

set(gca,'YTick',14:1:17,'FontSize',22);
set(gca,'XTick',NumberNumArray,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
% set(gca,'xticklabel',NumberNumArray);
set(gca,'box','on');

axis([NumberNumArray(1) NumberNumArray(end) 14 17]);
% axis([0.5 NumberNum(end)+0.5 0 110]);
grid on;
legend([H1(1), H3(1)], 'Otsu','1D-k-means');
% legend('Kmeans++','Mini-Batch T','Mini-Batch','Fast-1D-kmeans');

xlabel('The number of images');
ylabel('MSE');

