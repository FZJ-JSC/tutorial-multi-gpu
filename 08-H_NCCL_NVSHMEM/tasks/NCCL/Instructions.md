# SC24 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Sunday, November 17, 2024 8:30 AM to 5:30 PM
-   Location: B211, Atlanta Convention Center, Georgia, USA
-   Program Link:
    https://sc24.conference-program.com/presentation/?id=tut123&sess=sess412

## Hands-On 8-NCCL: Using NCCL for Inter-GPU Communication

### Task: Using NCCL

#### Description

The purpose of this task is to use NCCL instead of MPI to implement a multi-GPU jacobi solver. The starting point of this task is the MPI variant of the jacobi solver. You need to work on `TODOs` in `jacobi.cpp`:

- Include NCCL headers.
- Create a NCCL unique ID, and initialize it
- Create a NCCL communicator and initialize it
- Replace the MPI\_Sendrecv calls with ncclRecv and ncclSend calls for the warmup stage
- Replace MPI for the periodic boundary conditions with NCCL 
- Fix output message to indicate nccl rather than mpi
- Destroy NCCL communicator

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

