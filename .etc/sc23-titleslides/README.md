# Title Slide Injector

For the program package, the slides should all have a common title slide (_slide 0_).

It feels wrong to commit slidedecks with this slide 0 also to Github, so we add them in post-processing before sending slides to the conference.

The `prelude_slides.mk` Makefile takes care of the following steps:

* Make a template out of the LaTeX `title-slide.tex` which is called `title-slide.in.tex` by using `sed`
* Use the template to create TeX files (`title-slide.01.tex`, etc) for each of the title slides, by using `gen-titleslide.py` with parameters from `session.yml` (and `yq`)
* Typeset the created TeX files to PDFs in a temporary directory and copy them back to here
* Use `mutool` to create custom versions of the original slide decks which have a `-sc22.pdf` suffix


The `prelude_slides.mk` Makefile is pretty modular and can easily extended; remember also extend the `sessions.yml`.