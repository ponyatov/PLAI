#include "hpp.hpp"
#define YYERR "\n\n["<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
int yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { return yyparse(); }

Sym::Sym(string V) { val=V; }
string Sym::dump() { return "<"+val+">"; }

