(define (scheduler-loop-1 threads)
(cond
[(empty? threads) 'done]
[(cons? threads)
(type-case ThreadStatus (let/cc after-thread ((first threads) after-
thread))
[Tsuspended () (scheduler-loop-1 (append (rest threads)
(list (first threads))))]
[Tdone () (scheduler-loop-1 (rest threads))])]))