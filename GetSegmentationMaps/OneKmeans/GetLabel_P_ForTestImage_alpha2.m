
clear
AorB = 'A';
    
Foldername = strcat('..\Datasets\SEN12SpringFeild\test_',AorB,'');
FoldernameDir = strcat('..\\Datasets\\SEN12SpringFeild\\test_',AorB,'');

Folders = dir(FoldernameDir);
ToltalImageN = length(Folders);
load('..\Datasets\SEN12SpringFeild\train_seg_',AorB,'\Centers.mat');

SaveFoldername = strcat('..\Datasets\SEN12SpringFeild\test_seg_',AorB,'');


Centers_map = cell(1,3);

Centers = C;
ImageSize = [256 256];

Centers_map{1,1} = zeros(ImageSize);
Centers_map{1,2} = zeros(ImageSize);
Centers_map{1,3} = zeros(ImageSize);

Centers_map{1,1}(:,:) = Centers(1);
Centers_map{1,2}(:,:) = Centers(2);
Centers_map{1,3}(:,:) = Centers(3);


for i=3:ToltalImageN
    I1real = double(imread( strcat(Foldername,'\',Folders(i).name) ));

    diff1 = abs(I1real - Centers_map{1,1});
    diff2 = abs(I1real - Centers_map{1,2});
    diff3 = abs(I1real - Centers_map{1,3});

    
    mask1 = ((diff1 - diff2) < 0) & ((diff1 - diff3) < 0);
    mask2 = ((diff2 - diff1) < 0) & ((diff2 - diff3) < 0);
    mask3 = ~(mask1|mask2);
    
    Seg_map = zeros(256,256);
    Seg_map(mask1) = 1;
    Seg_map(mask2) = 2;
    Seg_map(mask3) = 3;
    Seg_map = uint8(Seg_map);
    
    imwrite(Seg_map,strcat(SaveFoldername,'\',Folders(i).name),'png');
end
save(strcat(SaveFoldername,'\Centers.mat'),'C');

