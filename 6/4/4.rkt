(define y 1)
(define f (let ((z y)) (lambda (x) (+ x y z))))
(define y 2)