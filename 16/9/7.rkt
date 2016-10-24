(define (immediate pred?)
(lambda (pos neg)
(lambda (val)
(if (pred? val) val (blame pos)))))