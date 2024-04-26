# ISC24 Tutorial: Efficient Distributed GPU Programming for Exascale

-   Time: Sunday, May 12, 2024 9:00 AM to 6:00 PM CEST
-   Location: Hall Y8 - 2nd floor, Congress Center Hamburg, Germany
-   Program Link:
    https://app.swapcard.com/widget/event/isc-high-performance-2024/planning/UGxhbm5pbmdfMTgyNTY0MQ== 

## Hands-On 10B: Using CUDA Graphs

### Task: Combining CUDA Graphs with NCCL for Inter-GPU Communication

#### Description

The purpose of this task is to introduce [CUDA Graphs](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#cuda-graphs).
For that, the NCCL version of the Jacobi solver developed in hands-on 8 is modified to use the
[CUDA Graph Management API](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html#group__CUDART__GRAPH)
so that the CUDA API calls required in the main solver loop are minimized. You need to work on `TODOs` in `jacobi.cpp`:

- Use [`cudaStreamBeginCapture`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__STREAM.html#group__CUDART__STREAM_1g793d7d4e474388ddfda531603dc34aa3) and [`cudaStreamEndCapture`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__STREAM.html#group__CUDART__STREAM_1gf5a0efebc818054ceecd1e3e5e76d93e) to create the necessary graphs.
  - Read the comment at the top of the `PUSH_RANGE("Build graphs", 0)` structured block.
- Instantiate captured graphs with [`cudaGraphInstantiateWithFlags`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html#group__CUDART__GRAPH_1ga2c652a24ba93e52b99a47bec0888233).
  - Extra: Experiment (compare Nsight Systems timelines) with [`cudaGraphInstantiate`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html#group__CUDART__GRAPH_1gb25beab33abe4b2d13edbb6e35cb72ff) not using `cudaGraphInstantiateFlagUseNodePriority`.
- Optional: Manually upload instantiated graphs with [`cudaGraphUpload`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html#group__CUDART__GRAPH_1ge546432e411b4495b93bdcbf2fc0b2bd).
- Use [`cudaGraphLaunch`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html#group__CUDART__GRAPH_1g1accfe1da0c605a577c22d9751a09597) to launch a single graph per iteration instead of launching multiple kernels in different streams and managing their dependencies with `cudaEventRecord` and `cudaStreamWaitEvent`.
- Free resources with [`cudaGraphDestroy`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html#group__CUDART__GRAPH_1ga351557d4d9ecab23d56395599b0e069) and [`cudaGraphExecDestroy`](https://docs.nvidia.com/cuda/cuda-runtime-api/group__CUDART__GRAPH.html#group__CUDART__GRAPH_1g6d101c2cbc6dea2b4fba0fbe407eb91f).

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
