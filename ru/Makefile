MODULE ?= PLAI

TEX = $(MODULE).tex ../../texheader/ebook.tex

TEX += 1_intro.tex 1_1_philo.tex 1_2_struc.tex 1_3_lang.tex
TEX += 17_alter.tex

SRC = src/1/p8_1.rkt src/1/p8_2.rkt src/1/p8_3.rkt src/1/p8_4.rkt
SRC += src/1/p9_1.rkt src/1/p9_2.rkt src/1/p9_3.rkt src/1/p9_4.rkt

TEX += 2_parsing.tex 2_1_lwtparser.tex

LATEX = pdflatex -halt-on-error

.PHONY: pdf
pdf: $(MODULE).pdf
$(MODULE).pdf: $(TEX) $(FIG) $(SRC)
	$(LATEX) $< && $(LATEX) $<
