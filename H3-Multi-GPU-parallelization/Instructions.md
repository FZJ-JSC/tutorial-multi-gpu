# SC21 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, 14 November 2021 8AM - 5PM CST
-   Location: *online*
-   Program Link: https://sc21.supercomputing.org/presentation/?id=tut138&sess=sess188


## Hands-ON 5: Multi GPU parallelization with CUDA-aware MPI

## Task 1: Parallelize the jacobi solver for multiple GPUs using CUDA-aware MPI

#### Description
The purpose of this task is to use CUDA-aware MPI to parallelize a jacobi solver. The starting point of this task is a skeleton `jacobi.cu`, in which the CUDA kernel is already defined and also some basic-setup functions are already present.
There is also a single-GPU version with which the performance and numerical results are compared.
Take some time to get familiar with the code. Some functions (like NVTX) will be explained in the next tutorial. They can be ignored for now (e.g. PUSH and POP functions).
Once you are familiar with the code,  you need to work on `TODOs` in `jacobi.cu`:

- Initialize the MPI application
  - Include the MPI header file
  - Determine the local rank and the number of MPI processes
  - Use a local communicator to assign one GPU to each MPI process
  - Finalize MPI at the end of the application
- Compute the 1-D domain decomposition
  - Compute the local chunk size to distribute (ny-2) lines among the process
    - in case `(ny-2)%size != 0` the last process should calculate the remaining rows
  - determine the global (`iy_start_global, iy_end_global`) and local (`iy_start, iy_end`) start and end points in the 2-dimensional grid.
- Use MPI to exchange the boundaries
  - Compute the top and the bottom neighbor
    - we are using reflecting boundaries on top and bottom, so rank0's Top neighbor is (size-1) and rank(size-1) bottom neighbor is rank 0
  - Use MPI_Sendrecv to exchange data between the neighbors
    - use the self-defined MPI_REAL_TYPE. This allows an easy switch between single- and double precision


Compile with

``` {.bash}
make
```

Submit your compiled application to the batch system with

``` {.bash}
make run
```

## Task 1: Optimize load balancing

- The work distribution of the first task is not ideal, because it can lead to the process with the last rank having to calculate significantly more than all the others. Therefore, the load distribution is to be optimized in this task.
- Compute the `chunk_size` that each rank gets either (ny - 2) / size or (ny - 2) / size + 1 rows.
- Compute how many processes get  (ny - 2) / size resp (ny - 2) / size + 1 rows
- Adapt the computation of (`iy_start_global`)
