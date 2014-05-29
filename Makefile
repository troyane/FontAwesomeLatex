PACKAGENAME=fontawesome
VERSION=4.1

doc: doc/$(PACKAGENAME)-doc.pdf

package: doc/$(PACKAGENAME)-doc.pdf
	ctanify --pkgname $(PACKAGENAME) doc/*.pdf *.sty README LICENSE "FontAwesome.otf=fonts/opentype/public/fontawesome/"

doc/$(PACKAGENAME)-doc.pdf: 
	TEXINPUTS=.:doc: xelatex -output-directory=doc doc/$(PACKAGENAME)-doc.tex
	TEXINPUTS=.:doc: xelatex -output-directory=doc doc/$(PACKAGENAME)-doc.tex

clean:
	rm -f *.pdf *.aux *.log *.idx *.hd *.out *.glo
	rm -f doc/*.pdf doc/*.aux doc/*.log doc/*.idx doc/*.hd doc/*.out doc/*.glo

force: clean package
