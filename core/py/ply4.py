def t_error(tok):       # error callback
    print 'error:', tok     # report
    tok.lexer.skip(1)       # error recovery
