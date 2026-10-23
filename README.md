# SC26 Tutorial: Efficient Distributed GPU Programming for Exascale

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5745504.svg)](https://doi.org/10.5281/zenodo.5745504)


Repository with talks and exercises of our Efficient GPU Programming for Exascale tutorial, to be held at [SC26](https://sc26.conference-program.com/presentation/?id=tut120&sess=sess190).

## Coordinates

* Date: 15 November 2026
* Occasion: SC26 Tutorial (Full Day)
* Tutors: Simon Garcia de Gonzalo (SNL), Oded Green (NVIDIA), Andreas Herten (JSC), Lena Oden (Uni Hagen)
* Support: David Appelhans (NVIDIA), Markus Hrywniak (NVIDIA), and Jiri Kraus (NVIDIA)


## Setup

The tutorial is an interactive tutorial with introducing lectures and practical exercises to apply knowledge. The exercises have been derived from the Jacobi solver implementations available in [NVIDIA/multi-gpu-programming-models](https://github.com/NVIDIA/multi-gpu-programming-models).

Overview (only possible on-site at SC26!):

* Sign up at JuDoor
* Open Jupyter JSC: https://jupyter.jsc.fz-juelich.de
* Create new Jupyter instance on [JUPITER, using training26XX account, on **LoginNode**](https://jupyter.jsc.fz-juelich.de/workshops/sc26mg) [^1]
* Source course environment: `source $PROJECT_training26XX/env.sh`
* Sync material: `jsc-material-sync`
* Locally install NVIDIA Nsight Systems: https://developer.nvidia.com/nsight-systems


1. Lecture: Tutorial Overview, Introduction to System + Onboarding *Andreas*
2. Lecture: Introduction to MPI-Distributed Computing with GPUs *Simon*
3. Lecture: Optimization techniques for multi-GPU applications *Simon*
4. Hands-on: Overlap communication and computation with MPI
5. Lecture: Performance / Debugging Tools 
6. Lecture: Overview of NCCL and NVSHMEN in MPI *Lena*
7. Hands-on: Using NCCL and NVSHMEM
8. Lecture: CUDA Graphs and Device-initiated Communication with NCCL and NVSHMEM *Oded*
9. Hands-on: Device-initiated Communication with NVSHMEM and NCCL
10. Lecture: Conclusion and Outline of Advanced Topics *Andreas*

[^1]: JUPITER is the default. In the case the tutors tell to move to the backup (JUWELS Booster), launch a [new Jupyter instance here](https://jupyter.jsc.fz-juelich.de/workshops/sc26mg-juwels).
