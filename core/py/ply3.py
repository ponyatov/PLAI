def t_COMMENT(text):
    r'\#[^\n]+'
    print 'comment:', text
    return text
