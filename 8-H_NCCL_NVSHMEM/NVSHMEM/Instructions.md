# SC21 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, 14 November 2021 8AM - 5PM CST
-   Location: *online*
-   Program Link: https://sc21.supercomputing.org/presentation/?id=tut138&sess=sess188


## Hands-On 8\_NVSHMEM: Host-initiated Communication with NVSHMEM

### Task 0: Using NVSHMEM device API

#### Description

The purpose of this task is to use the NVSHMEM host API instead of MPI to implement a multi-GPU jacobi solver. The starting point of this task is the MPI variant of the jacobi solver. You need to work on `TODOs` in `jacobi.cu`:

- Initialize NVSHMEM:
  - Include NVSHMEM headers.
  - Initialize NVSHMEM using `MPI_COMM_WORLD`.
  - Allocate work arrays `a` and `a_new` from the NVSHMEM symmetric heap. Take care of passing in a consistent size!
  - Calculate halo/boundary row index of top and bottom neighbors.
  - Add necessary inter PE synchronization.
  - Replace MPI periodic boundary conditions with `nvshmemx_float_put_on_stream` to directly push values needed by top and bottom neighbors.
  - Deallocate memory from the NVSHMEM symetric heap.
  - Finalize NVSHMEM before existing the application

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

