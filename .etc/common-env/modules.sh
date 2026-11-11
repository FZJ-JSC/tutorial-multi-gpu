ml use $OTHERSTAGES
module load Stages/2027
module purge
module load GCC/15.2.0
module load CUDA/13
module load OpenMPI/5.0.10
export MPI_HOME=$EBROOTOPENMPI
#export MPI_HOME=$EBROOTPSMPI
module load NCCL/default-CUDA-13
module load NVSHMEM/3.8.0-CUDA-13
module load Nsight-Systems/2026.6.1
module load MPI-settings/CUDA
