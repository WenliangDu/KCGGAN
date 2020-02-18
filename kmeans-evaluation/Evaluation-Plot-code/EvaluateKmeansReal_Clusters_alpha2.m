clear

loadDataName = '..\datasets\kmeans\Sampled\New';
loadResultsName = '..\kmeans-results';
load(strcat(loadDataName,'\SampledImagesNew_100.mat'));

SampleN = 10;
RanN = 10;

% Number = [500 1000 1500 2000];
Number = 100;
Clusters = 2:6;
%Number = 100;
ClustersN = length(Clusters);

MSE1D = zeros(SampleN,ClustersN);
MSEPlus = zeros(SampleN,RanN,ClustersN);
MSEMini = zeros(SampleN,RanN,ClustersN);
MSECk = zeros(SampleN,ClustersN);

MSEMaxMin1D = zeros(3,ClustersN);
MSEMaxMinPlus = zeros(3,ClustersN);
MSEMaxMinMini = zeros(3,ClustersN);
MSEMaxMinCk = zeros(3,ClustersN);
MSEMaxMinThreshold = zeros(3,ClustersN);

TimeMaxMin1D = zeros(3,ClustersN);
TimeMaxMinPlus = zeros(3,ClustersN);
TimeMaxMinMini = zeros(3,ClustersN);
TimeMaxMinCk = zeros(3,ClustersN);
TimeMaxMinThreshold = zeros(3,ClustersN);

for n = Clusters
    n
    
%     x = 1;
    %% Plus, Ckmeans, MiniBatch
    load(strcat(loadResultsName,'\Plus\Plus_',num2str(n),'_100.mat'));
    load(strcat(loadResultsName,'\Ckmeans\Ckmeans_',num2str(n),'_100.mat'));
    load(strcat(loadResultsName,'\MiniBatch\MiniBatch_',num2str(n),'_100.mat'));
    
    %% Time
    TimeMaxMinPlus(1,n) = max(TimeSetPlus(:));
    TimeMaxMinPlus(2,n) = min(TimeSetPlus(:));
    TimeMaxMinPlus(3,n) = mean(TimeSetPlus(:));

    TimeMaxMinCk(1,n) = max(TimeSetCk(:));
    TimeMaxMinCk(2,n) = min(TimeSetCk(:));
    TimeMaxMinCk(3,n) = mean(TimeSetCk(:));
    
    TimeMaxMinMini(1,n) = max(TimeSetMini(:));
    TimeMaxMinMini(2,n) = min(TimeSetMini(:));
    TimeMaxMinMini(3,n) = mean(TimeSetMini(:));
    

    %% MSE 
    CenterSetPlus = sort(CenterSetPlus,3);
    CenterSetMini = sort(CenterSetMini,3);
    for s = 1:SampleN
        s
        for r = 1:RanN
            %% Plus
            r
            CurrentC = reshape(CenterSetPlus(r,s,:), [1 n]);
            Currentidx = Calculate_Idx_alpha2(CurrentJset(:,s),CurrentC);
            [~, MSEPlus(s,r,n)] = CalculateSSM_MSE_alpha1(CurrentJset(:,s),Currentidx,CurrentC);
            
            %% Mini
            CurrentC = reshape(CenterSetMini(r,s,:), [1 n]);
            Currentidx = Calculate_Idx_alpha2(CurrentJset(:,s),CurrentC);
            [~, MSEMini(s,r,n)] = CalculateSSM_MSE_alpha1(CurrentJset(:,s),Currentidx,CurrentC);

        end
        CurrentC = sort(CenterSetCk(:,s));
        Currentidx = Calculate_Idx_alpha2(CurrentJset(:,s),CurrentC);
        [~, MSECk(s,n)] = CalculateSSM_MSE_alpha1(CurrentJset(:,s),Currentidx,CurrentC);
        x = 1;
    end
    MSEMaxMinPlus(1,n) = max(max(MSEPlus(:,:,n)));
    MSEMaxMinPlus(2,n) = min(min(MSEPlus(:,:,n)));
    MSEMaxMinPlus(3,n) = mean(mean(MSEPlus(:,:,n)));
    
    MSEMaxMinCk(1,n) = max(MSECk(:,n));
    MSEMaxMinCk(2,n) = min(MSECk(:,n));
    MSEMaxMinCk(3,n) = mean(MSECk(:,n));
    
    MSEMaxMinMini(1,n) = max(max(MSEMini(:,:,n)));
    MSEMaxMinMini(2,n) = min(min(MSEMini(:,:,n)));
    MSEMaxMinMini(3,n) = mean(mean(MSEMini(:,:,n)));
    
    %% 1D
    load(strcat(loadResultsName,'\Kmeans1D\Kmeans1D_',num2str(n),'_100.mat'));
    TimeMaxMin1D(1,n) = max(TimeSet1D);
    TimeMaxMin1D(2,n) = min(TimeSet1D);
    TimeMaxMin1D(3,n) = mean(TimeSet1D);
    
    MSEMaxMin1D(1,n) = max(MSE1D);
    MSEMaxMin1D(2,n) = min(MSE1D);
    MSEMaxMin1D(3,n) = mean(MSE1D);
    
    %% Threshold / Otsu
    load(strcat(loadResultsName,'\Threshold\KmeansThreshold_',num2str(n),'_100.mat'));
    
    TimeMaxMinThreshold(1,n) = max(TimeSetThreshold);
    TimeMaxMinThreshold(2,n) = min(TimeSetThreshold);
    TimeMaxMinThreshold(3,n) = mean(TimeSetThreshold);
    
    MSEMaxMinThreshold(1,n) = max(MSEThreshold);
    MSEMaxMinThreshold(2,n) = min(MSEThreshold);
    MSEMaxMinThreshold(3,n) = mean(MSEThreshold);

end

save(strcat(loadResultsName,'\Kmeans1D\Kmeans1D_Cluster_Results.mat'),'MSEMaxMin1D','TimeMaxMin1D');
save(strcat(loadResultsName,'\Threshold\KmeansThreshold_Cluster_Results.mat'),'MSEMaxMinThreshold','TimeMaxMinThreshold');
save(strcat(loadResultsName,'\Plus\Plus_Cluster_Results.mat'),'MSEPlus','MSEMaxMinPlus','TimeMaxMinPlus');
save(strcat(loadResultsName,'\Ckmeans\Ck_Cluster_Results.mat'),'MSECk','MSEMaxMinCk','TimeMaxMinCk');
save(strcat(loadResultsName,'\MiniBatch\MiniBatch_Cluster_Results.mat'),'MSEMini','MSEMaxMinMini','TimeMaxMinMini');

