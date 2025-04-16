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


# Gaussian Grouping training
# python train_sort_2.py    -s $dataset_folder -r ${scale}  -m output/${dataset_name}_sort --config_file config/gaussian_dataset/train.json --train_split --start_pointcloud /home/zxuechen/gaussian-grouping/output/${dataset_name}_seperate_180k --prune_iterations 2 --port 6006
python train_sort_2.py    -s $dataset_folder -r ${scale}  -m output/${dataset_name}_sort_from1m --config_file config/gaussian_dataset/train.json --train_split --start_pointcloud /scratch/jiasi_root/jiasi98/zxuechen/dataset_segmentation/checkpoint/${dataset_name} --prune_iterations 2 --port 6006 --loaded_iteration -1

# # Segmentation rendering using trained model
# python render.py -m output/${dataset_name}_sort --num_classes 256 --images images

# # bash script/train_lerf_sort.sh figurines 1