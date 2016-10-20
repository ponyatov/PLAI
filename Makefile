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
ArithC = src/plai.rkt src/cr \
	src/2/p12_1.rkt src/cr src/2/p12_2.rkt src/cr \
	src/2/p12_3.rkt src/cr src/3/p15_3.rkt src/cr src/3/arCtest.rkt
SRC += tmp/ArithC.rkt $(ArithC) src/3/p14_1.rkt src/3/p14_2.rkt src/3/p15_2.rkt
SRC += src/2/v1.rkt src/2/v2.rkt

TEX += 2_5_coda.tex

TEX += 3_interp.tex 3_1_repr.tex 3_2_interp.tex

TEX += 3_3_notice.tex

TEX += 3_4_growing.tex

TEX += 4_desugaring.tex 4_1_subtract.tex 4_2_negation.tex
SRC += src/4/p17_1.rkt src/4/p17_2.rkt src/4/p18_1.rkt
SRC += src/4/p18_2.rkt src/4/p18_3.rkt src/4/p18_4.rkt

TEX += 5_func.tex 5_1_datarepr.tex
SRC += src/5/p19_1.rkt src/5/p20_2.rkt src/5/p20_3.rkt
SRC += src/5/p21_1.rkt src/5/p21_2.rkt src/5/p21_3.rkt
TEX += 5_2_growing.tex
SRC += src/5/5_2_1.rkt src/5/5_2_2.rkt src/5/5_2_3.rkt
TEX += 5_3_subst.tex
SRC += src/5/5_3_1.rkt src/5/5_3_2.rkt src/5/5_3_3.rkt
TEX += 5_4_resumed.tex
SRC += src/5/5_4_1.rkt src/5/5_4_2.rkt src/5/5_4_4.rkt src/5/5_4_5.rkt
TEX += 5_5_more.tex
SRC += src/5/5_5_1.rkt src/5/5_5_2.rkt 

TEX += 6_env.tex
TEX += 6_1_intro.tex
SRC += src/6/6_1_1.rkt
TEX += 6_2_interp.tex 
SRC += src/6/6_2_1.rkt src/6/6_2_2.rkt src/6/6_2_3.rkt
SRC += src/6/6_2_4.rkt src/6/6_2_5.rkt src/6/6_2_6.rkt
SRC += src/6/6_2_7.rkt src/6/6_2_8.rkt
TEX += 6_3_defer.tex
SRC += src/6/6_3_1.rkt src/6/6_3_2.rkt src/6/6_3_3.rkt
TEX += 6_4_scope.tex
SRC += src/6/6_4_1.rkt src/6/6_4_2.rkt src/6/6_4_3.rkt src/6/6_4_4.rkt
TEX += 6_5_expose.tex

TEX += 7_fnanyw.tex
TEX += 7_1_exval.tex
SRC += src/7/7_1_1.rkt src/7/7_1_2.rkt src/7/7_1_3.rkt src/7/7_1_4.rkt
SRC += src/7/7_1_5.rkt src/7/7_1_6.rkt src/7/7_1_7.rkt src/7/7_1_8.rkt
SRC += src/7/7_1_9.rkt src/7/7_1_10.rkt src/7/7_1_11.rkt src/7/7_1_12.rkt
SRC += src/7/7_1_13.rkt
TEX += 7_2_nested.tex
SRC += src/7/7_2_1.rkt src/7/7_2_2.rkt src/7/7_2_3.rkt src/7/7_2_4.rkt
SRC += src/7/7_2_5.rkt src/7/7_2_6.rkt src/7/7_2_7.rkt src/7/7_2_8.rkt
SRC += src/7/7_2_9.rkt
TEX += 7_3_closures.tex
SRC += src/7/7_3_1.rkt src/7/7_3_2.rkt src/7/7_3_3.rkt src/7/7_3_4.rkt
SRC += src/7/7_3_5.rkt
TEX += 7_4_subst.tex
SRC += src/7/7_4_1.rkt src/7/7_4_2.rkt src/7/7_4_3.rkt src/7/7_4_4.rkt
SRC += src/7/7_4_5.rkt
TEX += 7_5_sugar.tex
SRC += src/7/5/1.rkt src/7/5/2.rkt src/7/5/3.rkt src/7/5/4.rkt 
SRC += src/7/5/5.rkt src/7/5/6.rkt src/7/5/7.rkt src/7/5/8.rkt 
SRC += src/7/5/9.rkt src/7/5/10.rkt

TEX += 8_mutation.tex
TEX += 8_1_mutable.tex
SRC += src/8/1/1.rkt src/8/1/2.rkt
SRC += src/8/1/2_1.rkt 
TEX += 8_2_vars.tex   
TEX += 8_3_design.tex   
TEX += 8_4_pars.tex   

MisspelledAnimal = src/plai.rkt src/cr
MisspelledAnimal += src/1/p8_1.rkt src/cr src/1/p8_4.rkt src/cr
MisspelledAnimal += src/1/p9_1.rkt src/cr src/1/p9_2.rkt

include ../texheader/foot.mk

tmp/ArithC.rkt: $(ArithC) Makefile
	cat $(ArithC) > $@

tmp/MisspelledAnimal.rkt: $(MisspelledAnimal) Makefile
	cat $(MisspelledAnimal) > $@

.PHONY: rkt
rkt: tmp/MisspelledAnimal.rkt 	
