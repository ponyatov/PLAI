# EOF handling rule
def t_eof(t):
    # Get more input (Example)
    more = raw_input('... ')
    if more:
        self.lexer.input(more)
        return self.lexer.token()
    return None