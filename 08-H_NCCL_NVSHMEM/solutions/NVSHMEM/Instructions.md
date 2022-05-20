# ISC22 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, 29 May 2022 9AM - 6PM CEST
-   Location: Hall Y6, Congress Center Hamburg (CCH)
-   Program Link:
    https://app.swapcard.com/widget/event/isc-high-performance-2022/planning/UGxhbm5pbmdfODYxMTQ2

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

`NVSHMEM_DISABLE_CUDA_VMM=1` is set for the `sanitize`, `run` and `profile` make targets. This is done to hide warnings and errors appearing only for NVSHMEM version 2.5.0 to be fixed in the next release. You might still see cuMemFree, symmetric heap, and `nvshmem_finalize` errors at the end of the program execution, depending on the system used to run the program. You may ignore these errors for now.
