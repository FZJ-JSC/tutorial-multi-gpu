# SC26 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Sunday, November 15, 2026 8:30 AM to 5:00 PM
-   Location: W190b, Chicago, USA
-   Program Link:
    https://sc26.conference-program.com/presentation/?id=tut120&sess=sess190
## Hands-On 10C: Device-initiated Communication with NCCL

### Task: Using the NCCL device API

#### Description

The purpose of this task is to use the NCCL device API instead of the NCCL host API to implement a multi-GPU jacobi solver. The starting point of this task is the NCCL variant of the jacobi solver developed in Hands-On 8 (`ncclSend` and `ncclRecv`). You need to work on `TODOs` in `jacobi.cpp` and `jacobi_kernels.cu`:

- Set up the NCCL device API in `jacobi.cpp`:
  - Query the communicator properties (`ncclCommQueryProperties`) and check that the communicator supports the device API. The check for NCCL 2.28 or newer is already provided.
  - Create a device communicator `ncclDevComm` (`ncclDevCommCreate`) with the required LSA barrier and, if available, GIN signal, and destroy it (`ncclDevCommDestroy`).
  - Allocate work arrays `a` and `a_new` with `ncclMemAlloc` and register them as symmetric windows with `ncclCommWindowRegister`. Take care of passing in a consistent size!
  - Deregister the windows and free the buffers.
  - Swap the windows together with the work arrays.
  - The ranks of the top and bottom neighbors and their halo/boundary row indices (`top`, `bottom`, `iy_end_top`, `iy_start_bottom`) are already provided.
- Replace the host-initiated communication in `jacobi.cpp`:
  - Use `launch_jacobi_block_comm_kernel` to compute the new values and push the boundary rows directly to the neighbors from the kernel.
  - Replace `ncclSend` and `ncclRecv` with `launch_syncneighborhood_kernel` to synchronize with the neighbors.
  - Remove the warmup loop, which is not needed with the device API.
- Complete the device code in `jacobi_kernels.cu`:
  - `use_gin_for_peer` (device and host version): Decide if a peer is reached with GIN (GPU-initiated networking, e.g. on other nodes) or with plain loads and stores through the LSA (load/store accessible) domain (e.g. NVLink). Hint: `ncclTeamRankIsMember`, `ncclTeamLsa` and `ncclTeamWorld`.
  - `put_to_peer`: Use `ncclGetLsaPointer` to get a pointer to the window of a peer in the LSA domain and write the boundary row with plain stores.

The GIN code path (`ncclGin`) and the synchronization kernel are provided. With `-force_gin` the solver uses GIN also for peers in the LSA domain. This requires a system with GIN support.

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

`NCCL_HOME` needs to point to an NCCL installation of version 2.28 or newer.
