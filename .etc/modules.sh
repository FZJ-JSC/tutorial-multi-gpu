module purge
module load GCC/13.3.0
module load CUDA/12 #12.6.0
module load OpenMPI/5.0.5
export MPI_HOME=$EBROOTOPENMPI
#export MPI_HOME=$EBROOTPSMPI
module load NCCL/default-CUDA-12 #2.22.3-1
module load NVSHMEM/3.1.7-CUDA-12
module load Nsight-Systems/2025.3.1
module load MPI-settings/CUDA