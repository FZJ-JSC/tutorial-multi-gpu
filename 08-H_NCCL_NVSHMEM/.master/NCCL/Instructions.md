# SC22 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Monday, 14 November 2022 8:30AM - pPM CST
-   Location: D163, Kay Bailey Hutchison Convention Center Dallas
-   Program Link:
    https://sc22.supercomputing.org/presentation/?id=tut102&sess=sess196

## Hands-On 8-NCCL: Using NCCL for Inter-GPU Communication

### Task: Using NCCL

#### Description

The purpose of this task is to use NCCL instead of MPI to implement a multi-GPU jacobi solver. The starting point of this task is the MPI variant of the jacobi solver. You need to work on `TODOs` in `jacobi.cpp`:

- Initialize NVSHMEM:
  - Include NCCL headers.
  - Create a NCCL unique ID, and initialize it
  - Create a NCCL communicator and initilize it
  - Replace the MPI\_Sendrecv calls with ncclRecv and ncclSend calls for the warmup stage
  - Replace MPI for the periodic boundary conditions with NCCL 
  - Fix output message to indicate nccl rather than mpi
  - Destroy NCCL comunicator

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

