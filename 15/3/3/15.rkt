(define: (t) (in-list? [e : t] [l : (Listof t)]) : (Maybeof (Listof t))
(let ([v (member e l)])
(if v
v
(none))))