#!/bin/bash
for f in *.tex
do
	echo $f
	cat $f | egrep "^\\\\section|^\\\\subsection|^\\\\chapter|^\\\\document|\{document\}|^\\\\input|^\\\\label|^%%%|^\{\}|^$" | sed "s/%%%.*/&\}/g" | sed -e "s/%%%/\\\\textit\{/g" > ./doc/$f
done
cd doc
pdflatex -interaction=batchmode document.tex
bibtex document
pdflatex -interaction=batchmode document.tex
pdflatex -interaction=batchmode document.tex

