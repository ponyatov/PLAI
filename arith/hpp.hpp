#ifndef _H_HPP			// GNU GCC have no #pragma once
#define _H_HPP
						// standard includes
#include <iostream>
using namespace std;

struct Sym {			// algebraic data type
	string tag;					// T: class/type tag
	string val;					// V: value
	Sym(string T, string V);	// <T:V> constructor
	Sym(string V);				// token constructor
	vector<Sym*> nest();		// \ nested element
	void push(Sym*);			// / add nested elememt
	virtual string head();		// <T:V> string representation

};

						// lexer interface
extern int yylex();
extern char* yytext;
extern int yylineno;

#endif // _H_HPP
