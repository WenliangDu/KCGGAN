function [SSM,MSE] = CalculateSSM_MSE_Class_alpha1(SortedAllPixels,ClassIdx,Centers)


ClassNum = size(ClassIdx,1);
SSM_Sub = zeros(1,ClassNum);
for i = 1:ClassNum
    SSM_Sub(i) = sum(abs(double(SortedAllPixels(ClassIdx(i,1):ClassIdx(i,2))) - Centers(i)));
    x = 1;
end

SSM = sum(SSM_Sub);
MSE = SSM/length(SortedAllPixels);

