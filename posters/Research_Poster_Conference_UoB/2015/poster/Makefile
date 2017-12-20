fileinfo := LaTeX Makefile for Poster 
author := Miguel Perez-Xochicale
version := alpha1

FILENAME = poster
LATEX = pdflatex --enable-write18

all:
	$(LATEX) $(FILENAME).tex
	$(LATEX) $(FILENAME).tex
	evince $(FILENAME).pdf &

clean:
	rm -f *~
	rm -rf *.backup
	rm -f `ls $(FILENAME).* | grep -v .tex | grep -v .pdf`
	#.aux	*.bbl	*.blg	*.log	poster.pdf 
	echo "Cleaning complete!"

