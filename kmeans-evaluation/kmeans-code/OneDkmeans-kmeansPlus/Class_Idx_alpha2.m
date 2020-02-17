function Class_Idx = Class_Idx_alpha2(SortedAllPixels,Centers,Centers_idx)

n_clusters = length(Centers);
Class_Idx = zeros(n_clusters,2);

for i = 1:n_clusters-1
    CurrentDis = abs(double(SortedAllPixels(Centers_idx(i):Centers_idx(i+1))) - Centers(i));
    CurrentDis(:,2) = abs(double(SortedAllPixels(Centers_idx(i):Centers_idx(i+1))) - Centers(i+1));
    [~,CurrentIdx] = min(CurrentDis,[],2);
    CurrentIdx = uint8(CurrentIdx(:,1));
    
    ClassLeftNum = sum(CurrentIdx==1);
    if i == 1
        Class_Idx(i,1) = 1;
%     else
%         Class_Idx(i,1) = Centers_idx(i-1)+ClassLeftNum;
    end
    Class_Idx(i,2) = Centers_idx(i)+ClassLeftNum-1;
    Class_Idx(i+1,1) = Centers_idx(i)+ClassLeftNum;
    if i == n_clusters-1
        Class_Idx(i+1,2) = length(SortedAllPixels);
%     else
%         %Class_Idx(i,2) = Centers_idx(i)+ClassLeftNum-1;
%         Class_Idx(i+1,1) = Centers_idx(i)+ClassLeftNum;
    end
    x = 1;
%     ClassLeftNumLast = ClassLeftNum;
end

% Dis1 = abs(double(SortedAllPixels(Centers_idx(1):Centers_idx(2))) - Centers(1));
% Dis1(:,2) = abs(double(SortedAllPixels(Centers_idx(1):Centers_idx(2))) - Centers(2));
% 
% Dis2 = abs(double(SortedAllPixels(Centers_idx(2):Centers_idx(3))) - Centers(2));
% Dis2(:,2) = abs(double(SortedAllPixels(Centers_idx(2):Centers_idx(3))) - Centers(3));
% 
% [~,Idx1] = min(Dis1,[],2);
% Idx1 = uint8(Idx1(:,1));
% [~,Idx2] = min(Dis2,[],2);
% Idx2 = uint8(Idx2(:,1));
% 
% Class1LeftNum = sum(Idx1==1);
% Class1_Idx = [1,Centers_idx(1)+Class1LeftNum-1];
% 
% Class2LeftNum = sum(Idx2==1);
% Class2_Idx = [Centers_idx(1)+Class1LeftNum,Centers_idx(2)+Class2LeftNum-1];
% Class3_Idx = [Centers_idx(2)+Class2LeftNum,length(SortedAllPixels)];
% 
% Class_Idx = [Class1_Idx;Class2_Idx;Class3_Idx];