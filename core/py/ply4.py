def t_error(dat):       # error callback
    print 'error:', dat     # report
    dat.lexer.skip(1)       # error recovery
