(define (real-sqrt new-x)
(let ([x (guard (immediate positive?) new-x)])
(sqrt x)))