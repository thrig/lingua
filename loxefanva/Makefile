.PHONY: clean depend test
.SUFFIXES: .tex .pdf

.tex.pdf:
	xelatex -halt-on-error -interaction=batchmode ${.IMPSRC}

le-cukseltai-temfesti.pdf: le-cukseltai-temfesti.tex

le-cukseltai-temfesti.tex: reconstruction of ruins
	./reconstruction of ruins > le-cukseltai-temfesti.tex

# NOTE this requires that ../camxes is somewhere in PATH and that the
# https://github.com/lojban/ilmentufa repository installed. and node.
test:
	@camxes .i cipra
	@prove --nocolor

depend:
	perl -e 'use 5.28.0'
	cpanm --installdeps .

clean:
	@-rm *.aux *.log *.out
