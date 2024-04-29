# ISC24 Tutorial: Efficient Distributed GPU Programming for Exascale

[![DOI](https://zenodo.org/badge/409504932.svg)](https://zenodo.org/badge/latestdoi/409504932)


Repository with talks and exercises of our Efficient GPU Programming for Exascale tutorial, to be held at [ISC24](https://app.swapcard.com/widget/event/isc-high-performance-2024/planning/UGxhbm5pbmdfMTgyNTY0MQ==).

## Coordinates

* Date: 12 May 2024
* Occasion: ISC24 Tutorial
* Tutors: Simon Garcia de Gonzalo (SNL), Andreas Herten (JSC), Markus Hrywniak (NVIDIA), Jiri Kraus (NVIDIA), Lena Oden (Uni Hagen)


## Setup

The tutorial is an interactive tutorial with introducing lectures and practical exercises to apply knowledge. The exercises have been derived from the Jacobi solver implementations available in [NVIDIA/multi-gpu-programming-models](https://github.com/NVIDIA/multi-gpu-programming-models).

Walk-through:

* Sign up at JuDoor: https://go.fzj.de/mg-jd
* Open Jupyter JSC: https://jupyter-jsc.fz-juelich.de
* Create new Jupyter instance on JUWELS, using training2414 account, on **LoginNodeBooster**
* Source course environment: `source $PROJECT_training2414/env.sh`
* Sync material: `jsc-material-sync`
* Locally install NVIDIA Nsight Systems: https://developer.nvidia.com/nsight-systems

Curriculum:

1. Lecture: Tutorial Overview, Introduction to System + Onboarding *Andreas*
2. Lecture: MPI-Distributed Computing with GPUs *Simon*
3. Hands-on: Multi-GPU Parallelization
4. Lecture: Performance / Debugging Tools *Markus*
5. Lecture: Optimization Techniques for Multi-GPU Applications *Simon*
6. Hands-on: Overlap Communication and Computation with MPI
7. Lecture: Overview of NCCL and NVSHMEN in MPI *Lena*
8. Hands-on: Using NCCL and NVSHMEM
9. Lecture: Device-initiated Communication with NVSHMEM *Jiri*
10. Hands-on: Using Device-Initiated Communication with NVSHMEM
11. Lecture: Conclusion and Outline of Advanced Topics *Andreas*
