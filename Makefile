include ../texheader/head.mk
TEX +=../texheader/lstrkt.sty

TEX += 1/intro.tex 1/1/philo.tex 1/2/struc.tex 1/3/lang.tex
TEX += 17/alter.tex

SRC = 1/3/p8_1.rkt 1/3/p8_2.rkt 1/3/p8_3.rkt 1/3/p8_4.rkt
SRC += 1/3/p9_1.rkt 1/3/p9_2.rkt 1/3/p9_3.rkt 1/3/p9_4.rkt

TEX += 2/parsing.tex 2/1/lwtparser.tex

FIG = tmp/2_p10_L.pdf tmp/2_p10_R.pdf tmp/2_1.pdf

SRC += 2/p10_1.rkt

TEX += 2/2/shortcut.tex

TEX += 2/3/types.tex
#SRC += 2/p11_1.rkt 2/p11_2.rkt 2/p11_3.rkt

TEX += 2/4/completing.tex
ArithC = src/plai.rkt src/cr \
	2/p12_1.rkt src/cr 2/p12_2.rkt src/cr \
	2/p12_3.rkt src/cr 3/p15_3.rkt src/cr 3/arCtest.rkt
#SRC += tmp/ArithC.rkt $(ArithC) 
SRC += 3/p14_1.rkt 3/p14_2.rkt 3/p15_2.rkt
SRC += 2/v1.rkt 2/v2.rkt

TEX += 2/5/coda.tex

TEX += 3/interp.tex 3/1/repr.tex 3/2/interp.tex 3/3/notice.tex 3/4/growing.tex

TEX += 4/desugaring.tex 4/1/subtract.tex 4/2/negation.tex
SRC += 4/p17_1.rkt 4/p17_2.rkt 4/p18_1.rkt
SRC += 4/p18_2.rkt 4/p18_3.rkt 4/p18_4.rkt

TEX += 5/func.tex
TEX += 5/1/datarepr.tex
SRC += 5/p19_1.rkt 5/p20_2.rkt 5/p20_3.rkt 5/p21_1.rkt 5/p21_2.rkt 5/p21_3.rkt
TEX += 5/2/growing.tex
SRC += 5/2/1.rkt 5/2/2.rkt 5/2/3.rkt
TEX += 5/3/subst.tex
SRC += 5/3/1.rkt 5/3/2.rkt 5/3/3.rkt
TEX += 5/4/resumed.tex
SRC += 5/4/1.rkt 5/4/2.rkt 5/4/4.rkt 5/4/5.rkt
TEX += 5/5/more.tex
SRC += 5/5/1.rkt 5/5/2.rkt 

TEX += 6/env.tex
TEX += 6/1/intro.tex
SRC += 6/1/1.rkt
TEX += 6/2/interp.tex 
SRC += 6/2/1.rkt 6/2/2.rkt 6/2/3.rkt 6/2/4.rkt 6/2/5.rkt 6/2/6.rkt
SRC += 6/2/7.rkt 6/2/8.rkt
TEX += 6/3/defer.tex
SRC += 6/3/1.rkt 6/3/2.rkt 6/3/3.rkt
TEX += 6/4/scope.tex
SRC += 6/4/1.rkt 6/4/2.rkt 6/4/3.rkt 6/4/4.rkt
TEX += 6/5/expose.tex

TEX += 7/fnanyw.tex
TEX += 7/1/exval.tex
SRC += 7/1/1.rkt 7/1/2.rkt 7/1/3.rkt 7/1/4.rkt 7/1/5.rkt 7/1/6.rkt
SRC += 7/1/7.rkt 7/1/8.rkt 7/1/9.rkt 7/1/10.rkt 7/1/11.rkt 7/1/12.rkt 7/1/13.rkt
TEX += 7/2/nested.tex
SRC += 7/2/1.rkt 7/2/2.rkt 7/2/3.rkt 7/2/4.rkt
SRC += 7/2/5.rkt 7/2/6.rkt 7/2/7.rkt 7/2/8.rkt
SRC += 7/2/9.rkt
TEX += 7/3/closures.tex
SRC += 7/3/1.rkt 7/3/2.rkt 7/3/3.rkt 7/3/4.rkt
SRC += 7/3/5.rkt
TEX += 7/4/subst.tex
SRC += 7/4/1.rkt 7/4/2.rkt 7/4/3.rkt 7/4/4.rkt
SRC += 7/4/5.rkt
TEX += 7/5/sugar.tex
SRC += 7/5/1.rkt 7/5/2.rkt 7/5/3.rkt 7/5/4.rkt 
SRC += 7/5/5.rkt 7/5/6.rkt 7/5/7.rkt 7/5/8.rkt 
SRC += 7/5/9.rkt 7/5/10.rkt

TEX += 8/mutation.tex

TEX += 8/1/mutable.tex
TEX += 8/1/1/model.tex
SRC += 8/1/1/1.rkt 8/1/1/2.rkt
TEX += 8/1/2/scaffold.tex
SRC += 8/1/2/1.rkt 8/1/2/2.rkt 8/1/2/3.rkt
TEX += 8/1/3/interclos.tex   
SRC += 8/1/3/1.rkt 8/1/3/1.log 8/1/3/2.rkt 8/1/3/2.log
TEX += 8/1/4/boxes.tex
SRC += 8/1/4/1.rkt 8/1/4/2.rkt 8/1/4/3.rkt 8/1/4/4.rkt 8/1/4/5.rkt 8/1/4/6.rkt
TEX += 8/1/5/envhelp.tex
SRC += 8/1/5/1.rkt 8/1/5/2.rkt 8/1/5/3.rkt 8/1/5/4.rkt 8/1/5/5.rkt
TEX += 8/1/6/store.tex
SRC += 8/1/6/1.rkt 8/1/6/2.rkt 8/1/6/3.rkt
TEX += 8/1/7/ibox.tex
SRC += 8/1/7/1.rkt 8/1/7/2.rkt 8/1/7/3.rkt 8/1/7/4.rkt 8/1/7/5.rkt
SRC += 8/1/7/6.rkt 8/1/7/7.rkt 8/1/7/8.rkt 8/1/7/9.rkt
SRC += 8/1/7/10.rkt 8/1/7/11.rkt 8/1/7/12.rkt 8/1/7/13.rkt  
TEX += 8/1/8/bigger.tex
SRC += 8/1/8/1.rkt 8/1/8/2.rkt 8/1/8/3.rkt 8/1/8/4.rkt 8/1/8/5.rkt 

TEX += 8/2/vars.tex
TEX += 8/2/1/term.tex
SRC += 8/2/1/1.rkt
TEX += 8/2/2/syntax.tex
SRC += 8/2/2/2.rkt 8/2/2/3.rkt 8/2/2/4.rkt  
TEX += 8/2/3/ivar.tex
SRC += 8/2/3/5.rkt 8/2/3/6.rkt 8/2/3/7.rkt 8/2/3/8.rkt  
TEX += 8/3/design.tex 8/4/pars.tex
SRC += 8/4/1.rkt 8/4/2.rkt

TEX += 9/recursion.tex
TEX += 9/1/data.tex
SRC += 9/1/1.rkt 9/1/2.rkt 9/1/3.rkt 9/1/4.rkt 
TEX += 9/2/funcs.tex
SRC += 9/2/1.rkt 9/2/2.rkt 9/2/3.rkt 9/2/4.rkt    
TEX += 9/3/premat.tex
SRC += 9/3/1.rkt 9/3/2.rkt 9/3/3.rkt 
SRC += 9/3/4.rkt 9/3/5.rkt 9/3/6.rkt  
TEX += 9/4/wostate.tex

TEX += 10/objects.tex
TEX += 10/1/woinher.tex

TEX += 10/1/1/core.tex
SRC += 10/1/1/1.rkt 10/1/1/2.rkt 10/1/1/3.rkt 
SRC += 10/1/1/4.rkt 10/1/1/5.rkt 10/1/1/6.rkt 
SRC += 10/1/1/7.rkt 10/1/1/8.rkt 10/1/1/9.rkt 

TEX += 10/1/2/desugar.tex

TEX += 10/1/3/collect.tex
SRC += 10/1/3/1.rkt 10/1/3/2.rkt 10/1/3/3.rkt 
SRC += 10/1/3/4.rkt 10/1/3/5.rkt 10/1/3/6.rkt 

TEX += 10/1/4/construct.tex
SRC += 10/1/4/1.rkt

TEX += 10/1/5/state.tex
SRC += 10/1/5/1.rkt 10/1/5/2.rkt 10/1/5/3.rkt 

TEX += 10/1/6/private.tex
SRC += 10/1/6/1.rkt

TEX += 10/1/7/static.tex
SRC += 10/1/7/1.rkt 10/1/7/2.rkt 

TEX += 10/1/8/selfref.tex
SRC += 10/1/8/1.rkt 10/1/8/2.rkt 10/1/8/3.rkt 10/1/8/4.rkt 

TEX += 10/1/9/dynamic.tex
SRC += 10/1/9/1.rkt 10/1/9/2.rkt 10/1/9/3.rkt 

TEX += 10/2/member.tex
TEX += 10/3/whatelse.tex
SRC += 10/3/1.rkt

TEX += 10/3/1/classes.tex
SRC += 10/3/1/1.rkt 10/3/1/2.rkt 10/3/1/3.rkt 10/3/1/4.rkt 
SRC += 10/3/1/5.rkt 10/3/1/6.rkt 10/3/1/7.rkt 

TEX += 10/3/2/proto.tex

TEX += 10/3/3/multi.tex

TEX += 10/3/4/super.tex

TEX += 10/3/5/mixins.tex
SRC += 10/3/5/1.rkt 10/3/5/2.rkt 10/3/5/3.rkt
SRC += 10/3/5/4.rkt 10/3/5/5.rkt

TEX += 11/memory.tex
TEX += 11/1/garbage.tex
TEX += 11/2/recovery.tex
TEX += 11/3/reclamation.tex
TEX += 11/3/1/cost.tex
TEX += 11/3/2/refcount.tex
SRC += 11/3/2/1.rkt
TEX += 11/4/automated.tex
TEX += 11/4/1/overview.tex
TEX += 11/4/2/truth.tex
TEX += 11/4/3/central.tex

TEX += 11/5/conserva.tex
TEX += 11/6/precise.tex

TEX += 12/repr.tex
TEX += 12/1/changing.tex
SRC += 12/1/1.rkt
TEX += 12/2/errors.tex
TEX += 12/3/meanings.tex
TEX += 12/4/more.tex
SRC += 12/4/1.rkt 12/4/2.rkt 12/4/3.rkt 12/4/4.rkt

TEX += 13/desugaring.tex
TEX += 13/1/first.tex
SRC += 13/1/1.rkt 13/1/2.rkt 13/1/3.rkt 13/1/4.rkt 
SRC += 13/1/5.rkt 13/1/6.rkt 13/1/6.err 13/1/7.rkt 
TEX += 13/2/syntax.tex
SRC += 13/2/1.rkt 13/2/2.rkt 13/2/3.rkt 
TEX += 13/3/guards.tex
SRC += 13/3/1.rkt 13/3/2.rkt
TEX += 13/4/smacro.tex
TEX += 13/4/1/fatt.tex
SRC += 13/4/1/1.rkt 13/4/1/2.rkt 13/4/1/3.rkt 
SRC += 13/4/1/4.rkt 13/4/1/5.rkt 13/4/1/6.rkt 
TEX += 13/4/2/guevl.tex
SRC += 13/4/2/1.rkt 13/4/2/2.rkt 13/4/2/3.rkt 13/4/2/4.rkt 
TEX += 13/4/3/hygiene.tex
SRC += 13/4/3/1.rkt 13/4/3/2.rkt 13/4/3/3.rkt 
SRC += 13/4/3/4.rkt 13/4/3/5.rkt 
TEX += 13/5/indent.tex
SRC += 13/5/1.rkt 13/5/2.rkt 13/5/3.rkt 
SRC += 13/5/4.rkt 13/5/5.rkt 13/5/6.rkt 
TEX += 13/6/influ.tex
TEX += 13/7/otherlangs.tex

TEX += 14/control.tex

TEX += 14/1/onweb.tex
SRC += 14/1/1.rkt 14/1/2.rkt 
TEX += 14/1/1/decomp.tex
SRC += 14/1/1/1.rkt 14/1/1/2.rkt 14/1/1/3.rkt 
TEX += 14/1/2/partial.tex
SRC += 14/1/2/1.rkt 14/1/2/2.rkt 14/1/2/3.rkt 14/1/2/4.rkt 
SRC += 14/1/2/5.rkt 14/1/2/6.rkt 14/1/2/7.rkt 14/1/2/8.rkt 
TEX += 14/1/3/stateless.tex
SRC += 14/1/3/1.rkt
TEX += 14/1/4/interaction.tex
SRC += 14/1/4/1.rkt 14/1/4/2.rkt 14/1/4/3.rkt 14/1/4/4.rkt
SRC += 14/1/4/5.rkt 14/1/4/6.rkt 14/1/4/7.rkt 14/1/4/8.rkt
SRC += 14/1/4/9.rkt 14/1/4/10.rkt

TEX += 14/2/contpass.tex
TEX += 14/2/1/impl.tex
SRC += 14/2/1/1.rkt 14/2/1/2.rkt 14/2/1/3.rkt 14/2/1/4.rkt 
SRC += 14/2/1/5.rkt 14/2/1/6.rkt 14/2/1/7.rkt 14/2/1/8.rkt 
SRC += 14/2/1/9.rkt 14/2/1/10.rkt 14/2/1/11.rkt 14/2/1/12.rkt 
SRC += 14/2/1/13.rkt 14/2/1/14.rkt 14/2/1/15.rkt 14/2/1/16.rkt 
SRC += 14/2/1/7.rkt 14/2/1/18.rkt 
TEX += 14/2/2/conv.tex
SRC += 14/2/2/1.rkt 14/2/2/2.rkt 
TEX += 14/2/3/core.tex
SRC += 14/2/3/1.rkt 14/2/3/2.rkt 14/2/3/3.rkt 14/2/3/4.rkt 
SRC += 14/2/3/5.rkt 14/2/3/6.rkt 14/2/3/7.rkt 

TEX += 14/3/gens.tex
TEX += 14/3/1/vars.tex
SRC += 14/3/1/1.rkt 14/3/1/2.rkt 14/3/1/3.rkt 
TEX += 14/3/2/gens.tex
SRC += 14/3/2/1.rkt 14/3/2/2.rkt 14/3/2/3.rkt 14/3/2/4.rkt 

TEX += 14/4/cont.tex
TEX += 14/5/tailcalls.tex
TEX += 14/6/contlang.tex

TEX += 15/invar.tex

TEX += 15/1/types.tex

TEX += 15/2/classview.tex
TEX += 15/2/1/simple.tex
TEX += 15/2/2/type.tex
TEX += 15/2/3/rcode.tex
TEX += 15/2/4/rdata.tex
TEX += 15/2/5/time.tex
TEX += 15/2/6/muta.tex
TEX += 15/2/7/central.tex

TEX += 15/3/exts.tex
TEX += 15/3/1/explicit.tex
TEX += 15/3/2/infer.tex
TEX += 15/3/3/union.tex
TEX += 15/3/4/nominal.tex
TEX += 15/3/5/intersec.tex
TEX += 15/3/6/rectype.tex
TEX += 15/3/7/subtype.tex
TEX += 15/3/8/objtype.tex

TEX += 16/contracts.tex

TEX += 17/alter.tex

TEX += 17/1/lazy.tex
TEX += 17/1/1/lazy.tex
TEX += 17/1/2/vals.tex
TEX += 17/1/3/eval.tex
TEX += 17/1/4/interp.tex
TEX += 17/1/5/muta.tex
TEX += 17/1/6/caching.tex

TEX += 17/2/reactive.tex
TEX += 17/2/1/timer.tex
TEX += 17/2/2/callback.tex
TEX += 17/2/3/alt.tex
TEX += 17/2/4/trans.tex
  
#MisspelledAnimal = plai.rkt cr
#MisspelledAnimal += 1/3/p8_1.rkt cr 1/3/p8_4.rkt cr
#MisspelledAnimal += 1/3/p9_1.rkt cr 1/3/p9_2.rkt

include ../texheader/foot.mk

#tmp/ArithC.rkt: $(ArithC) Makefile
#	cat $(ArithC) > $@

#tmp/MisspelledAnimal.rkt: $(MisspelledAnimal) Makefile
#	cat $(MisspelledAnimal) > $@

#.PHONY: rkt
#rkt: tmp/MisspelledAnimal.rkt 	
