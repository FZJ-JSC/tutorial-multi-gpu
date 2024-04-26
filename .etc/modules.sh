module purge
module use $OTHERSTAGES
module load Stages/2024
module load GCC/12.3.0
module load CUDA/12
module load ParaStationMPI/5.9.2-1
module load NCCL/default-CUDA-12
module load NVSHMEM/2.10.1-CUDA-12
module load Nsight-Systems/2023.3.1
module load MPI-settings/CUDA
# module use $JSCCOURSE_DIR_GROUP/common/modulefiles