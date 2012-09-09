all: konspekt

konspekt: konspekt.tex
	pdflatex -interaction=nonstopmode $@
	pdflatex -interaction=nonstopmode $@

.PHONY: konspekt
