main=main

maintex=$(main).tex
mainpdf=$(main).pdf

input-tex=intro.tex biseccion.tex
input-tm=biseccion-1.tex

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
