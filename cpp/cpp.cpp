#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { return yyparse(); }

Sym::Sym(string T, string V) { tag=T; val=V; }
Sym::Sym(string V):Sym("sym",V){}
void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { return "<"+tag+":"+val+">"; }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { string S = "\n"+pad(depth)+head();
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Sym* Sym::eval() {
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		(*it) = (*it)->eval();
	return this;
}

Sym* Sym::neg() { return new Error("- "+head()); }
Sym* Sym::add(Sym*o) { return new Error(head() + " + "+o->head()); }
Sym* Sym::mul(Sym*o) { return new Error(head() + " * "+o->head()); }

Error::Error(string V):Sym("err",V) { yyerror(val); }

Num::Num(string V):Sym("num",V) { val=atof(V.c_str()); }
Num::Num(float F):Sym("num","") { val=F; }
string Num::head() { char sval[0x10]; sprintf(sval,"%f",val);
	return "<"+tag+":"+sval+">"; }

Sym* Num::neg() { val=-val; return this; }

Sym* Num::add(Sym*o) {
	if (o->tag!="num") return new Error(head() + " + " + o->head());
	else return new Num(val + dynamic_cast<Num*>(o)->val);
}

Sym* Num::mul(Sym*o) {
	if (o->tag!="num") return new Error(head() + " * " + o->head());
	else return new Num(val * dynamic_cast<Num*>(o)->val);
}

Op::Op(string V):Sym("op",V){}

Sym* Op::eval() { Sym::eval();
	if (nest.size()==2) {
		if (val=="+") return nest[0]->add(nest[1]);
		if (val=="*") return nest[0]->mul(nest[1]);
	}
	if (nest.size()==1) {
		if (val=="+") return nest[0];
		if (val=="-") return nest[0]->neg();
	}
	return this; }
