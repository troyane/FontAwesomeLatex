PACKAGENAME=fontawesome

doc: doc/$(PACKAGENAME)-doc.pdf

package: doc/$(PACKAGENAME)-doc.pdf
	cp README.md README
	ctanify --pkgname $(PACKAGENAME) doc/*.pdf *.sty README.md LICENSE README

doc/$(PACKAGENAME)-doc.pdf: 
	TEXINPUTS=.:doc: xelatex -output-directory=doc doc/$(PACKAGENAME)-doc.tex
	TEXINPUTS=.:doc: xelatex -output-directory=doc doc/$(PACKAGENAME)-doc.tex

clean:
	rm -f *.pdf *.aux *.log *.idx *.hd *.out *.glo
	rm -f doc/*.pdf doc/*.aux doc/*.log doc/*.idx doc/*.hd doc/*.out doc/*.glo

force: clean package
