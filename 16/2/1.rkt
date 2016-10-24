(define d/dx
(lambda (f)
(lambda (x)
(/ (- (f (+ x 0.001))
(f x))
0.001))))