# SC25 Tutorial: Efficient Distributed GPU Programming for Exascale

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5745504.svg)](https://doi.org/10.5281/zenodo.5745504)


Repository with talks and exercises of our Efficient GPU Programming for Exascale tutorial, to be held at [SC25](https://sc25.conference-program.com/presentation/?id=tut113&sess=sess252).

## Coordinates

* Date: 16 November 2025
* Occasion: SC25 Tutorial
* Tutors: Simon Garcia de Gonzalo (SNL), Andreas Herten (JSC), Lena Oden (Uni Hagen), David Appelhans (NVIDIA); with support by Markus Hrywniak (NVIDIA) and Jiri Kraus (NVIDIA)


## Setup

The tutorial is an interactive tutorial with introducing lectures and practical exercises to apply knowledge. The exercises have been derived from the Jacobi solver implementations available in [NVIDIA/multi-gpu-programming-models](https://github.com/NVIDIA/multi-gpu-programming-models).

Walk-through (only possible on-site at SC25!):

* Sign up at JuDoor
* Open Jupyter JSC: https://jupyter.jsc.fz-juelich.de
* Create new Jupyter instance on [JUWELS, using training2555 account, on **LoginNodeBooster**](https://jupyter.jsc.fz-juelich.de/workshops/sc25mg)
* Source course environment: `source $PROJECT_training2555/env.sh`
* Sync material: `jsc-material-sync`
* Locally install NVIDIA Nsight Systems: https://developer.nvidia.com/nsight-systems


1. Lecture: Tutorial Overview, Introduction to System + Onboarding *Andreas*
2. Lecture: MPI-Distributed Computing with GPUs *Simon*
3. Hands-on: Multi-GPU Parallelization
4. Lecture: Performance / Debugging Tools *David*
5. Lecture: Optimization Techniques for Multi-GPU Applications *Simon*
6. Hands-on: Overlap Communication and Computation with MPI
7. Lecture: Overview of NCCL and NVSHMEN in MPI *Lena*
8. Hands-on: Using NCCL and NVSHMEM
9. Lecture: Device-initiated Communication with NVSHMEM *David*
10. Hands-on: Using Device-Initiated Communication with NVSHMEM
11. Lecture: Conclusion and Outline of Advanced Topics *Andreas*
