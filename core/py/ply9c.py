def t_SYM(tok):                     # symbol
    r'[a-zA-Z0-9_]+'
    return tok

t_OP = r'[=@\+\-\*\/\^\[\]\{\}&]'   # operator