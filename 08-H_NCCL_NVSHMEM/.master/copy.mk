#!/usr/bin/make -f
.PHONY: tasks NCCL NVSHMEM
tasks: NCCL NVSHMEM
NCCL NVSHMEM:
	@cd $@ && \
		./copy.mk
