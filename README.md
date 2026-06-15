# HPC Driving AI: Tutorial on Multi-GPU distributed computing

Repository with talks and exercises of our Distributed GPU Computing tutorial, to be held at [HPC Driving AI](https://chn.tum.de/study-programs/summer-school-on-hpc-driving-ai#c15072).

## Coordinates

* Date: June 16-20, 2026
* Occasion: Summer School on HPC Driving AI
* Tutors: Michal Rajski (JSC), Adel Dabah (JSC), Prateek Chawla (JSC), Mathis Bode (JSC)


## Setup

The tutorial is an interactive tutorial with introducing lectures and practical exercises to apply knowledge. The exercises have been derived from the Jacobi solver implementations available in [NVIDIA/multi-gpu-programming-models](https://github.com/NVIDIA/multi-gpu-programming-models).

Walk-through (only possible on-site!):

* Sign up at JuDoor
* Open Jupyter JSC: https://jupyter.jsc.fz-juelich.de
* Create new Jupyter instance on [JUPITER, using training26XX account, on **LoginNode**](https://jupyter.jsc.fz-juelich.de/)
* Source course environment: `source $PROJECT_training26XX/env.sh`
* Sync material: `jsc-material-sync`
* Locally install NVIDIA Nsight Systems: https://developer.nvidia.com/nsight-systems


1. Lecture: Tutorial Overview, Introduction to System + Onboarding *Michal, Adel*
2. Lecture: MPI-Distributed Computing with GPUs *Michal, Prateek*
3. Hands-on: Multi-GPU Parallelization
4. Lecture: Performance / Debugging Tools *Prateek, Adel*
5. Lecture: Optimization Techniques for Multi-GPU Applications *Prateek, Adel*
6. Hands-on: Overlap Communication and Computation with MPI
7. Lecture: Overview of NCCL and NVSHMEN in MPI *Adel, Michal*
8. Hands-on: Using NCCL and NVSHMEM
9. Lecture: Device-initiated Communication with NVSHMEM *Adel, Michal*
10. Hands-on: Using Device-Initiated Communication with NVSHMEM
11. Lecture: Conclusion and Outline of Advanced Topics *Prateek, Michal*
