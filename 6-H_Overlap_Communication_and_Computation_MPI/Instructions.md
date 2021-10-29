# SC21 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, 14 November 2021 8AM - 5PM CST
-   Location: *online*
-   Program Link: https://sc21.supercomputing.org/presentation/?id=tut138&sess=sess188


## Hands-On 6: Overlap Communication and Computation with MPI 

### Task 0: Profile the non-Overlap MPI-CUDA version of the code using Nsight Systems to discover areas of possible compute/communication overlap

#### Description
The purpose of this task is to use the Nsight System profiler to profile the starting point version non-Overlap MPI jacobi solver. The objective is to become familiar in navigating the GUI identify possible areas to overlap computation and communication. 

- STEPS TO BE ADDED HERE

### Task 1: Overlap Communication and Computation using high priority streams and hide launch time for halo processing kernels

#### Description

The purpose of this task is to overlap computation and communication based on the profiling done during the previus task. The starting point of this task is the non-Overlap MPI variant of the jacobi solver. You need to work on `TODOs` in `jacobi.cu`:

- Initialize a priority range to be used by the CUDA streams
- Create new top and bottom CUDA streams and corresponding CUDA events
- Initialize all streams using priorities
- Modify the original jacobi kernel launch to not compute the top and bottom regions 
- Launch additional jacobi kernels for the top and bottom regions using the high-priority streams
- Wait on both top and bottom streams when calculating the norm
- Synchronize top and bottom streams before applying the periodic boundary conditions using MPI
- Destroy the additional cuda streams and events before ending the application

Compile with

``` {.bash}
make
```

Submit your compiled application to the batch system with

``` {.bash}
make run
```

Study the performance by glimpsing at the profile generated with
`make profile`. For `make run` and `make profile` the environment variable `NP` can be set to change the number of processes.

