DLAV project: 3D vehicle localization / group 31 / Maxime LELIEVRE, Erik MORTENSEN

Implementation of VisualDet3D (https://github.com/Owen-Liuyuxuan/visualDet3D) with a custom visualization from https://github.com/zzzxxxttt/simple_kitti_visualization

Data preparation:
Make sure to respect the correct architecture while loading the KITTI dataset:
KITTI dataset/{training, testing}/{calib, label_2, image_2}
 

To use the pretrained model: GroundAware_pretrained.pth (to be downloaded separately from https://github.com/Owen-Liuyuxuan/visualDet3D/releases/tag/1.0)

Test visualization is possible by using the file  3dbox_to_img.py with the appropriate structure from https://github.com/zzzxxxttt/simple_kitti_visualization

The whole pipeline has been run with scitas cluster (to have access to GPU) from the file train_test_for_scitas.sh


