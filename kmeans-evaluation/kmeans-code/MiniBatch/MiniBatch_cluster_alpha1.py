import scipy.io as sio
import time
import numpy as np
from sklearn.cluster import MiniBatchKMeans
batch_size = 100
Clusters = [2, 3, 4, 5, 6]
#Number = 100
#PixelPath = '/media/leon/1ab05bd6-806c-490d-bcbd-6e517d3f42f1/leon/Work/Code/Dataset/Kmeans/New/'
PixelPath = '../../Dataset/Kmeans/New/'
CurrentJ = sio.loadmat(PixelPath+'SampledImagesNew_100.mat')
CurrentJset = CurrentJ['CurrentJset']
del CurrentJ


SampleN = 10
RandomN = 10

for n in Clusters:
    MBK = MiniBatchKMeans(init='k-means++', n_clusters=n, batch_size=batch_size, n_init=10, max_no_improvement=10,
                          verbose=0)
    CenterSetMini = np.zeros([RandomN, SampleN, n], dtype=np.float)
    TimeSetMini = np.zeros([RandomN, SampleN], dtype=np.float)
    for Sample in range(0, SampleN):
        CurrentJsetS = CurrentJset[:, Sample].astype(np.float)
        CurrentJsetS = CurrentJsetS.reshape(-1, 1)

        for Random in range(0, RandomN):
            startTime = time.time()
            MBK.partial_fit(CurrentJsetS)
            endTime = time.time()
            TimeSetMini[Random, Sample] = endTime - startTime
            CenterSetMini[Random, Sample, :] = MBK.cluster_centers_.reshape((1, 1, n))
            print('Cluster =', n, 'Sample =', Sample, 'Random =', Random, 'Time =', TimeSetMini[Random, Sample])
    sio.savemat('MiniBatch_' + str(n) + '_100.mat', {'CenterSetMini': CenterSetMini, 'TimeSetMini': TimeSetMini})











