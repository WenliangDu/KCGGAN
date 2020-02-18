
clear
AorB = 'B';
PixelsFolders = strcat('..\SpringFeildCenters');

load(strcat(PixelsFolders,'\SortedSpringFeild',AorB,'U.mat'));
t1 = clock;
[C,MSE,Class_Idx_Best,AllPixels1ColSpringLabeluint,Centers_set,MSE_set,Toltal_iters] = Kmeans_function_alpha3(SortedAllPixels,3,1);
x = 1
save(strcat(PixelsFolders,'\SortedSpringFeild',AorB,'ULabel.mat'),'AllPixels1ColSpringLabeluint');

load(strcat(PixelsFolders,'\SortedSpringFeild',AorB,'UOrderBack.mat'));
AllPixels1ColSpringLabeluint = AllPixels1ColSpringLabeluint(SortedAllPixelsOrder);
t2 = clock;
Cluster_time = etime(t2,t1);
save(strcat(PixelsFolders,'\SpringFeildLabel',AorB,'U.mat'),'AllPixels1ColSpringLabeluint');
save(strcat(PixelsFolders,'\Centers',AorB,'.mat'),'C','MSE','Toltal_iters','Cluster_time');