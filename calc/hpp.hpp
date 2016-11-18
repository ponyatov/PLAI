#ifndef _H_HPP
#define _H_HPP

#include <iostream>
#include <cstdlib>
#include <vector>
#include <map>
using namespace std;

struct Sym {
	string tag; string val;
	Sym(string,string); Sym(string);
	vector<Sym*> nest; void push(Sym*);
	virtual string head(); string pad(int); virtual string dump(int=0);
	virtual Sym* eval();
	virtual Sym* neg();
	virtual Sym* add(Sym*);
	virtual Sym* mul(Sym*);
};

struct Error:Sym { Error(string); };

struct Num:Sym { Num(string); Num(float); float val; string head();
	Sym*neg(); Sym*add(Sym*); Sym*mul(Sym*); };

struct Op:Sym { Op(string); Sym*eval(); };

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
