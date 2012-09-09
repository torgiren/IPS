all: konspekt

konspekt: konspekt.tex
	pdflatex -interaction=nonstopmode $@

.PHONY: konspekt
