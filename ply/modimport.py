>>> import tokrules
>>> lexer = lex.lex(module=tokrules)
>>> lexer.input("3 + 4")
>>> lexer.token()
LexToken(NUMBER,3,1,1,0)
>>> lexer.token()
LexToken(PLUS,'+',1,2)
>>> lexer.token()
LexToken(NUMBER,4,1,4)
>>> lexer.token()
None
>>>