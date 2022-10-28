#!/usr/bin/env bash

# LAUNCH FROM ROOT OF REPO

suffix=sc22
files=( "01-L_Introduction_Overview/slides.pdf" "01b-H_Onboarding/slides.pdf" "02-L_Introduction_to_MPI-Distributed_Computing_with_GPUs/slides.pdf")
titleslides=".etc/sc22-titleslides/title-slides.pdf"

for i in ${!files[@]}; do
	inputfile=${files[$i]}
	outputfile="${inputfile%.*}"-${suffix}.pdf
	mutool merge -o ${outputfile} ${titleslides} $(($i + 1)) ${inputfile}
done