
clear
AorB = 'A';

Foldername = strcat('..\Datasets\SEN12SpringFeild\train_',AorB,'');
FoldernameDir = strcat('..\\Datasets\\SEN12SpringFeild\\train_',AorB,'');

Folders = dir(FoldernameDir);
ToltalImageN = length(Folders);
%ToltalImageN = 10;
%%
ImageSize = [256 256];
AllPixels = double(zeros([ImageSize(1)*ImageSize(2) (ToltalImageN-2)]));
% WaitMessage = parfor_wait((ToltalImageN-3), 'Waitbar', true);
parfor i=3:ToltalImageN
    I1 = imread( strcat(Foldername,'\',Folders(i).name) );
    AllPixels(:,i-2) = reshape(I1,[ImageSize(1)*ImageSize(2) 1]);
%     WaitMessage.Send;
end
x = 1
%%
SaveFoldername = strcat('..\SpringFeildCenters');
AllPixels1Col = reshape(AllPixels,[ImageSize(1)*ImageSize(2)*(ToltalImageN-2) 1]);
% [idx1Col,C] = kmeans(AllPixels1Col,3,'OnlinePhase','on');
% AllPixels1Col = [];
% idx = uint8(reshape(idx1Col,[ImageSize(1)*ImageSize(2) (ToltalImageN-2)]));
save(strcat(SaveFoldername,'\SpringFeild',AorB,'U.mat'),'AllPixels1Col');
[SortedAllPixels,SortedAllPixelsOrderIni] = sort(AllPixels1Col);
SortedAllPixels = uint8(SortedAllPixels);
save(strcat(SaveFoldername,'\SortedSpringFeild',AorB,'U.mat'),'SortedAllPixels');
SortedAllPixels = [];
x = 2
% SortedAllPixelsOrderIni = uint32(SortedAllPixelsOrderIni);
[~,SortedAllPixelsOrder] = sort(SortedAllPixelsOrderIni);
SortedAllPixelsOrder = uint32(SortedAllPixelsOrder);
save(strcat(SaveFoldername,'\SortedSpringFeild',AorB,'UOrderBack.mat'),'SortedAllPixelsOrder');
% for i=3:ToltalImageN
%     Label = reshape(idx(:,i-2),ImageSize);
%     imwrite(Label,strcat(SaveFoldername,'/',Folders(i).name),'png');
% end
% WaitMessage.Destroy

