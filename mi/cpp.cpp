#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { return yyparse(); }

Sym::Sym(string T, string V) { tag=T; val=V; }
Sym::Sym(string V):Sym("sym",V){}
Sym::Sym(Sym*A,Sym*B) { tag=A->val; val=B->val; }
void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { string S="<"+tag+":"+val+">";
	if (doc.length()) return S+" \""+doc+"\""; else return S; }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { string S = "\n"+pad(depth)+head();
//	for (auto it=lookup.begin(),e=lookup.end();it!=e;it++)
//		S += ","+it->first+"="+it->second->head();
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Str::Str(string V):Sym("str",V){}
string Str::head() { return "'"+val+"'"; }

Vector::Vector():Sym("vector","[]"){}
string Vector::head() { return val; }

Op::Op(string V):Sym("op",V){}
string Op::head() { return val; }

Lambda::Lambda():Sym("lambda","{}"){}
string Lambda::head() { return val; }

