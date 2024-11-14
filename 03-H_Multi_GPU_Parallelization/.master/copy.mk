#!/usr/bin/make -f
# Copyright (c) 2021, NVIDIA CORPORATION. All rights reserved.
TASKDIR = ../tasks/
SOLUTIONDIR = ../solutions/
OPT_SOLUTIONDIR = ../solutions/advanced/

IYPNB_TEMPLATE = ../../.template.json

PROCESSFILES = jacobi.cu
COPYFILES = Instructions.ipynb Instructions.md


TASKPROCCESFILES = $(addprefix $(TASKDIR)/,$(PROCESSFILES))
TASKCOPYFILES = $(addprefix $(TASKDIR)/,$(COPYFILES))
SOLUTIONPROCCESFILES = $(addprefix $(SOLUTIONDIR)/,$(PROCESSFILES))
OPT_SOLUTIONPROCCESFILES = $(addprefix $(OPT_SOLUTIONDIR)/,$(PROCESSFILES))
SOLUTIONCOPYFILES = $(addprefix $(SOLUTIONDIR)/,$(COPYFILES))
OPT_SOLUTIONCOPYFILES = $(addprefix $(OPT_SOLUTIONDIR)/,$(COPYFILES))
MAKEFILES = $(addsuffix /Makefile,$(TASKDIR) $(SOLUTIONDIR) $(OPT_SOLUTIONDIR))


.PHONY: all task
all: task
task: ${TASKPROCCESFILES} ${TASKCOPYFILES} ${SOLUTIONPROCCESFILES} ${SOLUTIONCOPYFILES} ${OPT_SOLUTIONPROCCESFILES} ${OPT_SOLUTIONCOPYFILES} ${MAKEFILES}

$(TASKDIR)/Makefile: Makefile.in
	sed -e 's/@@TASKSOL@@/task/' $< > $@
$(SOLUTIONDIR)/Makefile: Makefile.in
	sed -e 's/@@TASKSOL@@/sol/' $< > $@
$(OPT_SOLUTIONDIR)/Makefile: Makefile.in
	sed -e 's/@@TASKSOL@@/solopt/' $< > $@

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
	jq -s '.[0] * .[1]' $@ $(IYPNB_TEMPLATE) | sponge $@
