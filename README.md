# KCGGAN
Source codes of "K-Means Clustering Guided Generative Adversarial Networks for Automatic SAR-Optical Image Matching"

Training data sets: [SEN12Train](https://drive.google.com/open?id=1-CNyQDfP1FAo_KIbXD1PBO0GYqKaKhjo); 
Test data set: [SEN12Test](https://drive.google.com/open?id=1-bD4S3f7ugwBQkvJAbyHf9p6_-sVgElB).


## Getting Started
### Installation
- Install PyTorch and dependencies from http://pytorch.org
- Anaconda: conda env create -f KCGGAN.yml
- Activate the anaconda environment
- conda install pytorch
- conda install torchvision
- pip install dominate
- conda install pillow
- conda install scipy
- pip install visdom
- pip install sklearn

## Acknowledgments
This code borrows heavily from [pix2pixHD](https://github.com/WenliangDu/pix2pixHD) and [pytorch-CycleGAN-and-pix2pix](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix).
