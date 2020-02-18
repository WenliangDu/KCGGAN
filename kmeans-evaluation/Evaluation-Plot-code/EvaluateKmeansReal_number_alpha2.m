clear

loadDataName = '..\datasets\kmeans\Sampled\New';
loadResultsName = '..\kmeans-results';

SampleN = 10;
RanN = 10;

Number = [500 1000 1500 2000];
%Number = 100;
NumberN = length(Number);

MSEPlus = zeros(SampleN,RanN,NumberN);
MSEMini = zeros(SampleN,RanN,NumberN);
MSECk = zeros(SampleN,NumberN);

MSEMaxMin1D = zeros(3,NumberN);
MSEMaxMinThreshold = zeros(3,NumberN);
MSEMaxMinPlus = zeros(3,NumberN);
MSEMaxMinMini = zeros(3,NumberN);
MSEMaxMinCk = zeros(3,NumberN);

TimeMaxMin1D = zeros(3,NumberN);
TimeMaxMinThreshold = zeros(3,NumberN);
TimeMaxMinPlus = zeros(3,NumberN);
TimeMaxMinMini = zeros(3,NumberN);
TimeMaxMinCk = zeros(3,NumberN);

for n = 1:NumberN
    n   
    %% Plus, Ckmeans, MiniBatch
    load(strcat(loadResultsName,'\Plus\Plus_',num2str(Number(n)),'.mat'));
    load(strcat(loadResultsName,'\Ckmeans\Ckmeans_',num2str(Number(n)),'.mat'));
    load(strcat(loadResultsName,'\MiniBatch\MiniBatch_',num2str(Number(n)),'.mat'));
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
    load(strcat(loadDataName,'\SampledImagesNew_',num2str(Number(n)),'.mat'));
    CenterSetPlus = sort(CenterSetPlus,3);
    CenterSetMini = sort(CenterSetMini,3);
    for s = 1:SampleN
        s
        for r = 1:RanN
            %% Plus
            r
            CurrentC = reshape(CenterSetPlus(r,s,:), [1 3]);
            Currentidx = Calculate_Idx_alpha1(CurrentJset(:,s),CurrentC);
            [~, MSEPlus(s,r,n)] = CalculateSSM_MSE_alpha1(CurrentJset(:,s),Currentidx,CurrentC);
            
            %% Mini
            CurrentC = reshape(CenterSetMini(r,s,:), [1 3]);
            Currentidx = Calculate_Idx_alpha1(CurrentJset(:,s),CurrentC);
            [~, MSEMini(s,r,n)] = CalculateSSM_MSE_alpha1(CurrentJset(:,s),Currentidx,CurrentC);

        end
        
        CurrentC = sort(CenterSetCk(:,s));
        Currentidx = Calculate_Idx_alpha1(CurrentJset(:,s),CurrentC);
        [~, MSECk(s,n)] = CalculateSSM_MSE_alpha1(CurrentJset(:,s),Currentidx,CurrentC);
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
    load(strcat(loadResultsName,'\Kmeans1D\Kmeans1D_',num2str(Number(n)),'.mat'));
    TimeMaxMin1D(1,n) = max(TimeSet1D);
    TimeMaxMin1D(2,n) = min(TimeSet1D);
    TimeMaxMin1D(3,n) = mean(TimeSet1D);
    
    MSEMaxMin1D(1,n) = max(MSE1D);
    MSEMaxMin1D(2,n) = min(MSE1D);
    MSEMaxMin1D(3,n) = mean(MSE1D);
    
    %% Threshold / Otsu
    load(strcat(loadResultsName,'\Threshold\KmeansThreshold_',num2str(Number(n)),'.mat'));
    
    TimeMaxMinThreshold(1,n) = max(TimeSetThreshold);
    TimeMaxMinThreshold(2,n) = min(TimeSetThreshold);
    TimeMaxMinThreshold(3,n) = mean(TimeSetThreshold);
    
    MSEMaxMinThreshold(1,n) = max(MSEThreshold);
    MSEMaxMinThreshold(2,n) = min(MSEThreshold);
    MSEMaxMinThreshold(3,n) = mean(MSEThreshold);

end

% save(strcat(loadResultsName,'\Plus\Plus_numbers_Results.mat'),'MSEPlus','MSEMaxMinPlus','TimeMaxMinPlus');
% save(strcat(loadResultsName,'\Plus\Plus_numbers_Results.mat'),'MSEPlus','MSEMaxMinPlus','TimeMaxMinPlus');
% save(strcat(loadResultsName,'\Ckmeans\Ck_numbers_Results.mat'),'MSECk','MSEMaxMinCk','TimeMaxMinCk');
% save(strcat(loadResultsName,'\MiniBatch\MiniBatch_numbers_Results.mat'),'MSEMini','MSEMaxMinMini','TimeMaxMinMini');

