#!/usr/bin/make -f
.PHONY: tasks Device-initiated_Communication_with_NVSHMEM Device-initiated_Communication_with_NCCL Using_CUDA_Graphs
tasks: Device-initiated_Communication_with_NVSHMEM Device-initiated_Communication_with_NCCL Using_CUDA_Graphs
Device-initiated_Communication_with_NVSHMEM Device-initiated_Communication_with_NCCL Using_CUDA_Graphs:
	@cd $@ && \
		./copy.mk