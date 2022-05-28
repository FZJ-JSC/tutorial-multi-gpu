# ISC22 Tutorial: Efficient Distributed GPU Programming for Exascale

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5745505.svg)](https://doi.org/10.5281/zenodo.5745505) (*old*)

Repository with talks and exercises of our [Efficient GPU Programming for Exascale](https://app.swapcard.com/widget/event/isc-high-performance-2022/planning/UGxhbm5pbmdfODYxMTQ2) tutorial.

## Coordinates

* Date: 29 May 2022
* Occasion: ISC22 Tutorial
* Tutors: Andreas Herten (JSC), Markus Hrywniak (NVIDIA), Jiri Kraus (NVIDIA), Lena Oden (Uni Hagen) (and Simon Garcia (BSC), helping from afar)

## Setup

The tutorial is an interactive tutorial with introducing lectures and practical exercises to apply knowledge. The exercises have been derived from the Jacobi solver implementations available in [NVIDIA/multi-gpu-programming-models](https://github.com/NVIDIA/multi-gpu-programming-models).

Curriculum:

1. Lecture: Tutorial Overview, Introduction to System + Onboarding *Andreas*
2. Lecture: MPI-Distributed Computing with GPUs *Lena*
3. Hands-on: Multi-GPU Parallelization
4. Lecture: Performance / Debugging Tools *Markus*
5. Lecture: Optimization Techniques for Multi-GPU Applications *Jiri*
6. Hands-on: Overlap Communication and Computation with MPI
7. Lecture: Overview of NCCL and NVSHMEN in MPI *Lena*
8. Hands-on: Using NCCL and NVSHMEM
9. Lecture: Device-initiated Communication with NVSHMEM *Jiri*
10. Hands-on: Using Device-Initiated Communication with NVSHMEM
11. Lecture: Conclusion and Outline of Advanced Topics *Andreas*

## Onboarding

The supercomputer used for the exercises is [JUWELS Booster](https://apps.fz-juelich.de/jsc/hps/juwels/booster-overview.html), a system located a Jülich Supercomputing Centre (Germany) with about 3700 NVIDIA A100 GPUs.

Visual onboarding instructions can be found in the subfolder of the according lecture, `01b-H-Onboarding/`. Here follows the textual description:

* Register for an account at [JuDoor](https://judoor.fz-juelich.de/login)
* Sign-up for the [`training2216` project](https://judoor.fz-juelich.de/projects/join/training2216)
* Accept the Usage Agreement of JUWELS
* Wait for wheels to turn as your information is pushed through the systems (about 15 minutes)
* Access JUWELS Booster via [JSC's Jupyter portal](https://jupyter-jsc.fz-juelich.de/)
* Create a Jupyter v2 instance using `LoginNodeBooster` and the `training2216` allocation on JUWELS
* When started, launch a browser-based Shell in Jupyter
* Source the course environment to introduce commands and helper script to environment
  ```
  source $PROJECT_training2216/env.sh
  ```
* Sync course material to your home directory with `jsc-material-sync`.

You can also access JSC's facilities via SSH. In that case you need to add your SSH key through JuDoor. You need to restrict access from certain IPs/IP ranges via the `from` clause, as explained [in the documentation](https://apps.fz-juelich.de/jsc/hps/juwels/access.html#ssh-login). We recommend using Jupyter JSC for its simplicity, especially during such a short day that is the tutorial day.