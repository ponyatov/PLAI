(cond
[(BTmt? t) e1]
[(BTnd? t) (let ([nv (BTnd-n/no-check t)]
[lt (BTnd-l/no-check t)]
[rt (BTnd-r/no-check t)])
e2)])