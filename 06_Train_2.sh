#!/bin/bash
#SBATCH --job-name PDAC_train_2
#SBATCH --cpus-per-task 1
#SBATCH --output /home/poahmadvand/ml/slurm/%j.out
#SBATCH --error /home/poahmadvand/ml/slurm/%j.err
#SBATCH -w dlhost04
#SBATCH -p rtx5000
#SBATCH --gres=gpu:1
#SBATCH --time=4-90:00:00
#SBATCH --chdir /projects/ovcare/classification/pouya/components/docker_benchmark_pytorch
#SBATCH --mem=45G

source /home/poahmadvand/py3env/bin/activate
python app.py --config_file_location "/projects/ovcare/classification/pouya/components/PDAC_Binary_Pipeline/06_Train_2.json"
#kronos run \
#	-c $PWD/../ \
#	-y 06_train.yaml \
#	--no_prefix
