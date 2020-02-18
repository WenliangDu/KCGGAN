clear
close all
loadResultsName = '..\kmeans-results';

load(strcat(loadResultsName,'\Kmeans1D\Kmeans1D_numbers_Results.mat'),'MSEMaxMin1D','TimeMaxMin1D');
load(strcat(loadResultsName,'\Plus\Plus_numbers_Results.mat'),'MSEPlus','MSEMaxMinPlus','TimeMaxMinPlus');
load(strcat(loadResultsName,'\MiniBatch\MiniBatch_numbers_Results.mat'),'MSEMini','MSEMaxMinMini','TimeMaxMinMini');
load(strcat(loadResultsName,'\Ckmeans\Ck_numbers_Results.mat'),'MSECk','MSEMaxMinCk','TimeMaxMinCk');



NumberNumArray = 500:500:2000;
% NumberNumArray = [100 NumberNumArray];
NumberNum = 1:length(NumberNumArray);

figure,
LeftX = NumberNum-0.2;
RightX = NumberNum+0.2;

h1 = area(NumberNumArray,[(TimeMaxMinPlus(2,:))',((TimeMaxMinPlus(1,:))' - (TimeMaxMinPlus(2,:))')]); hold on%repmat(10,[4 1])
set(h1(1),'Visible','off');
set(h1(2),'EdgeColor',[1,180/255,1],'FaceColor',[1,223/255,1]);
alpha(0.7)
H1 = plot(NumberNumArray,(TimeMaxMinPlus(3,:))','m-^','LineWidth',2,'MarkerSize',10);

h2 = area(NumberNumArray,[(TimeMaxMinMini(2,:))',((TimeMaxMinMini(1,:))' - (TimeMaxMinMini(2,:))')]);%repmat(10,[4 1])
set(h2(1),'Visible','off');
set(h2(2),'EdgeColor',[180/255,180/255,1],'FaceColor',[223/255,223/255,1]);
alpha(0.7)
H2 = plot(NumberNumArray,(TimeMaxMinMini(3,:))','b-^','LineWidth',2,'MarkerSize',10);

% h3 = area(NumberNumArray,[(TimeMaxMinCk(2,:))',((TimeMaxMinCk(1,:))' - (TimeMaxMinCk(2,:))')]); hold on%repmat(10,[4 1])
% set(h3(1),'Visible','off');
% set(h3(2),'EdgeColor',[247/255,186/255,133/256],'FaceColor',[240/255,213/255,190/256]);
% alpha(0.7)
% H3 = plot(NumberNumArray,TimeMaxMinCk(3,:)','-^','Color',[239/255,124/255,33/256],'LineWidth',1,'MarkerSize',10);

h3 = area(NumberNumArray,[(TimeMaxMinCk(2,:))',((TimeMaxMinCk(1,:))' - (TimeMaxMinCk(2,:))')]); hold on%repmat(10,[4 1])
set(h3(1),'Visible','off');
set(h3(2),'EdgeColor',[210/255,233/255,210/256],'FaceColor',[229/255,255/255,229/256]);
alpha(0.7)
H3 = plot(NumberNumArray,TimeMaxMinCk(3,:)','-^','Color',[56/255,205/255,56/256],'LineWidth',2,'MarkerSize',10);

h4 = area(NumberNumArray,[(TimeMaxMin1D(2,:))',((TimeMaxMin1D(1,:))' - (TimeMaxMin1D(2,:))')]); %repmat(10,[4 1])
set(h4(1),'Visible','off');
set(h4(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
alpha(0.7)
H4 = plot(NumberNumArray,(TimeMaxMin1D(3,:)),'r-^','LineWidth',2,'MarkerSize',10);



set(gca,'YTick',0:25:175,'FontSize',22);
set(gca,'XTick',NumberNumArray,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
% set(gca,'xticklabel',NumberNumArray);
set(gca,'box','on');

%axis([NumberNum(1) NumberNum(end) 0 110]);
axis([NumberNumArray(1) NumberNumArray(end) 0 175]);
grid on;
legend([H1(1), H2(1), H3(1), H4(1)], 'K-means++','Mini-batch','Ckmeans.1d.dp','1D-k-means','location','northwest');
% legend('Kmeans++','Mini-Batch T','Mini-Batch','Fast-1D-kmeans');

xlabel('The number of images');
ylabel('Processing time (s)');
%
%%
figure,
h1 = area(NumberNumArray,[(MSEMaxMinPlus(2,:))',((MSEMaxMinPlus(1,:))' - (MSEMaxMinPlus(2,:))')]); hold on%repmat(10,[4 1])
set(h1(1),'Visible','off');
set(h1(2),'EdgeColor',[1,180/255,1],'FaceColor',[1,223/255,1]);
alpha(0.7)
H1 = plot(NumberNumArray,(MSEMaxMinPlus(3,:))','m-^','LineWidth',2,'MarkerSize',10);

h2 = area(NumberNumArray,[(MSEMaxMinMini(2,:))',((MSEMaxMinMini(1,:))' - (MSEMaxMinMini(2,:))')]);%repmat(10,[4 1])
set(h2(1),'Visible','off');
set(h2(2),'EdgeColor',[180/255,180/255,1],'FaceColor',[223/255,223/255,1]);
alpha(0.7)
H2 = plot(NumberNumArray,(MSEMaxMinMini(3,:))','b-^','LineWidth',2,'MarkerSize',10);

h3 = area(NumberNumArray,[(MSEMaxMinCk(2,:))',((MSEMaxMinCk(1,:))' - (MSEMaxMinCk(2,:))')]); hold on%repmat(10,[4 1])
set(h3(1),'Visible','off');
set(h3(2),'EdgeColor',[210/255,233/255,210/256],'FaceColor',[229/255,255/255,229/256]);
alpha(0.7)
H3 = plot(NumberNumArray,(MSEMaxMinCk(3,:))','-^','Color',[56/255,205/255,56/256],'LineWidth',2,'MarkerSize',10);

% h3 = area(NumberNumArray,[(MSEMaxMinCk(2,:))',((MSEMaxMinCk(1,:))' - (MSEMaxMinCk(2,:))')]); hold on%repmat(10,[4 1])
% set(h3(1),'Visible','off');
% set(h3(2),'EdgeColor',[156/255,156/255,156/256],'FaceColor',[220/255,220/255,220/256]);
% alpha(0.7)
% H3 = plot(NumberNumArray,MSEMaxMinCk(3,:)','-^','Color',[0/255,0/255,0/256],'LineWidth',1,'MarkerSize',10);

% h3 = area(NumberNumArray,[(MSEMaxMinCk(2,:))',((MSEMaxMinCk(1,:))' - (MSEMaxMinCk(2,:))')]); hold on%repmat(10,[4 1])
% set(h3(1),'Visible','off');
% set(h3(2),'EdgeColor',[247/255,186/255,133/256],'FaceColor',[240/255,213/255,190/256]);
% alpha(0.7)
% H3 = plot(NumberNumArray,MSEMaxMinCk(3,:)','-^','Color',[239/255,124/255,33/256],'LineWidth',1,'MarkerSize',10);

h4 = area(NumberNumArray,[(MSEMaxMin1D(2,:))',((MSEMaxMin1D(1,:))' - (MSEMaxMin1D(2,:))')]); %repmat(10,[4 1])
set(h4(1),'Visible','off');
set(h4(2),'EdgeColor',[1,180/255,180/255],'FaceColor',[1,223/255,223/255]);
alpha(0.7)
H4 = plot(NumberNumArray,(MSEMaxMin1D(3,:))','r-^','LineWidth',2,'MarkerSize',10);

set(gca,'YTick',14:1:18,'FontSize',22);
%set(gca,'XTick',NumberNum,'FontSize',22);
set(gcf, 'position', [0 0 900 500]);
set(gca,'xticklabel',NumberNumArray);
set(gca,'box','on');

axis([500 2000 14 18]);
% axis([0.5 NumberNum(end)+0.5 0 110]);
grid on;
legend([H1(1), H2(1), H3(1), H4(1)], 'K-means++','Mini-batch','Ckmeans.1d.dp','1D-k-means','location','northeast');
% legend('Kmeans++','Mini-Batch T','Mini-Batch','Fast-1D-kmeans');

xlabel('The number of images');
ylabel('MSE');



% line([LeftX;RightX],[MSEMaxMinPlus(1,:);MSEMaxMinPlus(1,:)],'Color','m','LineWidth',2);hold on
% H1 = line([LeftX;RightX],[MSEMaxMinPlus(2,:);MSEMaxMinPlus(2,:)],'Color','m','LineWidth',2);
% 
% line([NumberNum;NumberNum],[MSEMaxMinPlus(1,:);MSEMaxMinPlus(2,:)],'Color','m','LineWidth',15);
% 
% line([LeftX;RightX],[MSEMaxMinMiniT(1,:);MSEMaxMinMiniT(1,:)],'Color','b','LineWidth',2);
% H2 = line([LeftX;RightX],[MSEMaxMinMiniT(2,:);MSEMaxMinMiniT(2,:)],'Color','b','LineWidth',2);
% 
% % line([LeftX;RightX],[MSEMaxMinMini(1,:);MSEMaxMinMini(1,:)],'Color','g');
% % line([LeftX;RightX],[MSEMaxMinMini(2,:);MSEMaxMinMini(2,:)],'Color','g');
% 
% line([LeftX;RightX],[MSEMaxMin1D(1,:);MSEMaxMin1D(1,:)],'Color','r','LineWidth',2);
% H3 = line([LeftX;RightX],[MSEMaxMin1D(2,:);MSEMaxMin1D(2,:)],'Color','r','LineWidth',2);
% 
% line([NumberNum;NumberNum],[MSEMaxMinMiniT(1,:);MSEMaxMinMiniT(2,:)],'Color','b','LineWidth',10);
% line([NumberNum;NumberNum],[MSEMaxMin1D(1,:);MSEMaxMin1D(2,:)],'Color','r','LineWidth',5);
% 
% % line([NumberNum;NumberNum],[MSEMaxMinMini(1,:);MSEMaxMinMini(2,:)],'Color','g','LineWidth',6);
% 
% set(gca,'YTick',14:1:18,'FontSize',22);
% set(gca,'XTick',NumberNum,'FontSize',22);
% set(gcf, 'position', [0 0 900 500]);
% set(gca,'xticklabel',NumberNumArray);
% set(gca,'box','on');
% 
% axis([0.5 NumberNum(end)+0.5 14 18]);
% grid on;
% legend([H1(1), H2(1), H3(1)], 'K-means++','Mini-batch','1D-k-means');
% % legend('Kmeans++','Mini-Batch T','Mini-Batch','Fast-1D-kmeans');
% 
% xlabel('The number of images');
% ylabel('MSE');
%}
