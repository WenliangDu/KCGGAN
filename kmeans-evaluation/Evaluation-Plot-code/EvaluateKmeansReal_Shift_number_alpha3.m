clear
loadResultsName = '..\kmeans-results';

SampleN = 10;
RanN = 10;
ClusterNum = 3;
Number = [500 1000 1500 2000];
%Number = 100;
NumberN = length(Number);
CenterShiftPlus = zeros(1,NumberN);
CenterShiftMini = zeros(1,NumberN);

CenterShiftIdxPlus = zeros(1,NumberN);
CenterShiftIdxMini = zeros(1,NumberN);

CenterShiftAllPlus = zeros(SampleN,NumberN);
CenterShiftAllMini = zeros(SampleN,NumberN);

CentersMaxPlus = cell(SampleN,NumberN);
CentersMaxMini = cell(SampleN,NumberN);

for n = 1:NumberN
%     load(strcat(loadDataName,'\SampledImages_',num2str(Number(n)),'.mat'));
%     CurrentJ = CurrentJset(:,n);
    %% 1D
    load(strcat(loadResultsName,'\Plus\Plus_',num2str(Number(n)),'.mat'));
    load(strcat(loadResultsName,'\MiniBatch\MiniBatch_',num2str(Number(n)),'.mat'));
    
    for S = 1:SampleN
        CurrentCenterSetPlus = reshape(sort(CenterSetPlus(:,S,:),3),[RanN ClusterNum]);
        CurrentCenterSetMini = reshape(sort(CenterSetMini(:,S,:),3),[RanN ClusterNum]);
        
        CenterSetPlusU = unique(CurrentCenterSetPlus,'rows');
        CenterSetMiniU = unique(CurrentCenterSetMini,'rows');
        
        [CenterShiftAllPlus(S,n), CentersMaxPlus{S,n}] = GetCentersMax_alpha1(CenterSetPlusU);        
        [CenterShiftAllMini(S,n), CentersMaxMini{S,n}] = GetCentersMax_alpha1(CenterSetMiniU);
    end
    
    [CenterShiftPlus(1,n), CenterShiftIdxPlus(1,n)] = max(CenterShiftAllPlus(:,n));    
    [CenterShiftMini(1,n), CenterShiftIdxMini(1,n)] = max(CenterShiftAllMini(:,n)); 
    X = 1;
end

save(strcat(loadResultsName,'\Plus\Plus_Shift_Results.mat'),'CenterShiftPlus','CenterShiftAllPlus','CentersMaxPlus','CenterShiftIdxPlus');
save(strcat(loadResultsName,'\MiniBatch\MiniBatch_Shift_Results.mat'),'CenterShiftMini','CenterShiftAllMini','CentersMaxMini','CenterShiftIdxMini');
