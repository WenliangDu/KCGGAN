import scipy.io as sio
import time
import numpy as np
from sklearn.cluster import MiniBatchKMeans
batch_size = 100
Number = [500, 1000, 1500, 2000]
#Number = 100
#PixelPath = '/media/leon/1ab05bd6-806c-490d-bcbd-6e517d3f42f1/leon/Work/Code/Dataset/Kmeans/New/'
PixelPath = '../../Dataset/Kmeans/New/'
MBK = MiniBatchKMeans(init='k-means++', n_clusters=3, batch_size=batch_size, n_init=10, max_no_improvement=10,
                           verbose=0)
SampleN = 10
RandomN = 10
ClusterN = 3
CenterSetMini = np.zeros([RandomN, SampleN, ClusterN], dtype=np.float)
TimeSetMini = np.zeros([RandomN, SampleN], dtype=np.float)
for n in Number:
    CurrentJ = sio.loadmat(PixelPath+'SampledImagesNew_'+str(n)+'.mat')
    CurrentJset = CurrentJ['CurrentJset']
    del CurrentJ
    for Sample in range(0, SampleN):
        CurrentJsetS = CurrentJset[:, Sample].astype(np.float)
        CurrentJsetS = CurrentJsetS.reshape(-1, 1)
        for Random in range(0, RandomN):
            startTime = time.time()
            MBK.partial_fit(CurrentJsetS)
            endTime = time.time()
            TimeSetMini[Random, Sample] = endTime - startTime
            CenterSetMini[Random, Sample, :] = MBK.cluster_centers_.reshape((1, 1, 3))
            print('Number =', n, 'Sample =', Sample, 'Random =', Random, 'Time =', TimeSetMini[Random, Sample])
    sio.savemat('MiniBatch_' + str(n) + '.mat', {'CenterSetMini': CenterSetMini, 'TimeSetMini': TimeSetMini})











