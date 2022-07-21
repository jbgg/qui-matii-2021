main=main

maintex=$(main).tex
mainpdf=$(main).pdf

texs=
tms=ec.tex

.SUFFIXES: .pdf .tm .tex

all: $(mainpdf)

$(mainpdf) : $(tex) $(tms)

.tex.pdf:
	latexmk -pdf $<

.tm.tex:
	tm < $< > $@

clean :
	latexmk -c
	rm -rf $(tms)
	rm -rf $(mainpdf)
