# PRACE CUDA Course 2021

-   Date: 26 - 30 April 2021
-   Location: *online*
-   Institue: Jülich Supercomputing Centre


## Session 1: GPU Introduction

### Task 6: Scale Vector, with Hints

#### Setup

See `~/CUDA-Course/1-Basics/exercises/tasks/06-Scale-Vector-Hints`

#### Description

To tune movement of data allocated in Unified Memory, augment the code
in `scale_vector_um.cu` with information about data locality and
movement.

Compile with

``` {.bash}
make
```

Submit your compiled application to the batch system with

``` {.bash}
make run
```

Study the performance by glimpsing at the profile generated with
`make profile`.