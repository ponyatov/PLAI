MODULE ?= PLAI

TEX = $(MODULE).tex ../../texheader/ebook.tex ../../texheader/lstrkt.sty

TEX += 1_intro.tex 1_1_philo.tex 1_2_struc.tex 1_3_lang.tex
TEX += 17_alter.tex

SRC = src/1/p8_1.rkt src/1/p8_2.rkt src/1/p8_3.rkt src/1/p8_4.rkt
SRC += src/1/p9_1.rkt src/1/p9_2.rkt src/1/p9_3.rkt src/1/p9_4.rkt

TEX += 2_parsing.tex 2_1_lwtparser.tex

FIG = tmp/2_p10_L.pdf tmp/2_p10_R.pdf tmp/2_1.pdf

SRC += src/2/p10_1.rkt

TEX += 2_2_shortcut.tex

TEX += 2_3_types.tex
SRC += src/2/p11_1.rkt src/2/p11_2.rkt src/2/p11_3.rkt

TEX += 2_4_completing.tex
P12_x = src/2/p12_1.rkt src/2/p12_2.rkt src/2/p12_3.rkt
SRC += tmp/ArithC.rkt $(P12_x)

LATEX = pdflatex -halt-on-error

.PHONY: pdf
pdf: $(MODULE).pdf
$(MODULE).pdf: $(TEX) $(FIG) $(SRC)
	$(LATEX) $< #&& $(LATEX) $<

tmp/%.pdf: fig/%.dot
	dot -Tpdf -o $@ $<

tmp/ArithC.rkt: $(P12_x)
	cat $^ > $@

	