#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { return yyparse(); }

Sym::Sym(string T, string V) { tag=T; val=V; }
Sym::Sym(string V):Sym("sym",V){}
void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { return "<"+tag+":"+val+">"; }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { string S = '\n'+pad(depth)+head();
	for (auto it=lookup.begin(),e=lookup.end();it!=e;it++)
		S += ' '+it->first;
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Sym* Sym::eval(Sym*env) {
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		(*it)=(*it)->eval(env);
	return this; }

Sym* Sym::add(Sym*o) { return new Error(head()+" + "+o->head()); }

Error::Error(string V):Sym("error",V) { yyerror(V); }

Num::Num(string V):Sym("num",V) { val=atof(V.c_str()); }
Num::Num(float F):Sym("") { val=F; }
string Num::head() { char F[0x10]; sprintf(F,"%f",val); return F; }

Sym* Num::add(Sym*o) {
	if (o->tag=="num")
		return new Num(val+dynamic_cast<Num*>(o)->val);
	else
		return new Error(head()+" + "+o->head());
}

Str::Str(string V):Sym("str",V){}
string Str::head() { return "'"+val+"'"; }

Vector::Vector():Sym("vector","[]"){}

Op::Op(string V):Sym("op",V){}
Sym* Op::eval(Sym*env) {
	if (val=="~") return nest[0]; else Sym::eval(env);
	if (val=="=") { env->lookup[nest[0]->val]=nest[1]; return nest[1]; }
	if (val=="+") return nest[0]->add(nest[1]);
	return this; }

Lambda::Lambda():Sym("{}"){}

