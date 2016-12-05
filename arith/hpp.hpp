#ifndef _H_HPP			// GNU GCC have no #pragma once
#define _H_HPP
						// standard includes
#include <iostream>
#include <sstream>
#include <cstdlib>
#include <vector>
#include <map>
using namespace std;

struct Sym {			// algebraic data type
	string tag;					// T: class/type tag
	string val;					// V: value
	Sym(string T, string V);	// <T:V> constructor
	Sym(string V);				// token constructor
	vector<Sym*> nest;			// \ nested element
	void push(Sym*);			// / add nested elememt
	map<string,Sym*> lookup;	// lookup table
	virtual string head();		// \ <T:V> string representation
	string pad(int);			//   tree padding
	virtual string dump(int=0);	// / dump tree
};

struct Num:Sym {		// number wrap class
	float val;					// wrapped value type
	Num(string);				// token/string constructor
	Num(float);					// float constructor
	string head();				// redefine for float val
};

						// lexer/parser interface
extern int yylex();
extern char* yytext;
extern int yylineno;
#define TOC(C,X) { yylval.o = new C(yytext); return X; }
extern int yyparse();
extern void yyerror(string);
#include "ypp.tab.hpp"

#endif // _H_HPP
