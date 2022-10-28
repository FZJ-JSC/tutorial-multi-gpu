# SC22 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Monday, 14 November 2022 8:30AM - pPM CST
-   Location: D163, Kay Bailey Hutchison Convention Center Dallas
-   Program Link:
    https://sc22.supercomputing.org/presentation/?id=tut102&sess=sess196

## Hands-On 8-NVSHMEM: Host-initiated Communication with NVSHMEM

### Task: Using NVSHMEM device API

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

#### Note

The Slurm installation on JUWELS-Booster sets `CUDA_VISIBLE_DEVICES` automatically so that each spawned process only sees the GPU it should use (see [GPU Devices](https://apps.fz-juelich.de/jsc/hps/juwels/booster-overview.html#gpu-devices) in the JUWELS Booster Overview documentation). This is not supported for NVSHMEM. The automatic setting of `CUDA_VISIBLE_DEVICES` can be disabled by setting `CUDA_VISIBLE_DEVICES=0,1,2,3` in the shell that executes srun. With `CUDA_VISIBLE_DEVICES` set all spawned processes can see all GPUs listed. This is automatically done for the `sanitize`, `run` and `profile` make targets.

