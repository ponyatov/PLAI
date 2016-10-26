#lang plai-typed

( define-type MisspelledAnimal
   [caml (humps : number)]
   [yacc (heig : number)]
   )

(define (good? [ma : MisspelledAnimal]) : boolean
  (type-case MisspelledAnimal ma
    [caml (humps) (>= humps 2) ]
    [yacc (h) #f]
  ))
