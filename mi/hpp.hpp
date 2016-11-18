#ifndef _H_HPP
#define _H_HPP

#include <iostream>
#include <cstdlib>
#include <vector>
#include <map>
using namespace std;

struct Sym {
	string tag; string val; string doc;
	Sym(string,string); Sym(string); Sym(Sym*,Sym*);
	vector<Sym*> nest; void push(Sym*);
	map<string,Sym*> lookup;
	virtual string head(); string pad(int); virtual string dump(int=0);
};

struct Str:Sym { Str(string); string head(); };

struct Vector:Sym { Vector(); string head(); };

struct Op:Sym { Op(string); string head(); };
struct Lambda:Sym { Lambda(); string head(); };

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
