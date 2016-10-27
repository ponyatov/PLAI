#ifndef _H_HPP
#define _H_HPP

#include <iostream>
#include <sstream>
#include <cstdlib>
#include <vector>
#include <map>
using namespace std;

struct Sym {
	string val;
	Sym(string);
	vector<Sym*> nest; void push(Sym*);
	map<string,Sym*> lookup;
	virtual string head(); string pad(int);
	virtual string dump(int=0);
};

struct Num:Sym { Num(string); string head(); double val; };

struct Op:Sym { Op(string); };

struct Vector:Sym { Vector(); };
struct Lambda:Sym { Lambda(); };
struct Tuple:Sym { Tuple(Sym*,Sym*); };

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern int yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
