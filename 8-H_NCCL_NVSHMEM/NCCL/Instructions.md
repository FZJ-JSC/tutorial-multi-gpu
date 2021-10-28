# SC21 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, 14 November 2021 8AM - 5PM CST
-   Location: *online*
-   Program Link: https://sc21.supercomputing.org/presentation/?id=tut138&sess=sess188


## Hands-On 8\_NCCL: Using NCCL for inter-GPU communication

### Task 0: Using NCCL device API

#### Description

The purpose of this task is to use the NCCL API instead of MPI to implement a multi-GPU jacobi solver. The starting point of this task is the MPI variant of the jacobi solver. You need to work on `TODOs` in `jacobi.cu`:

- Initialize NVSHMEM:
  - Include NCCL headers.
  - Un-comment NCCL\_CALL definition provided to handle NCCL errors
  - Define NCCL\_REAL\_TYPE for both double and float types
  - Create a NCCL unique ID, and initialize it
  - Create a NCCL communicator and initilize it 
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

