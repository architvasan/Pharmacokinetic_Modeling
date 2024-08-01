#!/bin/bash -l
#PBS -N extask_test
#PBS -l select=1
#PBS -m abe
#PBS -M lvairus@anl.gov
#PBS -l walltime=0:10:00
#PBS -q debug
#PBS -l filesystems=home:eagle
#PBS -A datascience 
#PBS -o logs/extask_test.OU
#PBS -e logs/extask_test.ER

module use /soft/modulefiles
module load conda
conda activate /lus/eagle/projects/datascience/lvairus/envs/sst   

cd /lus/eagle/projects/datascience/lvairus/Pharmacokinetic_Modeling/ModelTraining/MolFormer_MultiTask_Class

CUDA_VISIBLE_DEVICES=0 wandb agent 'lvairusorg/Multitask Class Oral Test/uvi9at2l' & 
CUDA_VISIBLE_DEVICES=1 wandb agent 'lvairusorg/Multitask Class Oral Test/uvi9at2l' &
CUDA_VISIBLE_DEVICES=2 wandb agent 'lvairusorg/Multitask Class Oral Test/uvi9at2l' &
CUDA_VISIBLE_DEVICES=3 wandb agent 'lvairusorg/Multitask Class Oral Test/uvi9at2l'


