#ifndef _H_HPP					// GNU GCC have no #pragma once
#define _H_HPP
#include "meta.hpp"				// metainformation: title author ...
								// standard includes: required for
#include <iostream>					// cout/cerr
#include <sstream>					// ostringstream in dump()s
#include <cstdlib>					// exit() in yyerror()
#include <deque>					// nest[]ed elements
#include <map>						// env[]ironments
using namespace std;			// no std:: prefix in code
#include <io.h>						// file i/o: dir
#include <fstream>					// file i/o: file

struct Sym {					// algebraic data type
	string tag;						// T: class/type tag
	string val;						// V: value
	Sym(string T, string V);		// <T:V> constructor
	Sym(string V);					// token constructor
	deque<Sym*> nest;				// \ nested element
	void push(Sym*);				// / add nested element
	map<string,Sym*> lookup;		// lookup table
	virtual string head();			// \ dump as <T:V> string
	string pad(int);				//   tree padding
	virtual string dump(int=0);		// / dump tree
	virtual Sym* eval(Sym*);		// evaluate/compute any object
	virtual Sym* pfxplus();			// +A
	virtual Sym* pfxminus();		// -A
	virtual Sym* add(Sym*);			// A + B
	virtual Sym* sub(Sym*);			// A - B
	virtual Sym* mul(Sym*);			// A * B
	virtual Sym* div(Sym*);			// A / B
	virtual Sym* str();				// str(A) object -> string
	virtual Sym* eq(Sym*,Sym*);		// A = B
	virtual Sym* at(Sym*);			// A @ B
};

extern Sym glob;				// \ global environment
extern void glob_init();
extern void glob_dump();		// /

struct Error:Sym {				// error object
	Error(string); };

struct Num:Sym {				// number/double wrap class
	double val;						// wrapped value type
	Num(string);					// token/string constructor
	Num(double);					// double constructor
	string head();					// redefine for double val
	Sym* pfxplus();					// + num:A
	Sym* pfxminus();				// - num:A
	Sym* add(Sym*);					// num:A + ?:B
	Sym* mul(Sym*);					// num:A * ?:B
};

struct Str:Sym {				// 'string'
	Str(string);					// constructor
	string head();					// dump as 'string'
	Sym* add(Sym*);					// 'A'+B
	Sym* str();						// str.str
};

struct Vector:Sym {				// [vector]
	Vector();
	string head();					// dump as [] ...
	Sym* add(Sym*);					// []+B
	Sym* div(Sym*);					// []/B
	Sym* str();						// [].str
};

struct Op:Sym {					// operator (and bracket)
	Op(string);
	Sym*eval(Sym*);					// required for basic math computing
};

typedef Sym*(*FN)(Sym*);
struct Fn:Sym {					// internal function
	Fn(string,FN);
	FN fn;							// pointer to [compiled] function
	Sym* at(Sym*);					// fn @ B
};

struct Lambda:Sym {				// {la:mbda} noname function
	Lambda();
	string head();					// dump as {} ...
};

struct Dir:Sym {				// file i/o : directory
	Dir(string);
	static Sym* dir(Sym*);
	Sym* div(Sym*);					// dir/sym -> file
};

struct File:Sym {				// file i/o : file
	File(string);
	ofstream *fh;
	Sym* eq(Sym*,Sym*);				// file = B
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
