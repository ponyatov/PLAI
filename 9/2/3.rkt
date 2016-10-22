(let ([fact (box 'dummy)])
(begin
(set-box! fact
(lambda (n)
(if (zero? n)
1
(* n ((unbox fact) (- n 1))))))
((unbox fact) 10)))