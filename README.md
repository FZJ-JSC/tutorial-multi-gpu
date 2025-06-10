# ISC25 Tutorial: Efficient Distributed GPU Programming for Exascale

[![DOI](https://zenodo.org/badge/409504932.svg)](https://zenodo.org/badge/latestdoi/409504932)


Repository with talks and exercises of our Efficient GPU Programming for Exascale tutorial, to be held at [ISC25](https://isc.app.swapcard.com/widget/event/isc-high-performance-2025/planning/UGxhbm5pbmdfMjU4MTc5Ng==).

## Coordinates

* Date: 13 June 2025
* Occasion: ISC25 Tutorial
* Tutors: Simon Garcia de Gonzalo (SNL), Andreas Herten (JSC), Lena Oden (Uni Hagen), with support by Markus Hrywniak (NVIDIA) and Jiri Kraus (NVIDIA)


## Setup

The tutorial is an interactive tutorial with introducing lectures and practical exercises to apply knowledge. The exercises have been derived from the Jacobi solver implementations available in [NVIDIA/multi-gpu-programming-models](https://github.com/NVIDIA/multi-gpu-programming-models).

Walk-through:

* Sign up at JuDoor
* Open Jupyter JSC: https://jupyter.jsc.fz-juelich.de
* Create new Jupyter instance on JUPITER, using training2526 account, on **LoginNode**
* Source course environment: `source $PROJECT_training2526/env.sh`
* Sync material: `jsc-material-sync`
* Locally install NVIDIA Nsight Systems: https://developer.nvidia.com/nsight-systems

Curriculum (Note: square-bracketed sessions are skipped at ISC25 because only ½ day was allocated to the tutorial):

1. Lecture: Tutorial Overview, Introduction to System + Onboarding *Andreas*
2. Lecture: MPI-Distributed Computing with GPUs *Simon*
3. Hands-on: Multi-GPU Parallelization
4. [Lecture: Performance / Debugging Tools]
5. Lecture: Optimization Techniques for Multi-GPU Applications *Lena*
6. Hands-on: Overlap Communication and Computation with MPI
7. [Lecture: Overview of NCCL and NVSHMEN in MPI]
8. [Hands-on: Using NCCL and NVSHMEM]
9. [Lecture: Device-initiated Communication with NVSHMEM]
10. [Hands-on: Using Device-Initiated Communication with NVSHMEM]
11. Lecture: Conclusion and Outline of Advanced Topics *Andreas*
