MODULE ?= PLAI

TEX = $(MODULE).tex ../../texheader/ebook.tex

TEX += 1_intro.tex 1_1_philo.tex 1_2_struc.tex 1_3_lang.tex
TEX += 17_alter.tex

SRC = src/p8_1.rkt src/p8_2.rkt src/p8_3.rkt src/p8_4.rkt
SRC += src/p9_1.rkt

LATEX = pdflatex -halt-on-error

.PHONY: pdf
pdf: $(MODULE).pdf
$(MODULE).pdf: $(TEX) $(FIG) $(SRC)
	$(LATEX) $< && $(LATEX) $<
