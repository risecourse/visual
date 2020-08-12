#!/bin/bash -l

#$ -P riseprac

#$ -pe omp 8

#$ -l h_rt=1:00:00

#$ -m ea

#$ -N visual

#$ -j y
#$ -o log_visual.qlog

echo "============================================"
echo "Start date : $(date)"
echo "Job name : $JOB_NAME"
echo "Job ID: $JOB_ID $SGE_TASK_ID"
echo "============================================"

module purge
module load python3/3.6.5
module load gcc/8.1.0
module load openmpi/3.1.4_gnu-8.1
module load neuron/7.6.7
module load gsl/2.5
module load nest/2.20.0

mpirun -np 8 python  ganglionCell.py

echo "============================================"
echo "Now running network.py"
echo "============================================"

mpirun -np 8 python network.py
