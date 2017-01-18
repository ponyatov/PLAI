import ply.lex as lex
import ply.yacc as yacc

tokens = [ 'SYM' , 'NUM', 'DIR', 'COMMENT' , 'OP' , 'CHAR' , 'STR' ]

t_SYM = r'[a-zA-Z0-9_]+'    # symbol

def t_COMMENT(tok):
    r'\#[^\n]+'
    print 'comment:', tok
    return tok

t_OP = r'[=@\+\-\*\/\^\[\]\{\}]'

t_DIR = r'\.[a-z]+'        # directive

t_ignore = ' \t\r\n'        # ignore spaces

states = [('string','exclusive')]

lexstring=''
def t_ANY_TICK(tok):
    r'\''
    global lexstring
    if tok.lexer.current_state() == 'string':
        tok.lexer.begin('INITIAL')
        tok.value=lexstring
        return tok
    else:
        tok.lexer.begin('string')
        lexstring=''
        return None

def t_string_CHAR(tok):
    r'.'
    global lexstring
    lexstring += tok.value
    
t_string_ignore = ''    # must be defined

def t_ANY_error(tok):       # error callback
    print 'error:', tok # report
#     dat.lexer.skip(1)   # error recovery

lexer = lex.lex()
lexer.input(file('1.src').read())

for i in iter(lexer.token,None): print i