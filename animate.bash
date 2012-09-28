#!/bin/bash

mkdir frames
cd Thesis




function create_image {
t=$1
pdflatex -interaction=batchmode document.tex
bibtex document
pdflatex -interaction=batchmode document.tex
pdflatex -interaction=batchmode document.tex
mkdir images
convert document.pdf images/thesis%03d.jpg
montage -mode concatenate -tile 20x images/thesis*.jpg ../frames/$t.jpg
mogrify -resize "1920×1080" ../frames/$t.jpg
mogrify -extent -fill white ../frames/$t.jpg
rm -rf images 	
}

git rev-list HEAD --timestamp | while read trev; do set --  $trev;t=$1;rev=$2; git checkout -f $rev && git clean -fd; create_image $t; done;
