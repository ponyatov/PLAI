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
	virtual Sym* eval();
	virtual Sym* pfxplus();
	virtual Sym* pfxminus();
	virtual Sym* add(Sym*);
	virtual Sym* sub(Sym*);
	virtual Sym* mul(Sym*);
};

struct Error:Sym { Error(string); };

struct Str:Sym { Str(string); string head(); };

struct Num:Sym { float val; Num(string); Num(float); string head(); };

struct Op:Sym { Op(string); };
struct Add:Op { Add(string); Sym*eval(); };
struct Sub:Op { Sub(string); Sym*eval(); };
struct Mul:Op { Mul(string); Sym*eval(); };

extern int yylex();
extern int yylineno;
extern char* yytext;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
