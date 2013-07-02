slides.pdf: slides.md
	pandoc -r markdown slides.md -t beamer -o out.pdf --slide-level=3 --toc --highlight-style=tango
	mv out.pdf slides.pdf
clean: slides.pdf
	rm slides.pdf
