all: praca

praca: IPS.tex
	pdflatex -interaction=nonstopmode $^
	bibtex IPS
	pdflatex -interaction=nonstopmode $^
#	pdflatex -interaction=nonstopmode $^

.PHONY: praca
