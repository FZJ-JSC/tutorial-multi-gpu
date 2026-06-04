module load Stages/2026
module purge
module load GCC/14.3.0
module load CUDA/13
module load OpenMPI/5.0.8
export MPI_HOME=$EBROOTOPENMPI
#export MPI_HOME=$EBROOTPSMPI
module load NCCL/default-CUDA-13
module load NVSHMEM/3.5.21-CUDA-13
module load Nsight-Systems/2025.5.1
module load MPI-settings/CUDA
module use $JSCCOURSE_DIR_GROUP/common/modulefiles
