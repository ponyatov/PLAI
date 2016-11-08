#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { glob_init(); return yyparse(); }

Sym::Sym(string V) { val=V; }
void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { ostringstream os; os <<"<"<<val<<"> @"<<this;
	return os.str(); }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { string S = "\n"+pad(depth)+head();
	for (auto it=lookup.begin(),e=lookup.end();it!=e;it++)
		S += "\n"+pad(depth+1)+it->first+" = "+it->second->head();
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Sym* Sym::eval(Sym* env) {
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		(*it) = (*it)->eval(env);
	Sym*E = env->lookup[val]; if (E) return E;
	return this; }

Str::Str(string V):Sym(V){}
string Str::head() { ostringstream os; os<<"'";
	for (int i=0;i<val.length();i++) switch (val[i]) {
		default: os<<val[i];
	}
	os<<"' @"<<this; return os.str(); }

Vector::Vector():Sym("[]"){}
string Vector::head() { return val; }

Op::Op(string V):Sym(V){}
string Op::head() { return val; }
Sym* Op::eval(Sym*env) { Sym::eval(env);
	if (val=="=") { env->lookup[nest[0]->val] = nest[1]; return nest[1]; }
	return this; }

Lambda::Lambda():Sym("{}"){}
string Lambda::head() { return val; }

Sym glob("global");
void glob_init(){}

