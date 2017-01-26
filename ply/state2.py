def t_NUMBER(t):
    r'\d+'
    t.lexer.num_count += 1     # Note use of lexer attribute
    t.value = int(t.value)    
    return t

lexer = lex.lex()
lexer.num_count = 0            # Set the initial count