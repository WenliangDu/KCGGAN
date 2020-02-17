import scipy.io as sio
import time
import numpy as np
from sklearn.cluster import MiniBatchKMeans
batch_size = 100
Clusters = 3
#Number = 100
#PixelPath = '/media/leon/1ab05bd6-806c-490d-bcbd-6e517d3f42f1/leon/Work/Code/Dataset/Kmeans/New/'
PixelPath = '../../Dataset/Kmeans/New/'
CurrentJ = sio.loadmat(PixelPath+'SampledImagesNew_6000.mat')
CurrentJset = CurrentJ['CurrentJset']
del CurrentJ
MBK = MiniBatchKMeans(init='k-means++', n_clusters=3, batch_size=batch_size, n_init=10, max_no_improvement=10,
                          verbose=0)

CurrentJsetS = CurrentJset[:, 0].astype(np.float)
CurrentJsetS = CurrentJsetS.reshape(-1, 1)

startTime = time.time()
MBK.partial_fit(CurrentJsetS)
endTime = time.time()
TimeSetMini = endTime - startTime
print(TimeSetMini)













