function Currentidx = Calculate_Idx_alpha2(CurrentJ,CurrentC)
%%
% For cluster number

%%
% CurrentC2 = CurrentC;
% 
% ClusterNum = length(CurrentC);
% Currentidx = uint8(zeros(length(CurrentJ),1));
% CurrentC = repmat(CurrentC, [length(CurrentJ) 1]);
% 
% CurrentJ = single(repmat(CurrentJ,[1 ClusterNum]));
% 
% Diff = abs(CurrentJ - CurrentC);
% A = find((Diff(:,1) - Diff(:,2))>=0, 1);
% B = find((Diff(:,2) - Diff(:,3))>=0, 1);
% 
% Currentidx(1:A-1) = 1;
% Currentidx(A:B-1) = 2;
% Currentidx(B:end) = 3;
CurrentJ = double(CurrentJ);
CurrentC = double(CurrentC);

CurrentJN = length(CurrentJ);
CenterIdx = uint8(1);
Currentidx = uint8(zeros(CurrentJN,1));
CurrentCN = uint8(length(CurrentC));
for i = 1:CurrentJN
    
    if abs(CurrentJ(i) - CurrentC(CenterIdx)) < abs(CurrentJ(i) - CurrentC(CenterIdx + 1))
        Currentidx(i) = CenterIdx;
    else        
        Currentidx(i) = CenterIdx + 1;
        CenterIdx = CenterIdx + 1;
    end
    
    if CenterIdx == CurrentCN
        Currentidx(i+1:end) = CenterIdx;
        break
    end
end





