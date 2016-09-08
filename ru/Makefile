TEX = PLAI.tex ../../texheader/ebook.tex
TEX += 1_intro.tex 1_1_philo.tex 1_2_struc.tex 1_3_lang.tex
TEX += 17_alter.tex
PLAI.pdf: $(TEX)
	pdflatex $< && pdflatex $<
