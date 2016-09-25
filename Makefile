include ../texheader/head.mk
TEX +=../texheader/lstrkt.sty

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
P12_x = src/plai.rkt \
	src/2/p12_1.rkt src/2/p12_2.rkt src/2/p12_3.rkt src/3/p15_3.rkt
SRC += tmp/ArithC.rkt $(P12_x) src/3/p14_1.rkt src/3/p14_2.rkt src/3/p15_2.rkt

TEX += 2_5_coda.tex

TEX += 3_interp.tex 3_1_repr.tex 3_2_interp.tex

TEX += 3_3_notice.tex

TEX += 3_4_growing.tex

TEX += 4_desugaring.tex 4_1_subtract.tex 4_2_negation.tex
SRC += src/4/p17_1.rkt src/4/p17_2.rkt src/4/p18_1.rkt
SRC += src/4/p18_2.rkt src/4/p18_3.rkt src/4/p18_4.rkt

PS = src/plai.rkt src/cr.rkt
PS += src/1/p8_1.rkt src/cr.rkt src/1/p8_2.rkt

include ../texheader/foot.mk

tmp/ArithC.rkt: $(P12_x)
	cat $^ > $@

PLAI.rkt: $(PS) Makefile
	cat $(PS) > $@ 
