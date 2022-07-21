main=main

maintex=$(main).tex
mainpdf=$(main).pdf

texs=
tms=compuesta.tex

.SUFFIXES: .pdf .tm .tex

all: $(mainpdf)

lagrange1.pdf : lagrange.tex

$(mainpdf) : $(tex) $(tms)

.tex.pdf:
	latexmk -pdf $<

.tm.tex:
	tm < $< > $@

clean :
	latexmk -c
	rm -rf $(tms)
	rm -rf $(mainpdf)
