### Copyright (C) 2017 NVIDIA Corporation. All rights reserved. 
### Licensed under the CC BY-NC-SA 4.0 license (https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode).
import os.path
import scipy.io as sio # for reading .mat files
from data.base_dataset import BaseDataset, get_params, get_transform, normalize
from data.image_folder import make_dataset
from PIL import Image

class AlignedDataset(BaseDataset):
    def initialize(self, opt):
        self.opt = opt
        self.root = opt.dataroot    

        ### input A (label maps)
        dir_A = '_A' if self.opt.label_nc == 0 else '_label'
        self.dir_A = os.path.join(opt.dataroot, opt.phase + dir_A)
        self.A_paths = sorted(make_dataset(self.dir_A))

        ### input B (real images)
        if opt.isTrain or opt.use_encoded_image:
            dir_B = '_B' if self.opt.label_nc == 0 else '_img'
            self.dir_B = os.path.join(opt.dataroot, opt.phase + dir_B)  
            self.B_paths = sorted(make_dataset(self.dir_B))

        ### instance maps
        if not opt.no_instance:
            self.dir_inst = os.path.join(opt.dataroot, opt.phase + '_inst')
            self.inst_paths = sorted(make_dataset(self.dir_inst))

        ### load precomputed instance-wise encoded features
        if opt.load_features:                              
            self.dir_feat = os.path.join(opt.dataroot, opt.phase + '_feat')
            print('----------- loading features from %s ----------' % self.dir_feat)
            self.feat_paths = sorted(make_dataset(self.dir_feat))


        ### load segmentation
        if ((not self.opt.no_segmentation if self.opt.isTrain else bool(0)) or (not self.opt.no_seg_input)) and (self.opt.label_nc == 0):
            self.dir_A_seg = os.path.join(opt.dataroot, opt.phase + '_seg_A')
            self.dir_B_seg = os.path.join(opt.dataroot, opt.phase + '_seg_B')
            self.A_seg_paths = sorted(make_dataset(self.dir_A_seg))
            self.B_seg_paths = sorted(make_dataset(self.dir_B_seg))

            A_centers_path = os.path.join(opt.dataroot, opt.phase + '_seg_A/Centers.mat')
            B_centers_path = os.path.join(opt.dataroot, opt.phase + '_seg_B/Centers.mat')
            Centers_A = sio.loadmat(A_centers_path)
            Centers_B = sio.loadmat(B_centers_path)

            opt.A_centers = Centers_A['C']
            opt.B_centers = Centers_B['C']
        else:
            opt.A_centers = 0
            opt.B_centers = 0

        self.dataset_size = len(self.A_paths) 
      
    def __getitem__(self, index):        
        ### input A (label maps)
        A_path = self.A_paths[index]              
        A = Image.open(A_path)        
        params = get_params(self.opt, A.size)
        if self.opt.label_nc == 0:
            transform_A = get_transform(self.opt, params, grayscale=(self.opt.input_nc == 1))
            A_tensor = transform_A(A.convert('RGB'))
        else:
            transform_A = get_transform(self.opt, params, grayscale=False, method=Image.NEAREST, normalize=False)
            A_tensor = transform_A(A) * 255.0

        B_tensor = inst_tensor = feat_tensor = 0
        ### input B (real images)
        if self.opt.isTrain or self.opt.use_encoded_image:
            B_path = self.B_paths[index]   
            B = Image.open(B_path).convert('RGB')
            transform_B = get_transform(self.opt, params, grayscale=(self.opt.input_nc == 1))
            B_tensor = transform_B(B)

        ### if using instance maps        
        if not self.opt.no_instance:
            inst_path = self.inst_paths[index]
            inst = Image.open(inst_path)
            inst_tensor = transform_A(inst)

            if self.opt.load_features:
                feat_path = self.feat_paths[index]
                feat = Image.open(feat_path).convert('RGB')
                norm = normalize()
                feat_tensor = norm(transform_A(feat))

        # apply the same transform to A_seg_map and B_seg_map (segmentation)
        A_seg_map = B_seg_map = 0
        if (not self.opt.no_segmentation if self.opt.isTrain else bool(0)) or (not self.opt.no_seg_input):
            A_seg_map_path = self.A_seg_paths[index]
            A_seg_map_old = Image.open(A_seg_map_path).convert('RGB')
            A_seg_map = transform_A(A_seg_map_old)

            B_seg_map_path = self.B_seg_paths[index]
            B_seg_map_old = Image.open(B_seg_map_path).convert('RGB')
            B_seg_map = transform_A(B_seg_map_old)

        input_dict = {'label': A_tensor, 'inst': inst_tensor, 'image': B_tensor, 
                      'feat': feat_tensor, 'path': A_path, 'A_seg_map': A_seg_map, 'B_seg_map': B_seg_map}

        return input_dict

    def __len__(self):
        return len(self.A_paths) // self.opt.batchSize * self.opt.batchSize

    def name(self):
        return 'AlignedDataset'