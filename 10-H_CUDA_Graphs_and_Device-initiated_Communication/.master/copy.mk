#!/usr/bin/make -f
.PHONY: tasks Device-initiated_Communication_with_NVSHMEM Using_CUDA_Graphs
tasks: Device-initiated_Communication_with_NVSHMEM Using_CUDA_Graphs
Device-initiated_Communication_with_NVSHMEM Using_CUDA_Graphs:
	@cd $@ && \
		./copy.mk