# require Ckmeans.1d.dp, R.matlab, stringr packages
AllPixels<-readMat("C:/Users/Administrator/OneDrive/师资博士后/Code/PythonCodes/datasets/kmeans/Sampled/New/SampledImagesNew_100.mat")

AllPixels2<-AllPixels[[1]]
rm(AllPixels)
for (k in 2:6) {
  CenterSetCk<-matrix(nr=k,nc=10)
  TimeSetCk<-matrix(nr=1,nc=10)
  for (i in 1:10){
    CurrentPixels<-AllPixels2[,i]
    CurrentPixels<-as.double(CurrentPixels)
    ptm <- proc.time()
    result<-Ckmeans.1d.dp(CurrentPixels,k)
    CenterSetCk[,i]<-t(result[["centers"]])
    TempleTime<-proc.time() - ptm
    TimeSetCk[i]<-TempleTime
    print(i)
  }
  writeName<-str_glue("C:/Users/Administrator/OneDrive/师资博士后/Code/PythonCodes/datasets/kmeans/results/PCHome/Ckmeans/Ckmeans_{k}_100.mat")
  writeMat(writeName,CenterSetCk=CenterSetCk,TimeSetCk=TimeSetCk)
}
