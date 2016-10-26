#ifndef _H_HPP
#define _H_HPP

#include <iostream>
#include <cstdlib>
using namespace std;

struct Sym {
	string val;
	Sym(string);
	virtual string dump();
};

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(X) { yylval.o = new Sym(yytext); return X; }
extern int yyparse();
extern int yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
