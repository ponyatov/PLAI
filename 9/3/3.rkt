(let ([name (box 'dummy)])
  (begin
  (set-box! name value)
    body))