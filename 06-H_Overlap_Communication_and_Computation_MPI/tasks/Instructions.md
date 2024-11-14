# SC24 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Sunday, November 17, 2024 8:30 AM to 5:30 PM
-   Location: B211, Atlanta Convention Center, Georgia, USA
-   Program Link:
    https://sc24.conference-program.com/presentation/?id=tut123&sess=sess412
## Hands-On 6: Overlap Communication and Computation with MPI

You are now going to apply the concepts you learned in the lectures 4 and 5: Using profiling tools,
and applying them to implement overlapping MPI with GPU kernels. 

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

### Task 0: Profile the non-overlap MPI-CUDA version of the code

Use the Nsight System profiler to profile the starting point version non-Overlap MPI jacobi solver. The objective is to become familiar in navigating the GUI identify possible areas to overlap computation and communication. 

1. Start by compiling and running the application with `make run`
1. Record an Nsight Systems profile, using the appropriate Makefile target (`make profile`)
1. Open the recorded profile in the GUI
    - Either: Install Nsight Systems locally, and transfer the .nsys-rep file.
      - *Note*: Right-click in file-browser, choose "Download" from context menu
    - Or: By running Xpra in your browser: In Jupyter, select "File > New Launcher" and "Xpra Desktop", which will open in a new tab. Don't forget to source the environment in your `xterm`.
1. Familiarize yourself with the different rows and the traces they represent. 
    - See if you can correlate a CUDA API kernel launch call and the resulting kernel execution on the device
1. Follow the lecture steps and identify the relevant section with overlap potential in your code
    - Hint: Try navigating with the NVTX ranges.


### Task 1: Implement Communication/Computation overlap

Realize the optimization potential you discovered in the previous task and reduce the whitespace between kernel calls on the GPU profile by implementing communication/computation overlap.

You will need to separately calculate the boundary, and you should use high-priority streams. A less efficient (problem size-dependent) alternative to high-priority streams would be to launch the boundary processing kernels before the bulk kernel.
regions for the halo exchange.

The starting point of this task is the non-overlapping MPI variant of the Jacobi solver.
Follow the `TODO`s in `jacobi.cpp`:

- Query the priority range to be used by the CUDA streams
- Create new top and bottom CUDA streams and corresponding CUDA events
- Initialize all streams using priorities
- Modify the original call to `launch_jacobi_kernel` to not compute the top and bottom regions 
- Add additional calls to `launch_jacobi_kernel` for the top and bottom regions using the high-priority streams
- Wait on both top and bottom streams when calculating the norm
- Synchronize top and bottom streams before applying the periodic boundary conditions using MPI
- Destroy the additional cuda streams and events before ending the application


