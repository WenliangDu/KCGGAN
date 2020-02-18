function [Centers_Best,MSE_Best,Class_Idx_Best,idx_Best,Centers_set,MSE_set,Current_iters] = Kmeans_function_alpha3(SortedAllPixels,n_clusters,initial_method)


% n_clusters = 3;
Max_iters = 50;
Current_iters = 0;
KeepCalculate = true(1,1);
if initial_method == 1
    [Centers_Initial,Centers_Initial_idx] = initial_centers_KmeanTree_alpha1(SortedAllPixels,n_clusters);
%     [Centers_Initial2,Centers_Initial_idx2] = initial_centers_MeanMean_alpha1(SortedAllPixels,n_clusters);
else
    [Centers_Initial,Centers_Initial_idx] = initial_centers_Random_alpha1(SortedAllPixels,n_clusters);
end

Centers_Pre = Centers_Initial;
Centers_Pre_idx = Centers_Initial_idx;

Class_Idx_Pre = Class_Idx_alpha2(SortedAllPixels,Centers_Pre,Centers_Pre_idx);
[~,MSE_Pre] = CalculateSSM_MSE_Class_alpha1(SortedAllPixels,Class_Idx_Pre,Centers_Pre);
% SSM_Best = SSM_Pre;
MSE_Best = MSE_Pre;
Centers_Best = Centers_Pre;
Class_Idx_Best = Class_Idx_Pre;

Centers_set = zeros(n_clusters,Max_iters);
% SSM_set = zeros(1,Max_iters);
MSE_set = zeros(1,Max_iters);
% Centers_set(:,Current_iters) = Centers_Pre;
% SSM_set(Current_iters) = SSM_Pre;
% MSE_set(Current_iters) = MSE_Pre;

while KeepCalculate
    Centers_New = zeros(n_clusters,1);
    for i = 1:n_clusters
        Centers_New(i) = mean(double(SortedAllPixels(Class_Idx_Pre(i,1):Class_Idx_Pre(i,2))));
    end
    Centers_Idx_New = Find_Center_Idx_alpha1(SortedAllPixels,Centers_New);
%     Class_Idx_New = Class_Idx_alpha1(SortedAllPixels,Centers_New,Centers_Idx_New);
    Class_Idx_New = Class_Idx_alpha2(SortedAllPixels,Centers_New,Centers_Idx_New);
    
    [~,MSE_New] = CalculateSSM_MSE_Class_alpha1(SortedAllPixels,Class_Idx_New,Centers_New);
    
    CenterDiff = sum(abs(Centers_New-Centers_Pre));
    Current_iters = Current_iters + 1;
    Centers_set(:,Current_iters) = Centers_Pre;
%     SSM_set(Current_iters) = SSM_Pre;
    MSE_set(Current_iters) = MSE_Pre;
    
    if MSE_New < MSE_Best
%         SSM_Best = SSM_New;
        MSE_Best = MSE_New;
        Centers_Best = Centers_New;
        Class_Idx_Best = Class_Idx_New;
        %Class_Idx_New = Class_Idx_Pre;
    else
        KeepCalculate = false(1,1);
    end
%     SSM_Pre = SSM_New;
    MSE_Pre = MSE_New;
    Centers_Pre = Centers_New;
    Class_Idx_Pre = Class_Idx_New;
    
    if CenterDiff < 1
        KeepCalculate = false(1,1);
    end
    if Current_iters >= Max_iters
        KeepCalculate = false(1,1);
    end
end
idx_Best = uint8(zeros(size(SortedAllPixels)));
for i = 1:n_clusters
    idx_Best(Class_Idx_Best(i,1):Class_Idx_Best(i,2)) = i;    
end
x = 1;

