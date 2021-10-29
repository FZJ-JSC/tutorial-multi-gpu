# SC21 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, 14 November 2021 8AM - 5PM CST
-   Location: *online*
-   Program Link: https://sc21.supercomputing.org/presentation/?id=tut138&sess=sess188


## Hands-On 6: Overlap Communication and Computation with MPI 

You are now going to apply the concepts you learned in the lectures 4 and 5: Using profiling tools,
and applying them to implement overlapping MPI with GPU kernels. 

### Task 0: Profile the non-overlap MPI-CUDA version of the code

Use the Nsight System profiler to profile the starting point version non-Overlap MPI jacobi solver. The objective is to become familiar in navigating the GUI identify possible areas to overlap computation and communication. 

1. Start by compiling and running the application with `make run`
1. Record an Nsight Systems profile, using the appropriate Makefile target (`make profile`)
1. Open the recorded profile in the GUI
    - Either: Install Nsight Systems locally, and transfer the .qdrep/.nsys-rep file
    - Or: By running Xpra in your browser: In Jupyter, select "File > New Launcher" and "Xpra Desktop", which will open in a new tab. Don't forget to source the environment in your `xterm`.
1. Familiarize yourself with the different rows and the traces they represent. 
    - See if you can correlate a CUDA API kernel launch call and the resulting kernel execution on the device
1. Follow the lecture steps and identify the relevant section with overlap potential in your code
    - Hint: Try navigating with the NVTX ranges.


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

