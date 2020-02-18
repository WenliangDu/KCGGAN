function Currentidx = Calculate_Idx_alpha1(CurrentJ,CurrentC)
Currentidx = uint8(zeros(length(CurrentJ),1));

CurrentC = reshape(CurrentC, [1 3]);
CurrentC = repmat(CurrentC, [length(CurrentJ) 1]);

CurrentJ = single(repmat(CurrentJ,[1 3]));

Diff = abs(CurrentJ - CurrentC);
A = find((Diff(:,1) - Diff(:,2))>=0, 1);
B = find((Diff(:,2) - Diff(:,3))>=0, 1);

Currentidx(1:A-1) = 1;
Currentidx(A:B-1) = 2;
Currentidx(B-1:end) = 3;



