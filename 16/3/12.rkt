(define d/dx
(guard (function (function (immediate number?) (immediate number?))
(function (immediate number?) (immediate number?)))
(lambda (f)
(lambda (x)
(/ (- (f (+ x 0.001))
(f x))
0.001)))))