#ifndef _H_HPP
#define _H_HPP

#include <iostream>
#include <cstdlib>
using namespace std;

struct Sym {
	string val;
	Sym(string);
	virtual string head();
	virtual string dump(int=0);
};

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
