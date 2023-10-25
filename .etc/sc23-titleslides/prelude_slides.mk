#!/usr/bin/make -f
# LAUNCH FROM THIS FOLDER

# OUTPUT=../../01-L_Introduction_Overview/slides-sc23.pdf ../../01b-H_Onboarding/slides-sc23.pdf ../../04-L_Performance_and_debugging_tools/slides-sc23.pdf ../../11-L_Summary_Advanced/slides-sc23.pdf
OUTPUT=../../01-L_Introduction_Overview/slides-sc23.pdf ../../01b-H_Onboarding/slides-sc23.pdf ../../02-L_Introduction_to_MPI-Distributed_Computing_with_GPUs/slides-sc23.pdf ../../04-L_Performance_and_debugging_tools/slides-sc23.pdf ../../05-L_Optimization_techniques_for_multi-GPU_applications/slides-sc23.pdf ../../07-L_Overview_of_NCCL_and_NVSHMEM_in_MPI_Programs/slides-sc23.pdf ../../09-L_CUDA_Graphs_and_Device-initiated_Communication_with_NVSHMEM/slides-sc23.pdf ../../11-L_Summary_Advanced/slides-sc23.pdf

.PHONY: all
all: $(OUTPUT)
MYTMPDIR:=$(shell mktemp -d)

title-slide.in.tex: title-slide.tex
	cat $< | \
	sed 's#INSERT TITLE HERE#((( title )))#' | \
	sed 's#Insert Author Here#((( author )))#' > \
	$@

title-slide.01.tex ../../01-L_Introduction_Overview/slides-sc23.pdf: SESSIONKEY=01
title-slide.01b.tex ../../01b-H_Onboarding/slides-sc23.pdf: SESSIONKEY=01b
title-slide.02.tex ../../02-L_Introduction_to_MPI-Distributed_Computing_with_GPUs/slides-sc23.pdf: SESSIONKEY=02
title-slide.04.tex ../../04-L_Performance_and_debugging_tools/slides-sc23.pdf: SESSIONKEY=04
title-slide.05.tex ../../05-L_Optimization_techniques_for_multi-GPU_applications/slides-sc23.pdf: SESSIONKEY=05
title-slide.07.tex ../../07-L_Overview_of_NCCL_and_NVSHMEM_in_MPI_Programs/slides-sc23.pdf: SESSIONKEY=07
title-slide.09.tex ../../09-L_CUDA_Graphs_and_Device-initiated_Communication_with_NVSHMEM/slides-sc23.pdf: SESSIONKEY=09
title-slide.11.tex ../../11-L_Summary_Advanced/slides-sc23.pdf: SESSIONKEY=11
title-slide.01.tex title-slide.01b.tex title-slide.02.tex title-slide.04.tex title-slide.05.tex title-slide.07.tex title-slide.09.tex title-slide.11.tex: title-slide.tex
	python3 gen-titleslide.py --author "$(shell cat sessions.yml | yq .$(SESSIONKEY).author)" --title "$(shell cat sessions.yml | yq .$(SESSIONKEY).title)" --out "$@"

../../01-L_Introduction_Overview/slides-sc23.pdf: BASEDECK=../../01-L_Introduction_Overview/slides.pdf
../../01b-H_Onboarding/slides-sc23.pdf: BASEDECK=../../01b-H_Onboarding/slides.pdf
../../02-L_Introduction_to_MPI-Distributed_Computing_with_GPUs/slides-sc23.pdf: BASEDECK=../../02-L_Introduction_to_MPI-Distributed_Computing_with_GPUs/slides.pdf
../../04-L_Performance_and_debugging_tools/slides-sc23.pdf: BASEDECK=../../04-L_Performance_and_debugging_tools/slides.pdf
../../05-L_Optimization_techniques_for_multi-GPU_applications/slides-sc23.pdf: BASEDECK=../../05-L_Optimization_techniques_for_multi-GPU_applications/slides.pdf
../../07-L_Overview_of_NCCL_and_NVSHMEM_in_MPI_Programs/slides-sc23.pdf: BASEDECK=../../07-L_Overview_of_NCCL_and_NVSHMEM_in_MPI_Programs/slides.pdf
../../09-L_CUDA_Graphs_and_Device-initiated_Communication_with_NVSHMEM/slides-sc23.pdf: BASEDECK=../../09-L_CUDA_Graphs_and_Device-initiated_Communication_with_NVSHMEM/slides.pdf
../../11-L_Summary_Advanced/slides-sc23.pdf: BASEDECK=../../11-L_Summary_Advanced/slides.pdf

.SECONDEXPANSION:
%-sc23.pdf: %.pdf  title-slide.$$(SESSIONKEY).tex $(BASEDECK)
	latexmk -output-directory=$(MYTMPDIR) -jobname=${SESSIONKEY} -pdfxe title-slide.$(SESSIONKEY).tex
	cp $(MYTMPDIR)/${SESSIONKEY}.pdf title-slide.$(SESSIONKEY).pdf
	papersize=$(shell pdfinfo title-slide.$(SESSIONKEY).pdf | awk '/^Page size:/ {printf "{%fbp,%fbp}", $$3, $$5}') && \
		pdfjam --outfile tmp.pdf --papersize "$$papersize" $(BASEDECK)
	mutool merge -o $@ title-slide.$(SESSIONKEY).pdf 0 tmp.pdf
	rm tmp.pdf