#ifndef _H_HPP			// GNU GCC have no #pragma once
#define _H_HPP
						// standard includes
#include <iostream>
using namespace std;
						// lexer interface
extern int yylex();
extern char* yytext;
extern int yylineno;

#endif // _H_HPP
