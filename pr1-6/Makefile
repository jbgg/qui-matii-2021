main=main

maintex=$(main).tex
mainpdf=$(main).pdf

input-tex=precision.tex errores.tex ex.tex
input-tm=precision-1.tex precision-2.tex \
	errores-1.tex errores-2.tex

.SUFFIXES: .pdf .tm .tex

all: $(mainpdf)

$(mainpdf) : $(input-tex) $(input-tm)

.tex.pdf:
	latexmk -pdf $<

.tm.tex:
	tm < $< > $@

clean :
	latexmk -c
	rm -rf $(input-tm)
	rm -rf $(mainpdf)
