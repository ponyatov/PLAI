def t_EXP(tok):             # number exponential form
    r'[0-9]+(\.[0-9]+)?[eE][\+\-]?[0-9]+'
    tok.value = float(tok.value)
    return tok
def t_NUM(tok):             # number point form
    r'[0-9]+\.[0-9]*'
    tok.value = float(tok.value)
    return tok