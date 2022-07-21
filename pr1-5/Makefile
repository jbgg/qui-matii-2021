main=main

tmtex=while-1.tex while-2.tex while-3.tex while-4.tex \
	while-5.tex while-6.tex while-7.tex while-8.tex \
	while-9.tex

maintex=$(main).tex
mainbbl=$(main).bbl
mainpdf=$(main).pdf

all : $(mainpdf)

.PHONY : $(mainpdf)

$(mainpdf) : $(maintex) $(tmtex)
	latexmk -pdf -use-make $<

%.tex : %.tm
	cat $< | tm > $@

%.pdf : %.mac
	maxima -b $<

clean :
	latexmk -c
	rm -rf $(mainbbl)
	rm -rf $(tmtex)
	rm -rf $(mainpdf)
