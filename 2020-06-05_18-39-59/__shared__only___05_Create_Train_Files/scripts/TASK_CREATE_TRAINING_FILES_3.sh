#! /bin/bash
touch run_slerm
echo "#! /bin/bash
#SBATCH --job-name create_training_files_slurm
#SBATCH --cpus-per-task 2
#SBATCH --output /home/poahmadvand/ml/slurm/create_training_files_3.%j.out
#SBATCH --error /home/poahmadvand/ml/slurm/create_training_files_3.%j.err
#SBATCH -w dlhost04
#SBATCH -p rtx5000
#SBATCH --gres=gpu:2
#SBATCH --time=10:00:00 --wait

singularity run -B ""/projects/ovcare/classification/Diagnostic_TCGA_PDAC_cases/patches_256_sorted/chunks.json"":""/projects/ovcare/classification/Diagnostic_TCGA_PDAC_cases/patches_256_sorted/chunks.json"" -B ""/projects/ovcare/classification/"":""/projects/ovcare/classification/"" -B ""/projects/ovcare/classification/Diagnostic_TCGA_PDAC_cases/training_chunks_3.json"":""/projects/ovcare/classification/Diagnostic_TCGA_PDAC_cases/training_chunks_3.json""  -B /projects/ovcare/classification/pouya/components/docker_create_training_files:$PWD/ /projects/ovcare/classification/pouya/components/docker_create_training_files/docker_create_training_files.sif --chunk_file_location ""/projects/ovcare/classification/Diagnostic_TCGA_PDAC_cases/patches_256_sorted/chunks.json"" --linker_location ""/projects/ovcare/classification/"" --output_location ""/projects/ovcare/classification/Diagnostic_TCGA_PDAC_cases/training_chunks_3.json"" --seed 1 --validation_chunks 1 --number_of_patches 10000000_200000_200000 --training_chunks 0_2 --testing_chunks 1 " > run_slerm
sbatch run_slerm 