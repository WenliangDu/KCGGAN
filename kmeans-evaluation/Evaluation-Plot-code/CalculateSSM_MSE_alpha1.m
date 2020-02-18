function [SSM, MSE] = CalculateSSM_MSE_alpha1(X,idx,c)

% if max(X) > 1
%     X = X./255;
%     c = c./255;
% end

ClassNum = length(c);
SSM_Sub = zeros(1,ClassNum);
for i = 1:ClassNum
    CurrentX = double(X(idx == i));
    SSM_Sub(i) = sum(abs(CurrentX - c(i)));
    x = 1;
end

SSM = sum(SSM_Sub);
MSE = SSM/length(X);
