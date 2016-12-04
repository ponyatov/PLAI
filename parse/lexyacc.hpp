						// lexer/parser interface
extern int yylex();
extern char* yytext;
extern int yylineno;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "ypp.tab.hpp"
