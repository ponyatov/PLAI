(define (scheduler-loop-0 threads)
(cond
[(empty? threads) 'done]
[(cons? threads)
(begin
(let/cc after-thread ((first threads) after-thread))
(scheduler-loop-0 (append (rest threads)
(list (first threads)))))]))