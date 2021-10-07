#!/usr/bin/make -f
# Copyright (c) 2021, NVIDIA CORPORATION. All rights reserved.
TASKDIR = ../../tasks/10-H_Device-initiated_Communication_with_NVSHMEM
SOLUTIONDIR = ../../solutions/10-H_Device-initiated_Communication_with_NVSHMEM

PROCESSFILES = jacobi.cu
COPYFILES = Makefile Instructions.ipynb Instructions.md


TASKPROCCESFILES = $(addprefix $(TASKDIR)/,$(PROCESSFILES))
TASKCOPYFILES = $(addprefix $(TASKDIR)/,$(COPYFILES))
SOLUTIONPROCCESFILES = $(addprefix $(SOLUTIONDIR)/,$(PROCESSFILES))
SOLUTIONCOPYFILES = $(addprefix $(SOLUTIONDIR)/,$(COPYFILES))

.PHONY: all task
all: task
task: ${TASKPROCCESFILES} ${TASKCOPYFILES} ${SOLUTIONPROCCESFILES} ${SOLUTIONCOPYFILES}


${TASKPROCCESFILES}: $(PROCESSFILES)
	mkdir -p $(TASKDIR)/
	cppp -USOLUTION $(notdir $@) $@
	
${SOLUTIONPROCCESFILES}: $(PROCESSFILES)
	mkdir -p $(SOLUTIONDIR)/
	cppp -DSOLUTION $(notdir $@) $@


${TASKCOPYFILES}: $(COPYFILES)
	mkdir -p $(TASKDIR)/
	cp $(notdir $@) $@
	
${SOLUTIONCOPYFILES}: $(COPYFILES)
	mkdir -p $(SOLUTIONDIR)/
	cp $(notdir $@) $@

%.ipynb: %.md
	pandoc $< -o $@
	# add metadata so this is seen as python
	jq -s '.[0] * .[1]' $@ ../template.json | sponge $@
