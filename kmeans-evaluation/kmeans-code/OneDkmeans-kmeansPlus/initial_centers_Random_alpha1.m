function [Centers_Initial,Centers_Initial_idx] = initial_centers_Random_alpha1(SortedV,n_clusters)

RandomIndices = randsample(length(SortedV),n_clusters);
[Centers_Initial,Centers_InitialOrder] = sort(SortedV(RandomIndices));
Centers_Initial_idx = RandomIndices(Centers_InitialOrder);
Centers_Initial = double(Centers_Initial);



