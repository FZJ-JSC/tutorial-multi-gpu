module purge
module use $OTHERSTAGES
#module use /p/project/training2446/easybuild/juwelsbooster/modules/all/MPI/GCC/12.3.0/psmpi/5/
module load Stages/2024
module load GCC/12.3.0
module load CUDA/12
module load OpenMPI/4.1.6
export MPI_HOME=$EBROOTOPENMPI
#export MPI_HOME=$EBROOTPSMPI
module load NCCL/default-CUDA-12
module load NVSHMEM/2.10.1-CUDA-12
module load Nsight-Systems/2024.4.1
module load MPI-settings/CUDA
export USERINSTALLATIONS=${JSCCOURSE_DIR_GROUP}
module update # will also load different NCCL
module load NVSHMEM/3.1.7-CUDA-12