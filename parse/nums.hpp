#ifndef _H_HPP			// GNU GCC have no #pragma once
#define _H_HPP
						// standard includes: required for
#include <iostream>			// cout/cerr
using namespace std;		// no std:: prefix in code
						
extern int yylex();		// regexp lexer interface
extern int yylineno;		// current line number
extern char* yytext;		// regexp-matched text

#endif // _H_HPP
