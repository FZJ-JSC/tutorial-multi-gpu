# SC21 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, 14 November 2021 8AM - 5PM CST
-   Location: *online*
-   Program Link: https://sc21.supercomputing.org/presentation/?id=tut138&sess=sess188


## Hands-On 10: Device-initiated Communication with NVSHMEM

### Task 0: Using NVSHMEM device API

#### Description

The purpose of this task is to use the NVSHMEM device API instead of MPI to implement a multi-GPU jacobi solver. The starting point of this task is the MPI variant of the jacobi solver. You need to work on `TODOs` in `jacobi.cu`:

- Initialize NVSHMEM (same as in Hans-On 8-H):
  - Include NVSHMEM headers.
  - Initialize and shutdown NVSHMEM using `MPI_COMM_WORLD`.
  - Allocate work arrays `a` and `a_new` from the NVSHMEM symmetric heap. Take care of passing in a consistent size!
  - Calculate halo/boundary row index of top and bottom neighbors.
  - Add necessary inter PE synchronization.
- Modify `jacobi_kernel`
  - Pass in halo/boundary row index of top and bottom neighbors.
  - Use `nvshmem_float_p` to directly push values needed by top and bottom neighbors from the kernel.
  - Remove no longer needed MPI communication.

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

### Task 1: Use `nvshmemx_float_put_nbi_block`

#### Description

This is an optional Task to use `nvshmemx_float_put_nbi_block` instead of `nvshmem_float_p` for more efficient multi node execution. There are no TODOs prepared. Use the solution of Task 0 as a starting point. Some tips:

- You only need to change `jacobi_kernel`.
- Switching to a 1-dimensional CUDA block can simplify the task.
- The difficult part is calculating the right offsets and size for calling into `nvshmemx_float_put_nbi_block`.
- If a CUDA blocks needs to communicate data with `nvshmemx_float_put_nbi_block` all threads in that block need to call into `nvshmemx_float_put_nbi_block`.
- The [`nvshmem_opt`](https://github.com/NVIDIA/multi-gpu-programming-models/blob/master/nvshmem_opt/jacobi.cu#L154) variant in the [Multi GPU Programming Models Github repository](https://github.com/NVIDIA/multi-gpu-programming-models) implements the same strategy.
