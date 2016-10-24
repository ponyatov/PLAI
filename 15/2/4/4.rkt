(cond
[(BTmt? t) e1]
[(BTnd? t) (let ([nv (BTnd-n t)]
[lt (BTnd-l t)]
[rt (BTnd-r t)])
e2)])