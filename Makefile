all: konspekt praca

konspekt: konspekt.tex
	pdflatex -interaction=nonstopmode $@
	pdflatex -interaction=nonstopmode $@

praca:
	$(MAKE) -C praca

.PHONY: konspekt praca
