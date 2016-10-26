#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
int yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { return yyparse(); }

Sym::Sym(string V) { val=V; }
void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { return val; }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { string S = "\n"+pad(depth)+head();
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Num::Num(string V):Sym(V){ val=atof(yytext); }
string Num::head() { ostringstream os; os<<val; return os.str(); }

Op::Op(string V):Sym(V){}

Vector::Vector():Sym("[]"){}
Lambda::Lambda():Sym("{}"){}
Tuple::Tuple(Sym*A,Sym*B):Sym(","){ push(A); push(B); }

