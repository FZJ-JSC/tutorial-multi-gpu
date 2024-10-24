# SC24 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Sunday, November 17, 2024 8:30 AM to 5:30 PM
-   Location: B211, Atlanta Convention Center, Georgia, USA
-   Program Link:
    https://sc24.conference-program.com/presentation/?id=tut123&sess=sess412
## Hands-On 3: Multi-GPU Parallelization with CUDA-aware MPI

### Task: Parallelize Jacobi Solver for Multiple GPUs using CUDA-aware MPI

#### Description
The purpose of this task is to use CUDA-aware MPI to parallelize a Jacobi solver. The starting point of this task is a skeleton `jacobi.cu`, in which the CUDA kernel is already defined and also some basic setup functions are present.
There is also a single-GPU version with which the performance and numerical results are compared.
Take some time to get familiar with the code. Some functions (like NVTX) will be explained in next sessions. They can be ignored for now (e.g. the `PUSH` and `POP` macros).
Once you are familiar with the code, please work on the `TODOs` in `jacobi.cu`:

   - Get the available GPU devices and use it and the local rank to set the active GPU for each process 
   - Compute the top and bottom neigbhors. We are using reflecting/periodic boundaries on top and bottom, so rank0's Top neighbor is (size-1) and rank(size-1) bottom neighbor is rank 0
  - Use MPI_Sendrecv to exchange data between the neighbors
    - use CUDA-aware MPI, so the send - and the receive buffers are located in GPU-memory 
    - The first newly calculated row ('iy_start') is sent to the top neigbor and the bottom boundary row (`iy_end`) is received from the bottom process.
    - The last calculated row (`iy_end-1`) is send to the bottom process and the top boundary (`0`) is received from the top 
    - Don't forget to synchronize the computation on the GPU before starting the data transfer 
    - use the self-defined MPI_REAL_TYPE. This allows an easy switch between single- and double precision


Compile with

``` {.bash}
make
```

Submit your compiled application to the batch system with

``` {.bash}
make run
```

## Advanced Task: Optimize Load Balancing

### Description
- The work distribution of the first task is not ideal, because it can lead to the process with the last rank having to calculate significantly more than all the others. Therefore, the load distribution is to be optimized in this task.
- Compute the `chunk_size` that each rank gets either (ny - 2) / size or (ny - 2) / size + 1 rows.
- Compute how many processes get  (ny - 2) / size resp (ny - 2) / size + 1 rows
- Adapt the computation of (`iy_start_global`)
