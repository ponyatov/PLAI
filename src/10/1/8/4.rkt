(define (msg/self o m . a)
  (apply (o m) o a))