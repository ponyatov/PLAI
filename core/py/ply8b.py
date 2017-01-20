lexstring = ''      # global buffer for parsed string

def t_STR(tok):             # will be called in <INITIAL>
    r'\''
    tok.lexer.begin('string')   # trigger state
    global lexstring            # \ clar buffer
    lexstring = ''              # / 
    return None                 # drop token

def t_string_STR(tok):      # will be called in <string>
    r'\''
    tok.lexer.begin('INITIAL')  # trigger state
    global lexstring            # \ return buffer
    tok.value = lexstring       
    return tok                  # / in token
