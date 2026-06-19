# ISC26 Tutorial: Efficient Distributed GPU Programming for Exascale

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5745504.svg)](https://doi.org/10.5281/zenodo.5745504)


Repository with talks and exercises of our Efficient GPU Programming for Exascale tutorial, to be held at [ISC26](https://app.swapcard.com/event/isc-high-performance-2026/planning/UGxhbm5pbmdfNDM5MDIyMg==).

## Coordinates

* Date: 22 July 2026
* Occasion: ISC26 Tutorial (Full Day)
* Tutors: Andreas Herten (JSC), Laura Morgenstern (NVIDIA), Lena Oden (Uni Hagen)
* Support: David Appelhans (NVIDIA), Simon Garcia de Gonzalo (SNL), Markus Hrywniak (NVIDIA) and Jiri Kraus (NVIDIA)


## Setup

The tutorial is an interactive tutorial with introducing lectures and practical exercises to apply knowledge. The exercises have been derived from the Jacobi solver implementations available in [NVIDIA/multi-gpu-programming-models](https://github.com/NVIDIA/multi-gpu-programming-models).

Walk-through (only possible on-site at ISC26!):

* Sign up at JuDoor
* Open Jupyter JSC: https://jupyter.jsc.fz-juelich.de
* Create new Jupyter instance on [JUPITER, using training26XX account, on **LoginNode**](https://jupyter.jsc.fz-juelich.de/workshops/isc26mg) [^1]
* Source course environment: `source $PROJECT_training26XX/env.sh`
* Sync material: `jsc-material-sync`
* Locally install NVIDIA Nsight Systems: https://developer.nvidia.com/nsight-systems


1. Lecture: Tutorial Overview, Introduction to System + Onboarding *Andreas*
2. Lecture: MPI-Distributed Computing with GPUs *Lena*
3. Hands-on: Multi-GPU Parallelization
4. Lecture: Performance / Debugging Tools *Laura*
5. Lecture: Optimization Techniques for Multi-GPU Applications *Lena*
6. Hands-on: Overlap Communication and Computation with MPI
7. Lecture: Overview of NCCL and NVSHMEN in MPI *Lena*
8. Hands-on: Using NCCL and NVSHMEM
9. Lecture: Device-initiated Communication with NVSHMEM *Laura*
10. Hands-on: Using Device-Initiated Communication with NVSHMEM
11. Lecture: Conclusion and Outline of Advanced Topics *Andreas*

[^1]: JUPITER is the default. In the case the tutors tell to move to the backup (JUWELS Booster), launch a [new Jupyter instance here](https://jupyter.jsc.fz-juelich.de/workshops/isc26mg-juwels).
