(define-syntax (generator e)
(syntax-case e ()
[(generator (yield) (v) b)
#'(let ([where-to-go (lambda (v) (error 'where-to-go "nothing"))])
(letrec ([resumer (lambda (v)
(begin b
(error 'generator "fell through")))]
[yield (lambda (v)
(let/cc gen-k
(begin
(set! resumer gen-k)
(where-to-go v))))])
(lambda (v)
(let/cc dyn-k
(begin
(set! where-to-go dyn-k)
(resumer v))))))]))