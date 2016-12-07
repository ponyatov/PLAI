#ifndef _H_HPP
#define _H_HPP

#include <iostream>
#include <sstream>
#include <cstdlib>
#include <vector>
#include <map>
using namespace std;

struct Sym {
	string tag; string val;
	Sym(string,string); Sym(string);
	vector<Sym*> nest; void push(Sym*);
	map<string,Sym*> lookup;
	virtual string head(); string pad(int); virtual string dump(int=0);
};

struct Num:Sym { Num(string); float val; string head(); };

struct Str:Sym { Str(string); string head(); };

struct Vector:Sym { Vector(); string head(); };

struct Op:Sym { Op(string); };
struct Lambda:Sym { Lambda(); string head(); };

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
