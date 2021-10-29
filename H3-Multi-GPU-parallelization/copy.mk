#!/usr/bin/make -f
# Copyright (c) 2021, NVIDIA CORPORATION. All rights reserved.
TASKDIR = ../../tasks/H3-Multi-GPU-parallelization
SOLUTIONDIR = ../../solutions/H3-Multi-GPU-parallelization
OPT_SOLUTIONDIR = ../../solutions/H3-Multi-GPU-parallelization_opt

PROCESSFILES = jacobi.cu
COPYFILES = Makefile Instructions.ipynb Instructions.md


TASKPROCCESFILES = $(addprefix $(TASKDIR)/,$(PROCESSFILES))
TASKCOPYFILES = $(addprefix $(TASKDIR)/,$(COPYFILES))
SOLUTIONPROCCESFILES = $(addprefix $(SOLUTIONDIR)/,$(PROCESSFILES))
OPT_SOLUTIONPROCCESFILES = $(addprefix $(OPT_SOLUTIONDIR)/,$(PROCESSFILES))
SOLUTIONCOPYFILES = $(addprefix $(SOLUTIONDIR)/,$(COPYFILES))
OPT_SOLUTIONCOPYFILES = $(addprefix $(OPT_SOLUTIONDIR)/,$(COPYFILES))


.PHONY: all task
all: task
task: ${TASKPROCCESFILES} ${TASKCOPYFILES} ${SOLUTIONPROCCESFILES} ${SOLUTIONCOPYFILES} ${OPT_SOLUTIONPROCCESFILES} ${OPT_SOLUTIONCOPYFILES}


${TASKPROCCESFILES}: $(PROCESSFILES)
	mkdir -p $(TASKDIR)/
	cppp -USOLUTION -USOLUTION_OPT $(notdir $@) $@

${SOLUTIONPROCCESFILES}: $(PROCESSFILES)
	mkdir -p $(SOLUTIONDIR)/
	cppp -DSOLUTION -USOLUTION_OPT $(notdir $@) $@

${OPT_SOLUTIONPROCCESFILES}: $(PROCESSFILES)
		mkdir -p $(OPT_SOLUTIONDIR)/
		cppp -DSOLUTION -DSOLUTION_OPT $(notdir $@) $@

${TASKCOPYFILES}: $(COPYFILES)
	mkdir -p $(TASKDIR)/
	cp $(notdir $@) $@

${SOLUTIONCOPYFILES}: $(COPYFILES)
	mkdir -p $(SOLUTIONDIR)/
	cp $(notdir $@) $@

${OPT_SOLUTIONCOPYFILES}: $(COPYFILES)
	mkdir -p $(OPT_SOLUTIONDIR)/
	cp $(notdir $@) $@

%.ipynb: %.md
	pandoc $< -o $@
	# add metadata so this is seen as python
	jq -s '.[0] * .[1]' $@ ../template.json | sponge $@
