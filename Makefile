%.pdf: %.tex
	pdflatex 

pandoc -r markdown slides.md -t beamer -o out.pdf
