#!/bin/bash -l
#PBS -N stask_last4_xavier
#PBS -l select=1
#PBS -m abe
#PBS -M lvairus@anl.gov
#PBS -l walltime=0:30:00
#PBS -q debug
#PBS -l filesystems=home:eagle
#PBS -A datascience 
#PBS -o logs/stask_last4.OU
#PBS -e logs/stask_last4.ER

module use /soft/modulefiles
module load conda
conda activate /lus/eagle/projects/datascience/lvairus/envs/sst   

cd /lus/eagle/projects/datascience/lvairus/Pharmacokinetic_Modeling/ModelTraining/MolFormer_MultiTask_Class

CUDA_VISIBLE_DEVICES=0 python run_script_lv_multi.py -d single_data/quail -s SMILES -l EPACategoryIndex -t 0.2 -E 50 &

CUDA_VISIBLE_DEVICES=1 python run_script_lv_multi.py -d single_data/rabbit -s SMILES -l EPACategoryIndex -t 0.2 -E 50 &

CUDA_VISIBLE_DEVICES=2 python run_script_lv_multi.py -d single_data/rat -s SMILES -l EPACategoryIndex -t 0.2 -E 50 &

CUDA_VISIBLE_DEVICES=3 python run_script_lv_multi.py -d single_data/woman -s SMILES -l EPACategoryIndex -t 0.2 -E 50
