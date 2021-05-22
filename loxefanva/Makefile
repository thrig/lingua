.PHONY: clean
.SUFFIXES: .tex .pdf

.tex.pdf:
	xelatex -halt-on-error -interaction=batchmode ${.IMPSRC}

le-cukseltai-temfesti.pdf: le-cukseltai-temfesti.tex

clean:
	@-rm *.aux *.log *.out
