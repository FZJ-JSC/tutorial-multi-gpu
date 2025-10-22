#!/usr/bin/make -f
# For JSC Courses
# Generates a tar from all top-level directory in this current folder, without hidden files
# -Andreas Herten, 2021 April 27
#
# Changelog:
# * Nov 2022: The archive is extracted again, then slides.pdf is removed if a patched slides-sc22.pdf is found (which includes an SC22 slide 0 title slide); and then repackaged
.PHONY: all
all: tut113-multi-gpu.tar.gz

SOURCES=$(shell gfind . -maxdepth 1 -mindepth 1 -not -path "./.*" -not -name "tut113-multi-gpu.tar.gz" -printf '%P\n' | sort -h)

tut113-multi-gpu.tar.gz: $(shell find . -not -name "tut113-multi-gpu.tar.gz")
	sed -i '1 i***Please check GitHub repo for latest version of slides: https://github.com/FZJ-JSC/tutorial-multi-gpu/ ***\n' README.md
	tar czf $@ --transform 's,^,SC25-tut113-Multi-GPU/,' --exclude=".*" $(SOURCES)
	tar xf $@
	rm $@
	find SC25-tut113-Multi-GPU/ -not -path './.*' -iname 'slides-*.pdf' -execdir rm slides.pdf \;
	tar czf $@ SC25-tut113-Multi-GPU
	rm -rf SC25-tut113-Multi-GPU
	sed -i '1,2d' README.md