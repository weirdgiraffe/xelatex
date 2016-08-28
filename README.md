It's custom texlive 2016 image to generate CV using `moderncv`. Usage if cv has a Makefile:

	cd cvfolder
	docker run --rm -it -v $(pwd):/sources/ weirdgiraffe/xelatex
	make

