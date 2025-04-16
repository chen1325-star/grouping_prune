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
python train_prune.py    -s $dataset_folder -r ${scale}  -m output/${dataset_name}_debug --config_file config/gaussian_dataset/train.json --train_split 
#--start_pointcloud /scratch/jiasi_root/jiasi98/zxuechen/dataset_segmentation/checkpoint/figurines --prune_iterations 100

# Segmentation rendering using trained model
python render.py -m output/${dataset_name}_debug --num_classes 256 --images images

#bash script/train_lerf_debug.sh figurines 1