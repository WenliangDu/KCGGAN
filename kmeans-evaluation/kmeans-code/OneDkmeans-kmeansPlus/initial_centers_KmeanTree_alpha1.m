function [Centers_Initial,Centers_Initial_idx] = initial_centers_KmeanTree_alpha1(SortedV,n_clusters)

Centers_Initial = zeros(n_clusters,1);
Centers_Initial_idx = zeros(n_clusters,1);
CenterNum_Left = 1;
CenterNum_Right = n_clusters;
Centers_Initial = KmeanTree_alpha1(SortedV,CenterNum_Left,CenterNum_Right,Centers_Initial);

for i = 1:n_clusters
    Centers_Initial_idx(i) = find(SortedV>=Centers_Initial(i),1,'first');
end

%Centers_Initial = zeros(n_clusters,1);
% if n_clusters ==3
%     KeyMean = mean(SortedV);
%     KeyMean_idx = find(SortedV>=KeyMean,1);
%     LeftMeanTemp = mean(SortedV(1:KeyMean_idx));
%     LeftMeanTemp_idx = find(SortedV>=LeftMeanTemp,1,'first');
% %     LeftMean = mean(SortedV(1:LeftMeanTemp_idx));
% %     LeftMean_idx = find(SortedV>=LeftMean,1,'first');
% 
%     RightMeanTemp = mean(SortedV(KeyMean_idx:end));
%     RightMeanTemp_idx = find(SortedV<=RightMeanTemp,1,'last');
% %     RightMean = mean(SortedV(RightMeanTemp_idx:end));
% %     RightMean_idx = find(SortedV<=RightMean,1,'last');
% end
% Centers_Initial = [LeftMeanTemp;KeyMean;RightMeanTemp];
% Centers_Initial_idx = [LeftMeanTemp_idx;KeyMean_idx;RightMeanTemp_idx];