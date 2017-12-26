FILENAME := doc
TEX_SRCS := $(wildcard *.tex)
TEX_SRCS := $(wildcard */*.tex)

.PHONY: $(FILENAME).pdf
$(FILENAME).pdf :
	pdflatex main.tex
	bibtex main
	makeindex main.nlo -s nomencl.ist -o main.nls
	pdflatex main.tex
	pdflatex main.tex
	mv main.pdf $(FILENAME).pdf
	rm main.aux main.log

clean:
	rm -f *.aux *.bbl *.blg *.ilg *.log *.nlo *.nls *.thm *.toc
