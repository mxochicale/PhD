fileinfo := LaTeX Makefile
author := Miguel P. Xochicale
version := alpha1

#References
#http://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
#https://danielkaes.wordpress.com/2009/03/14/compiling-latex-documents-using-makefiles/
#http://www.cs.berkeley.edu/~jaein/notes/Makefile.pdflatex

# TODO:
# *add some of the following tools http://www.cs.berkeley.edu/~jaein/notes/Makefile.pdflatex
#

FILENAME = main
LATEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error
BIB = bibtex

all:
	$(LATEX) $(FILENAME).tex
	$(BIB) $(FILENAME)
	$(LATEX) $(FILENAME).tex
	$(BIB) $(FILENAME)
	evince $(FILENAME).pdf &

clean:
	rm -f *~
	rm -rf *.backup
	rm -f `ls $(FILENAME).* | grep -v .tex | grep -v .pdf`
	echo "Cleaning complete!"
