clear
loadResultsName = '..\kmeans-results';
SampleN = 10;
RanN = 10;
ClusterNum = 6;
Number = [100 500 1000 1500 2000];
%Number = 100;
NumberN = length(Number);
CenterShiftPlus = zeros(1,ClusterNum-1);
CenterShiftMini = zeros(1,ClusterNum-1);

CenterShiftIdxPlus = zeros(1,ClusterNum-1);
CenterShiftIdxMini = zeros(1,ClusterNum-1);

CenterShiftAllPlus = zeros(SampleN,ClusterNum-1);
CenterShiftAllMini = zeros(SampleN,ClusterNum-1);

CentersMaxPlus = cell(SampleN,ClusterNum-1);
CentersMaxMini = cell(SampleN,ClusterNum-1);


for k = 2:ClusterNum
%     load(strcat(loadDataName,'\SampledImages_',num2str(Number(n)),'.mat'));
%     CurrentJ = CurrentJset(:,n);
    %% 1D
    load(strcat(loadResultsName,'\Plus\Plus_',num2str(k),'_100.mat'));
    load(strcat(loadResultsName,'\Minibatch\MiniBatch_',num2str(k),'_100.mat'));
    for S = 1:SampleN
        CurrentCenterSetPlus = reshape(sort(CenterSetPlus(:,S,:),3),[RanN k]);
        CurrentCenterSetMini = reshape(sort(CenterSetMini(:,S,:),3),[RanN k]);
        
        CenterSetPlusU = unique(CurrentCenterSetPlus,'rows');
        CenterSetMiniU = unique(CurrentCenterSetMini,'rows');
        
        [CenterShiftAllPlus(S,k), CentersMaxPlus{S,k}] = GetCentersMax_alpha1(CenterSetPlusU);        
        [CenterShiftAllMini(S,k), CentersMaxMini{S,k}] = GetCentersMax_alpha1(CenterSetMiniU);
    end
    
    [CenterShiftPlus(1,k), CenterShiftIdxPlus(1,k)] = max(CenterShiftAllPlus(:,k));    
    [CenterShiftMini(1,k), CenterShiftIdxMini(1,k)] = max(CenterShiftAllMini(:,k)); 
    X = 1;
end

save(strcat(loadResultsName,'\Plus\Plus_Shift_Cluster_Results.mat'),'CenterShiftPlus','CenterShiftAllPlus','CentersMaxPlus','CenterShiftIdxPlus');
save(strcat(loadResultsName,'\MiniBatch\MiniBatch_Shift_Cluster_Results.mat'),'CenterShiftMini','CenterShiftAllMini','CentersMaxMini','CenterShiftIdxMini');