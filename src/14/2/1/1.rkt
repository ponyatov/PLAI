<cps-macro> ::=
(define-syntax (cps e)
(syntax-case e (with rec lam cnd seq set quote display read-number)
<cps-macro-with-case>
<cps-macro-rec-case>
<cps-macro-lam-case>
<cps-macro-cnd-case>
<cps-macro-display-case>
<cps-macro-read-number-case>
<cps-macro-seq-case>
<cps-macro-set-case>
<cps-macro-quote-case>
<cps-macro-app-1-case>
<cps-macro-app-2-case>
<cps-macro-atomic-case>))