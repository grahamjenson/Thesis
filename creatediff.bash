#!/bin/bash
set -e
NAME=diff

latexdiff --flatten z_document.tex document.tex > $NAME.tex

pdflatex $NAME.tex
bibtex $NAME
pdflatex $NAME.tex
pdflatex $NAME.tex
pdflatex $NAME.tex

rm $NAME.aux
rm $NAME.bbl
rm $NAME.blg
rm $NAME.lof
rm $NAME.log
rm $NAME.lot
rm $NAME.out
rm $NAME.tex
rm $NAME.toc

