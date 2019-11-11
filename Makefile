.PHONY: all clean

all: doc-latex.pdf doc-xelatex.pdf

graph.png: graph.dot
	dot $^ -Tpng -o $@

doc-latex.pdf: doc.md graph.png
	pandoc doc.md -o $@

doc-xelatex.pdf: doc.md graph.png
	pandoc --pdf-engine=xelatex doc.md -o $@

clean:
	rm -f doc-latex.pdf doc-xelatex.pdf
