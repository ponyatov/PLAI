def t_string_CHAR(tok):     # add any char to lexstring
    r'.'
    global lexstring
    lexstring += tok.value

def t_ANY_error(tok):               # error callback
    print 'error:', tok # report

lexer = lex.lex()
lexer.input(file('1.src').read())
for i in iter(lexer.token,None): print i