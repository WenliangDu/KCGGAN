clear

loadDataName = '..\..\datasets\kmeans\Sampled\New';
loadResultsName = '..\..\datasets\kmeans\results\New';
saveName = '..\..\datasets\kmeans\results\PCHome';

SampleN = 10;
RanN = 10;
% Number = [4000 6000 8000];
Number = [100 500 1000 1500 2000];
% Number = 7000;
NumberN = length(Number);

CenterSetPlus = zeros(SampleN,RanN,3);
TimeSetPlus = zeros(SampleN,RanN);
CenterSet1D = zeros(3,SampleN);
TimeSet1D = zeros(1,SampleN);
MSE1D = zeros(1,SampleN);
CenterSetThreshold = zeros(3,SampleN);
TimeSetThreshold = zeros(1,SampleN);
MSEThreshold = zeros(1,SampleN);

%
%% Numbers
for n = 1:NumberN
    n
    load(strcat(loadDataName,'\SampledImagesNew_',num2str(Number(n)),'.mat'));
    %% 1D
    
    for i = 1:SampleN
        i
        t1 = clock;
        [CenterSet1D(:,i),MSE1D(i),~,~,~,~,~] = Kmeans_function_alpha4(CurrentJset(:,i),3,1);
        t2 = clock;
        TimeSet1D(i) = etime(t2,t1);
    end
%     save(strcat(saveName,'\Kmeans1D\Kmeans1D_',num2str(Number(n)),'.mat'),'CenterSet1D','TimeSet1D','MSE1D');
    %% Threold \ Otsu
    for i = 1:SampleN
        i
        t1 = clock;
        [CenterSetThreshold(:,i),MSEThreshold(i),~,~,~,~,~] = Kmeans_function_alpha4(CurrentJset(:,i),3,2);
        t2 = clock;
        TimeSetThreshold(i) = etime(t2,t1);
    end
%     save(strcat(saveName,'\Threshold\KmeansThreshold_',num2str(Number(n)),'.mat'),'CenterSetThreshold','TimeSetThreshold','MSEThreshold');
    
    %% plus
    for i = 1:SampleN
        i
        for r = 1:RanN
            r
            t1 = clock;
            [~,CenterSetPlus(i,r,:)] = kmeans(double(CurrentJset(:,i)),3,'Start','plus');
            t2 = clock;
            TimeSetPlus(i,r) = etime(t2,t1);
        end
    end
%     save(strcat(saveName,'\Plus\Plus_',num2str(Number(n)),'.mat'),'CenterSetPlus','TimeSetPlus');
end
%}

%% Cluster Numbers
ClusterNumber = 3:6;
load(strcat(loadDataName,'\SampledImagesNew_100.mat'));
TimeSetPlus = zeros(SampleN,RanN);
TimeSet1D = zeros(1,SampleN);
MSE1D = zeros(1,SampleN);
TimeSetThreshold = zeros(1,SampleN);
MSEThreshold = zeros(1,SampleN);
for k = ClusterNumber
    k
    
    %% 1D
    CenterSet1D = zeros(k,SampleN); 
    for i = 1:SampleN
        i
        t1 = clock;
        [CenterSet1D(:,i),MSE1D(i),~,~,~,~,~] = Kmeans_function_alpha4(CurrentJset(:,i),k,1);
        t2 = clock;
        TimeSet1D(i) = etime(t2,t1);
    end
%     save(strcat(saveName,'\Kmeans1D\Kmeans1D_',num2str(k),'_100.mat'),'CenterSet1D','TimeSet1D','MSE1D');
    
    %% Threold \ Otsu    
    CenterSetThreshold = zeros(k,SampleN);
    for i = 1:SampleN
        i
        t1 = clock;
        [CenterSetThreshold(:,i),MSEThreshold(i),~,~,~,~,~] = Kmeans_function_alpha4(CurrentJset(:,i),k,2);
        t2 = clock;
        TimeSetThreshold(i) = etime(t2,t1);
    end
%     save(strcat(saveName,'\Threshold\KmeansThreshold_',num2str(k),'_100.mat'),'CenterSetThreshold','TimeSetThreshold','MSEThreshold');
    
    %% plus
    CenterSetPlus = zeros(SampleN,RanN,k);
    for i = 1:SampleN
        i
        for r = 1:RanN
            r
            t1 = clock;
            [~,CenterSetPlus(i,r,:)] = kmeans(double(CurrentJset(:,i)),k,'Start','plus');
            t2 = clock;
            TimeSetPlus(i,r) = etime(t2,t1);
        end
    end
%     save(strcat(saveName,'\Plus\Plus_',num2str(k),'_100.mat'),'CenterSetPlus','TimeSetPlus');
end


