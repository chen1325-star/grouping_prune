#!/bin/bash

# Check if the user provided an argument
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dataset_name>"
    exit 1
fi


dataset_name="$1"
scale="$2"
dataset_folder="/scratch/jiasi_root/jiasi98/zxuechen/dataset_segmentation/data/$dataset_name"

if [ ! -d "$dataset_folder" ]; then
    echo "Error: Folder '$dataset_folder' does not exist."
    exit 2
fi


# # Gaussian Grouping training
# python train_prune.py --target_num 180000 -s $dataset_folder -r ${scale}  -m output/${dataset_name}/${dataset_name}_seperate_180k --config_file config/gaussian_dataset/train.json --train_split --start_pointcloud /scratch/jiasi_root/jiasi98/zxuechen/dataset_segmentation/checkpoint/${dataset_name} --prune_iterations 100 --port 6006

# # Segmentation rendering using trained model
# python render.py -m output/${dataset_name}_seperate_180k --num_classes 256 --images images

# # Gaussian Grouping training
# python train_prune.py --target_num 135000 -s $dataset_folder -r ${scale}  -m output/${dataset_name}/${dataset_name}_seperate_135k --config_file config/gaussian_dataset/train.json --train_split --start_pointcloud /scratch/jiasi_root/jiasi98/zxuechen/dataset_segmentation/checkpoint/${dataset_name} --prune_iterations 100 --port 6006

# # Segmentation rendering using trained model
# python render.py -m output/${dataset_name}_seperate_135k --num_classes 256 --images images

# # Gaussian Grouping training
# python train_prune.py --target_num 90000 -s $dataset_folder -r ${scale}  -m output/${dataset_name}/${dataset_name}_seperate_90k --config_file config/gaussian_dataset/train.json --train_split --start_pointcloud /scratch/jiasi_root/jiasi98/zxuechen/dataset_segmentation/checkpoint/${dataset_name} --prune_iterations 100 --port 6006

# # Segmentation rendering using trained model
# python render.py -m output/${dataset_name}_seperate_90k --num_classes 256 --images images

# # Gaussian Grouping training
# python train_prune.py --target_num 45000 -s $dataset_folder -r ${scale}  -m output/${dataset_name}/${dataset_name}_seperate_45k --config_file config/gaussian_dataset/train.json --train_split --start_pointcloud /scratch/jiasi_root/jiasi98/zxuechen/dataset_segmentation/checkpoint/${dataset_name} --prune_iterations 100 --port 6006

# # Segmentation rendering using trained model
# python render.py -m output/${dataset_name}/${dataset_name}_seperate_45k --num_classes 256 --images images

# #bash script/train_lerf_seperate.sh figurines 1

# Gaussian Grouping training
python train_prune.py --target_num 45000 -s $dataset_folder -r ${scale}  -m output/${dataset_name}/${dataset_name}_45k --config_file config/gaussian_dataset/train.json --train_split --start_pointcloud /scratch/jiasi_root/jiasi98/zxuechen/dataset_segmentation/checkpoint/${dataset_name} --prune_iterations 100 --port 6006
