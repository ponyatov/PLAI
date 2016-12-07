#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { return yyparse(); }

Sym::Sym(string T, string V) { tag=T; val=V; }
Sym::Sym(string V):Sym("sym",V){}
void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { return "<"+tag+":"+val+">"; }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { ostringstream os;
	os << endl << pad(depth) << head() << " # " << this ;
	for (auto it=lookup.begin(),e=lookup.end();it!=e;it++)
		os << endl << pad(depth+1) << it->first << " = " << it->second->head();
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		os << (*it)->dump(depth+1);
	return os.str(); }

Vector::Vector():Sym("vector","[]"){}
string Vector::head() { return "[]"; }

Str::Str(string V):Sym("str",V){}
string Str::head() { return "'"+val+"'"; }

Op::Op(string V):Sym("op",V){}
