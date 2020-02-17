AllPixels<-readMat("../../datasets/kmeans/Sampled/New0214/SampledImagesNew_6000.mat")
#CenterSetCk<-matrix(nr=3,nc=1)
#TimeSetCk<-matrix(nr=1,nc=1)
AllPixels2<-AllPixels[[1]]
rm(AllPixels)

CurrentPixels<-AllPixels2[,1]
CurrentPixels<-as.double(CurrentPixels)
ptm <- proc.time()
result<-Ckmeans.1d.dp(CurrentPixels,3)
CenterSetCk<-t(result[["centers"]])
TempleTime<-proc.time() - ptm
