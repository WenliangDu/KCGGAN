AllPixels<-readMat("../../datasets/kmeans/Sampled/New/SampledImagesNew_100.mat")
CenterSetCk<-matrix(nr=3,nc=10)
TimeSetCk<-matrix(nr=1,nc=10)
AllPixels2<-AllPixels[[1]]
rm(AllPixels)
for (i in 1:10){
  CurrentPixels<-AllPixels2[,i]
  CurrentPixels<-as.double(CurrentPixels)
  ptm <- proc.time()
  result<-Ckmeans.1d.dp(CurrentPixels,3)
  CenterSetCk[,i]<-t(result[["centers"]])
  TempleTime<-proc.time() - ptm
  TimeSetCk[i]<-TempleTime
  print(i)
}
writeMat("../../datasets/kmeans/results/PCHome/Ckmeans/Ckmeans_100.mat",CenterSetCk=CenterSetCk,TimeSetCk=TimeSetCk)