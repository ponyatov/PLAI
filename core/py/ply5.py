def t_error(dat):       # error callback
    print 'error:', dat     # report
#     dat.lexer.skip(1)     # disable error recovery

lexer = lex.lex()                   # create lexer
lexer.input(file('1.src').read())   # input file

for i in iter(lexer.token,None): pass # parser loop
#     print i