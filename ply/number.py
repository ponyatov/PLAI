def t_NUMBER(t):
    r'\d+'
    t.value = int(t.value)
    return t