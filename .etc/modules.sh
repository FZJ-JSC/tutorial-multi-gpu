module purge
module use $OTHERSTAGES
#module use /p/project/training2446/easybuild/juwelsbooster/modules/all/MPI/GCC/12.3.0/psmpi/5/
module load Stages/2024
module load GCC/12.3.0
module load CUDA/12
module load ParaStationMPI/5.9.2-1
module load NCCL/default-CUDA-12
module load NVSHMEM/2.11.0-CUDA-12
module load Nsight-Systems/2024.2.1
module load MPI-settings/CUDA
# module use $JSCCOURSE_DIR_GROUP/common/modulefiles