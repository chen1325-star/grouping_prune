git clone https://github.com/lkeab/gaussian-grouping.git --recursive
conda create -n gaussian_grouping python=3.8 -y
conda activate gaussian_grouping 

module load cuda/11.6.2 cudnn/11.6-v8.4.1
conda install pytorch==1.12.1 torchvision==0.13.1 torchaudio==0.12.1 cudatoolkit=11.3 -c pytorch
pip install plyfile==0.8.1
pip install tqdm scipy wandb opencv-python scikit-learn lpips

pip install submodules/diff-gaussian-rasterization
pip install submodules/simple-knn


cd gaussian-grouping
srun --jobid=7385415 --pty bash
conda create --prefix /scratch/jiasi_root/jiasi98/shared_env/gaussian_grouping python=3.8 -y
source activate /scratch/jiasi_root/jiasi98/shared_env/gaussian_grouping
module load cuda/11.6.2 cudnn/11.6-v8.4.1
pip install submodules/diff-gaussian-rasterization
pip install submodules/simple-knn

#tensorboard --logdir OUTPUT/PATH/train
#srun --jobid=7866211 --pty bash
#tmux new -s light
#tmux a -t light
#salloc --job-name=2group --cpus-per-task=2 --nodes=1 --ntasks-per-node=2 --mem-per-cpu=10G --time=14-00:00:00 --account=jiasi98 --partition=spgpu --gres=gpu:2

#/scratch/jiasi_root/jiasi98/zxuechen/OUTPUT/seg

# salloc --job-name=zoology-2gpu --cpus-per-task=2 --nodes=1 --ntasks-per-node=2 --mem-per-cpu=10G --time=14-00:00:00 --account=jiasi98 --partition=spgpu --gres=gpu:2
# python render_video.py --source_path PATH/TO/DATASET --model_path PATH/TO/MODEL --skip_train --skip_test --video

# salloc --job-name=time2 --cpus-per-task=2 --nodes=1 --ntasks-per-node=2 --mem-per-cpu=10G --time=14-00:00:00 --account=jiasi0 --partition=spgpu --gres=gpu:2

#salloc --job-name=tabpfn --cpus-per-task=2 --nodes=1 --ntasks-per-node=2 --mem-per-cpu=10G --time=14-00:00:00 --account=sotamavens_owned_project1 --partition=spgpu2 --gres=gpu:1    