#ifndef _H_HPP					// GNU GCC have no #pragma once
#define _H_HPP
								// standard includes: required for
#include <iostream>					// cout/cerr
#include <sstream>					// ostringstream in dump()s
#include <cstdlib>					// exit() in yyerror()
#include <deque>					// nest[]ed elements
#include <map>						// env[]ironments
using namespace std;			// no std:: prefix in code

struct Sym {					// algebraic data type
	string tag;						// T: class/type tag
	string val;						// V: value
	Sym(string T, string V);		// <T:V> constructor
	Sym(string V);					// token constructor
	deque<Sym*> nest;				// \ nested element
	void push(Sym*);				// / add nested elememt
	map<string,Sym*> lookup;		// lookup table
	virtual string head();			// \ dump as <T:V> string
	string pad(int);				//   tree padding
	virtual string dump(int=0);		// / dump tree
};

struct Num:Sym {				// number/float wrap class
	float val;						// wrapped value type
	Num(string);					// token/string constructor
	Num(float);						// float constructor
	string head();					// redefine for float val
};

struct Str:Sym {				// 'string'
	Str(string);					// constructor
	string head();					// dump as 'string'
};

struct Vector:Sym {				// [vector]
	Vector();
	string head();				// dump as [] ...
};

struct Op:Sym {					// operator (and bracket)
	Op(string);
};

struct Lambda:Sym {				// {la:mbda} noname function
	Lambda();
	string head();				// dump as {} ...
};

extern int yylex();				// regexp lexer interface
extern int yylineno;				// current line number
extern char* yytext;				// regexp-matched text
#define TOC(C,X) { 					/* token macro */ \
	yylval.o = new C(yytext);		/* send token object to parser */ \
	return X; 						/* annotate returned token type */ }
extern int yyparse();			// syntax parser interface
extern void yyerror(string);		// syntax error callback
#include "ypp.tab.hpp"				// lexer/parser interop defines

#endif // _H_HPP
