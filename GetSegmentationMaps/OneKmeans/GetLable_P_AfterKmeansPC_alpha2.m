AorB = 'A';

PixelsFolders = strcat('..\SpringFeildCenters');
FolderNameAll = strcat('..\..\Datasets\SEN12Feild');
FolderNameAllS = strcat('..\\..\\Datasets\\SEN12Feild');

load(strcat(PixelsFolders,'\SpringFeildLabel',AorB,'U.mat'));
Foldername = strcat(FolderNameAll,'\train_',AorB,'');
FoldernameDir = strcat(FolderNameAllS,'\\train_',AorB,'');
Folders = dir(FoldernameDir);
ToltalImageN = length(Folders);
ImageSize = [256 256];

idx = uint8(reshape(AllPixels1ColSpringLabeluint,[ImageSize(1)*ImageSize(2) (ToltalImageN-2)]));
SaveFoldername = strcat(FolderNameAll,'\train_seg_',AorB,'');

h=waitbar(0,'Gegerate segmentation maps');
for i=3:ToltalImageN
    t1 = clock;
    Label = reshape(idx(:,i-2),ImageSize);
    imwrite(Label,strcat(SaveFoldername,'/',Folders(i).name),'png');
    
    t2 = clock;
    %% for waitbar
    tloop = etime(t2,t1);
    trestH = floor(tloop*(ToltalImageN-i-3)/3600);
    trestM = floor((tloop*(ToltalImageN-i-3) - trestH*3600)/60);
    trestS = tloop*(ToltalImageN-i-3) - trestH*3600 - trestM*60;
    
    Percentage = floor(((i/(ToltalImageN-3))*10000))/100;
    str=['Generating...',num2str(Percentage),'%....',num2str(i),'.......',num2str(trestH),':',num2str(trestM),':',num2str(trestS),''];
    waitbar(i/(ToltalImageN-i-3),h,str);
end

load(strcat(PixelsFolders,'\CentersFeild',AorB,'.mat'))
save(strcat(SaveFoldername,'\Centers.mat'),'C','MSE','Toltal_iters','Cluster_time');

close(h);