
main=main

maintex=$(main).tex
mainbbl=$(main).bbl
mainpdf=$(main).pdf

all : $(mainpdf)

.PHONY : $(mainpdf)

$(mainpdf) : $(maintex)
	latexmk -pdf -use-make $<

%.pdf : %.mac
	maxima -b $<

clean :
	latexmk -c
	rm -rf $(mainbbl)
	rm -rf $(mainpdf)
