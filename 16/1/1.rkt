(define (make-contract pred?)
(lambda (val)
(if (pred? val) val (blame "violation"))))
(define (blame s) (error 'contract "~a" s))