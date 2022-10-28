#!/usr/bin/make -f

INPUT=01-L_Introduction_Overview/slides.pdf 01b-H_Onboarding/slides.pdf 02-L_Introduction_to_MPI-Distributed_Computing_with_GPUs/slides.pdf
OUTPUT=$(addsuffix -sc22.pdf,$(basename ${INPUT}))

.PHONY: all
all: $(OUTPUT)

%-sc22.pdf: %.pdf
	echo $@ $<