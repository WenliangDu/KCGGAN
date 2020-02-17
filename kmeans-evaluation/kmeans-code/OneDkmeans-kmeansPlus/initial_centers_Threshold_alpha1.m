function [Centers_Initial,Centers_Initial_idx] = initial_centers_Threshold_alpha1(SortedV,n_clusters)

Threshold = multithresh(SortedV,n_clusters-1);
Centers_Initial = zeros(n_clusters,1);
Centers_Initial_idx = zeros(n_clusters,1);
Label_Initial_idx = zeros(n_clusters-1,1);
%% Get
for i = 1:n_clusters-1
    Label_Initial_idx(i) = find(SortedV>=Threshold(i),1,'first')-1;
    if i == 1
        Centers_Initial(i) = mean(SortedV(1:Label_Initial_idx(i)));
%         x = 1;
    elseif i==n_clusters-1
        Centers_Initial(i) = mean(SortedV(Label_Initial_idx(i-1)+1:Label_Initial_idx(i)));
        Centers_Initial(i+1) = mean(SortedV(Label_Initial_idx(i)+1:end));
%         x = 1;
    else
        Centers_Initial(i) = mean(SortedV(Label_Initial_idx(i-1)+1:Label_Initial_idx(i)));
%         x = 1;
    end
end

for i = 1:n_clusters
    Centers_Initial_idx(i) = find(SortedV>=Centers_Initial(i),1,'first');
end

