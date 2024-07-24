#!/bin/bash -l
#PBS -N stask_mouse
#PBS -l select=1
#PBS -m abe
#PBS -M lvairus@anl.gov
#PBS -l walltime=1:00:00
#PBS -q debug
#PBS -l filesystems=home:eagle
#PBS -A datascience 
#PBS -o logs/stask_mouse.OU
#PBS -e logs/stask_mouse.ER

module use /soft/modulefiles
module load conda
conda activate /lus/eagle/projects/datascience/lvairus/envs/sst   

cd /lus/eagle/projects/datascience/lvairus/Pharmacokinetic_Modeling/ModelTraining/MolFormer_MultiTask_Class


CUDA_VISIBLE_DEVICES=0 wandb agent lvairusorg/Multitask_Class_Oral/ux84l10i & 
CUDA_VISIBLE_DEVICES=1 wandb agent lvairusorg/Multitask_Class_Oral/ux84l10i 

