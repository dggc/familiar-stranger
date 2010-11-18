SHELL=/bin/bash
TEX=familiar-stranger.tex \
		title.tex \
		introduction.tex related-work.tex modeling.tex simulation.tex results.tex

familiar-stranger.pdf: $(TEX) familiar-stranger.bib 
	pdflatex familiar-stranger.tex
	bibtex familiar-stranger
	pdflatex familiar-stranger.tex
	pdflatex familiar-stranger.tex

clean:
	rm -f *.aux *.log *.out *.pdf *.bbl *.blg *.bak *.toc *.dvi

check: $(TEX)
		for tex in $(TEX); do aspell -c $$tex -l pt-br; done

see: familiar-stranger.pdf
	evince familiar-stranger.pdf &
