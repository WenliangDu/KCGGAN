function Centers_Set = KmeanTree_alpha1(SortedArray,CenterNum_Left,CenterNum_Right,Centers_Set)

CurrentMean = mean(SortedArray);
if CenterNum_Right == CenterNum_Left
    Centers_Set(CenterNum_Left) = CurrentMean;
    return
end

CentersNum = CenterNum_Right - CenterNum_Left + 1;
if mod(CentersNum,2) ~= 0
    Current_Center_Num = CenterNum_Left + floor(CentersNum/2);
    Centers_Set(Current_Center_Num) = CurrentMean;
end

Edge_Mean = find(SortedArray >= CurrentMean,1,'first');

Left_SortedArray = SortedArray(1:Edge_Mean);
Right_SortedArray = SortedArray(Edge_Mean:end);


%% For left
NextCenterNum_Left = CenterNum_Left;
NextCenterNum_Right = CenterNum_Left + floor(CentersNum/2) - 1;
Centers_Set = KmeanTree_alpha1(Left_SortedArray,NextCenterNum_Left,NextCenterNum_Right,Centers_Set);

%% For right
NextCenterNum_Left = CenterNum_Right - floor(CentersNum/2) + 1;
NextCenterNum_Right = CenterNum_Right;
Centers_Set = KmeanTree_alpha1(Right_SortedArray,NextCenterNum_Left,NextCenterNum_Right,Centers_Set);
