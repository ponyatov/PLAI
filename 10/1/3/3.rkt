(define (msg o m . a)
  (apply (o m) a))