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
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Sym* Sym::eval(Sym* env) {
	Sym*E = env->lookup[val]; if (E) return E;
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		(*it) = (*it)->eval(env);
	return this; }

Str::Str(string V):Sym(V){}
string Str::head() { ostringstream os; os<<"'";
	for (int i=0;i<val.length();i++) switch (val[i]) {
		default: os<<val[i];
	}
	os<<"' @"<<this; return os.str(); }

Op::Op(string V):Sym(V){}
string Op::head() { return val; }
Sym* Op::eval(Sym*env) { Sym::eval(env);
	if (val=="=") return new Var(env,nest[0],nest[1]);
	return this; }

Vector::Vector():Sym("[]"){}
string Vector::head() { return val; }

Var::Var(Sym*E,Sym*A,Sym*B):Sym(A->val) { env=E;
	push(B->eval(E)); E->lookup[val]=this; }
string Var::head() { ostringstream os;
	os<<env->val<<"/"<<val<<" @"<<this; return os.str(); }
Sym* Var::eval(Sym*env) { return nest[0]->eval(env); }

Sym glob("global");
void glob_init(){}

