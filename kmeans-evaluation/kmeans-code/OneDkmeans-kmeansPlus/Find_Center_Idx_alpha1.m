function Centers_Idx = Find_Center_Idx_alpha1(SortedAllPixels,Centers)

n_clusters = length(Centers);
Centers_Idx = zeros(n_clusters,1);
for i = 1:n_clusters
    Centers_Idx(i) = find(SortedAllPixels>= Centers(i),1,'first');
end

