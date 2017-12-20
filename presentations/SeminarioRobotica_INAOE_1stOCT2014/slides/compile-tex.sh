#!/bin/bash
# A script to compile the LaTeX Documment - Perez-Xochicale M. A 
# Distributed under GPLv2.0 License
# Based on Krishna Kumar -- https://github.com/kks32/phd-thesis-template

all="all";
clean="clean";

if test -z "$2"
then
if [ $1 = $clean ]; then
	echo "Cleaning please wait ..."
	rm -f *~
	rm -rf *.aux
	rm -rf *.bbl
	rm -rf *.blg
	rm -rf *.log
	rm -rf *.snm
	rm -rf *.nav
	rm -rf *.out
	rm -rf *.toc*
	echo "Cleaning complete!"
	exit
else
	echo "Shell scrip for compiling the LaTeX Presentation"
	echo "Usage: sh ./compile-thesis.sh [OPTIONS] [filename]"
	echo "[option]  all: Compiles the LaTeX Document"
	echo "[option]  clean: removes temporary files no filename required"
	exit
fi
fi

filename=$2;

if [ $1 = $clean ]; then
	echo "Cleaning please wait ..."
	rm -f *~
	rm -rf *.aux
	rm -rf *.bbl
	rm -rf *.blg
	rm -rf *.log
	rm -rf *.snm
	rm -rf *.nav
	rm -rf *.out
	rm -rf *.toc*
	echo "Cleaning complete!"
	exit

elif [ $1 = $all ]; then
	echo "Compiling your LaTeX Presentation...please wait...!"
	pdflatex $filename.tex
	for f in bu*.aux; do
	  bibtex $f
	done
	pdflatex $filename.tex
	pdflatex $filename.tex
        echo "Success with pdflatex and bibtex compilation!"
	echo "Cleaning please wait ..."
	rm -f *~
	rm -rf *.aux
	rm -rf *.bbl
	rm -rf *.blg
	rm -rf *.log
	rm -rf *.snm
	rm -rf *.nav
	rm -rf *.out
	rm -rf *.toc*
	echo "Cleaning complete!"
	echo "Success!"
	exit
fi


if test -z "$3"
then
	exit
fi
