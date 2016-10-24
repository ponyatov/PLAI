(define (function dom rng)
(lambda (pos neg)
(let ([dom-c (dom neg pos)]
[rng-c (rng pos neg)])
(lambda (val)
(if (procedure? val)
(lambda (x) (rng-c (val (dom-c x))))
(blame pos))))))