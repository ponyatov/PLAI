#ifndef _H_HPP
#define _H_HPP

#include <iostream>
#include <sstream>
#include <cstdlib>
#include <vector>
#include <map>
using namespace std;

struct Sym;
extern Sym glob;
extern void glob_init();
struct Sym {
	string val;
	Sym(string);
	vector<Sym*> nest; void push(Sym*);
	map<string,Sym*> lookup;
	virtual string head(); string pad(int); virtual string dump(int=0);
	virtual Sym* eval(Sym*env=&glob);
};

struct Num:Sym { Num(string); };
struct Str:Sym { Str(string); string head(); };

struct Op:Sym { Op(string); string head(); Sym*eval(Sym*); };

struct Vector:Sym { Vector(); string head(); };

struct Var:Sym { Var(Sym*,Sym*,Sym*); Sym*env; string head(); Sym*eval(Sym*); };

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
