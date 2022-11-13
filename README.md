# SC22 Tutorial: Efficient Distributed GPU Programming for Exascale

[![DOI](https://zenodo.org/badge/409504932.svg)](https://zenodo.org/badge/latestdoi/409504932)

**Joining from SC22? See [_Onboarding_](#onboarding) below!**

Repository with talks and exercises of our Efficient GPU Programming for Exascale tutorial, last held at [SC22](https://sc22.supercomputing.org/presentation/?id=tut102&sess=sess196).

## Coordinates

* Date: 14 November 2022
* Occasion: SC22 Tutorial
* Tutors: Simon Garcia (SNL), Andreas Herten (JSC), Markus Hrywniak (NVIDIA), Jiri Kraus (NVIDIA), Lena Oden (Uni Hagen)

## Setup

The tutorial is an interactive tutorial with introducing lectures and practical exercises to apply knowledge. The exercises have been derived from the Jacobi solver implementations available in [NVIDIA/multi-gpu-programming-models](https://github.com/NVIDIA/multi-gpu-programming-models).

Curriculum:

1. Lecture: Tutorial Overview, Introduction to System + Onboarding *Andreas*
2. Lecture: MPI-Distributed Computing with GPUs *Simon*
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

The supercomputer used for the exercises is [JUWELS Booster](https://apps.fz-juelich.de/jsc/hps/juwels/booster-overview.html), a system located at Jülich Supercomputing Centre (Germany) with about 3700 NVIDIA A100 GPUs.

Visual onboarding instructions can be found in the subfolder of the according lecture, `01b-H-Onboarding/`. Here follows the textual description:

* Register for an account at [JuDoor](https://judoor.fz-juelich.de/login)
* Sign-up for the [`training2232` project](https://judoor.fz-juelich.de/projects/join/training2125)
* Accept the Usage Agreement of JUWELS
* Wait for wheels to turn as your information is pushed through the systems (about 15 minutes)
* Access JUWELS Booster via [JSC's Jupyter portal](https://jupyter-jsc.fz-juelich.de/)
* Create a Jupyter instance using `LoginNodeBooster` and the `training2232` allocation on JUWELS *(see slides for screenshots)*
* When started, launch a browser-based Shell in Jupyter
* Source the course environment to introduce commands and helper script to environment
  ```
  source $PROJECT_training2232/env.sh
  ```
* Sync course material to your home directory with `jsc-material-sync`.
* *Recommended*: Install [Nsight Systems profiler](https://developer.nvidia.com/gameworksdownload#?dn=nsight-systems-2022-4) for third session (also available via [package managers](https://developer.download.nvidia.com/devtools/repos))
* **Slido**: [SC22_sess196](https://app.sli.do/event/gJM6zs4JMsoYT4fcJ3oWeP)

You can also access JSC's facilities via SSH. In that case you need to add your SSH key through JuDoor. You need to restrict access from certain IPs/IP ranges via the `from` clause, as explained [in the documentation](https://apps.fz-juelich.de/jsc/hps/juwels/access.html#ssh-login). We recommend using Jupyter JSC for its simplicity, especially during such a short day that is the tutorial day.