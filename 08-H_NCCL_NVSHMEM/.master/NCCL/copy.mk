#!/usr/bin/make -f
# Copyright (c) 2021, NVIDIA CORPORATION. All rights reserved.
TASKDIR = ../../tasks/NCCL
SOLUTIONDIR = ../../solutions/NCCL

IYPNB_TEMPLATE = ../../../.template.json

PROCESSFILES = jacobi.cpp
COPYFILES = jacobi_kernels.cu Instructions.ipynb Instructions.md


TASKPROCCESFILES = $(addprefix $(TASKDIR)/,$(PROCESSFILES))
TASKCOPYFILES = $(addprefix $(TASKDIR)/,$(COPYFILES))
SOLUTIONPROCCESFILES = $(addprefix $(SOLUTIONDIR)/,$(PROCESSFILES))
SOLUTIONCOPYFILES = $(addprefix $(SOLUTIONDIR)/,$(COPYFILES))
MAKEFILES = $(addsuffix /Makefile,$(TASKDIR) $(SOLUTIONDIR))

.PHONY: all task
all: task
task: ${TASKPROCCESFILES} ${TASKCOPYFILES} ${SOLUTIONPROCCESFILES} ${SOLUTIONCOPYFILES} ${MAKEFILES}

$(TASKDIR)/Makefile: Makefile.in
	sed -e 's/@@TASKSOL@@/task/' $< > $@
$(SOLUTIONDIR)/Makefile: Makefile.in
	sed -e 's/@@TASKSOL@@/sol/' $< > $@

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
	jq -s '.[0] * .[1]' $@ $(IYPNB_TEMPLATE) | sponge $@
