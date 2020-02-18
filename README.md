# KCGGAN
Source codes of "K-Means Clustering Guided Generative Adversarial Networks for Automatic SAR-Optical Image Matching"



## Prerequisites
- Python 3
- Anaconda 3
- NVIDIA GPU + CUDA cuDNN

## Getting Started
### Installation
- Install PyTorch and dependencies from http://pytorch.org
- Anaconda: conda env create -f KCGGAN.yml
- Anaconda: conda activate pytorch-CycleGAN-and-pix2pix
- conda install pytorch
- conda install torchvision
- pip install dominate
- conda install pillow
- conda install scipy
- pip install visdom
- pip install sklearn

### Dataset
- Training data sets: [SEN12Train](https://drive.google.com/open?id=1-CNyQDfP1FAo_KIbXD1PBO0GYqKaKhjo); 
- Test data set: [SEN12Test](https://drive.google.com/open?id=1-bD4S3f7ugwBQkvJAbyHf9p6_-sVgElB).

### Training
- The KCG-GAN has four main losses: GAN, feautre matching, L1 and segmentation

- Train a full version of KCG-GAN model:
```
python train.py --name Gray1cFeat1DSegL1 --dataroot ./datasets/SEN12SpringFeild --label_nc 0 --no_instance --input_nc 1 --output_nc 1 --loadSize 256 --num 1 --lambda_L1 50
```
- Train a KCG-GAN model without segmentation:
```
python train.py --name Gray1cFeat1DSegL1 --dataroot ./datasets/SEN12SpringFeild --label_nc 0 --no_instance --input_nc 1 --output_nc 1 --loadSize 256 --num 1 --lambda_L1 50 --no_seg_in --no_segmentation
```
- Train a KCG-GAN model without L1:
```
python train.py --name Gray1cFeat1DSegL1 --dataroot ./datasets/SEN12SpringFeild --label_nc 0 --no_instance --input_nc 1 --output_nc 1 --loadSize 256 --num 1 --no_L1_loss
```
- Train a KCG-GAN model without feature matching:
```
python train.py --name Gray1cFeat1DSegL1 --dataroot ./datasets/SEN12SpringFeild --label_nc 0 --no_instance --input_nc 1 --output_nc 1 --loadSize 256 --num 1 --no_ganFeat_loss
```

## Acknowledgments
This code borrows heavily from [pix2pixHD](https://github.com/WenliangDu/pix2pixHD) and [pytorch-CycleGAN-and-pix2pix](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix).
