#!/bin/bash -l
#PBS -N stask_sweep_test
#PBS -l select=1
#PBS -m abe
#PBS -M lvairus@anl.gov
#PBS -l walltime=0:30:00
#PBS -q debug
#PBS -l filesystems=home:eagle
#PBS -A datascience 
#PBS -o logs/stask_sweep_test.OU
#PBS -e logs/stask_sweep_test.ER

module use /soft/modulefiles
module load conda
conda activate /lus/eagle/projects/datascience/lvairus/envs/sst   
export CUDA_VISIBLE_DEVICES=0,1,2,3

cd /lus/eagle/projects/datascience/lvairus/Pharmacokinetic_Modeling/ModelTraining/MolFormer_MultiTask_Class

python run_script_lv_multi_sweep.py -d single_data -s SMILES -l EPACategoryIndex -t 0.2 -E 10

