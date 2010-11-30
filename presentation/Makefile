SHELL=/bin/bash
TEX=presentation.tex \
	includes.tex \
	title.tex \
	introduction.tex dataset.tex simulation.tex \
	bibliography.tex

presentation.pdf: $(TEX) presentation.bib 
	pdflatex presentation
	bibtex presentation
	pdflatex presentation
	pdflatex presentation

clean:
	rm -f *.aux *.log *.out *.pdf *.bbl *.blg *.bak *.toc *.nav *.snm

check: $(TEX)
		for tex in $(TEX); do aspell -c $$tex -l pt-br; done

see: presentation.pdf
	evince presentation.pdf &
