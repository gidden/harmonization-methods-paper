manuscript = paper
references = refs.bib
latexopt   = -halt-on-error -file-line-error -shell-esc

all: all-via-pdf

all-via-pdf: $(manuscript).tex $(references)
	pdflatex $(latexopt) $<
	makeglossaries $(manuscript)
	bibtex $(manuscript).aux
	pdflatex $(latexopt) $<
	pdflatex $(latexopt) $<

all-via-dvi: 
	latex $(latexopt) $(manuscript)
	bibtex $(manuscript).aux
	latex $(latexopt) $(manuscript)
	latex $(latexopt) $(manuscript)
	dvipdf $(manuscript)

clean:
	rm -f *.pdf *.dvi *.toc *.aux *.out *.log *.bbl *.blg *.log *.spl *~ *.spl *.zip *.acn *.glo *.ist

realclean: clean
	rm -rf $(manuscript).dvi
	rm -f $(manuscript).pdf

%.ps :%.eps
	convert $< $@

%.png :%.eps
	convert $< $@

zip:
	zip paper.zip *.tex *.eps *.bib

bib:
	python ~/work/publications/zo/zo.py make -p ~/work/publications/refs/all.bib

.PHONY: all clean
