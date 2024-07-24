#!/bin/bash -l
#PBS -N extask_test
#PBS -l select=1
#PBS -m abe
#PBS -M lvairus@anl.gov
#PBS -l walltime=0:30:00
#PBS -q debug
#PBS -l filesystems=home:eagle
#PBS -A datascience 
#PBS -o logs/extask_test.OU
#PBS -e logs/extask_test.ER

module use /soft/modulefiles
module load conda
conda activate /lus/eagle/projects/datascience/lvairus/envs/sst   

cd /lus/eagle/projects/datascience/lvairus/Pharmacokinetic_Modeling/ModelTraining/MolFormer_MultiTask_Class

CUDA_VISIBLE_DEVICES=0,1 python run_script_lv_ex_sweep.py -d oral_data/rabbit.csv -s SMILES -l EPACategoryIndex -t 0.2 -E 3 &
CUDA_VISIBLE_DEVICES=2 python run_script_lv_ex_sweep.py -d oral_data/rat.csv -s SMILES -l EPACategoryIndex -t 0.2 -E 3 &
CUDA_VISIBLE_DEVICES=3 python run_script_lv_ex_sweep.py -d oral_data/mouse.csv -s SMILES -l EPACategoryIndex -t 0.2 -E 3  
# CUDA_VISIBLE_DEVICES=3 python run_script_lv_ex_sweep.py -d single_data/rat -s SMILES -l EPACategoryIndex -t 0.2 -E 32 -i 7 


