# ISC23 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, 21 May 2023 9:00 - 18:00 CEST
-   Location: Hall Y8, Congress Center Hamburg, Germany
-   Program Link:
    https://app.swapcard.com/widget/event/isc-high-performance-2023/planning/UGxhbm5pbmdfMTIyMDc5OA==

## Hands-On 8-NCCL: Using NCCL for Inter-GPU Communication

### Task: Using NCCL

#### Description

The purpose of this task is to use NCCL instead of MPI to implement a multi-GPU jacobi solver. The starting point of this task is the MPI variant of the jacobi solver. You need to work on `TODOs` in `jacobi.cpp`:

- Initialize NCCL:
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

