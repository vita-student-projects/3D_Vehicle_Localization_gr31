#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 10
#SBATCH --mem 8G
#SBATCH --partition gpu
#SBATCH --gres gpu:1
#SBATCH --qos dlav
#SBATCH --account civil-459-2023
#SBATCH -e slurm-%j.err
#SBATCH -o slurm-%j.out

nvidia-smi

module load gcc/8.4.0-cuda python/3.7.7 cuda/10.2.89

source ~/venvs/venv-g31_pytorch112/bin/activate

python3 scripts/imdb_precompute_3d.py --config="config/config_file.py"

python3 scripts/imdb_precompute_test.py --config="config/config_file.py"

CUDA_VISIBLE_DEVICES=0 python3 scripts/train.py --config="config/config_file.py" --experiment_name="experiment_1"

CUDA_VISIBLE_DEVICES=0 python3 scripts/eval.py --config="config/config_file.py" --gpu=0 --checkpoint_path="visualDet3D/workdirs/Mono3D/checkpoint/GroundAware_pretrained.pth" --split_to_test="validation"

CUDA_VISIBLE_DEVICES=0 python3 scripts/eval.py --config="config/config_file.py" --gpu=0 --checkpoint_path="visualDet3D/workdirs/Mono3D/checkpoint/GroundAware_pretrained.pth" --split_to_test="test"  