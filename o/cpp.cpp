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
	for (auto it=lookup.begin(),e=lookup.end();it!=e;it++)
		S += "\n"+pad(depth+1)+it->first+" = "+it->second->head();
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Sym* Sym::eval() {
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		(*it) = (*it)->eval();
	return this; }

Sym* Sym::pfxplus()  { return new Error("+"+this->head()); }
Sym* Sym::pfxminus() { return new Error("-"+this->head()); }
Sym* Sym::add(Sym*o) { return new Error(this->head()+" + "+o->head()); }
Sym* Sym::sub(Sym*o) { return new Error(this->head()+" - "+o->head()); }
Sym* Sym::mul(Sym*o) { return new Error(this->head()+" * "+o->head()); }

Error::Error(string V):Sym("error",V) { yyerror(V); }

Str::Str(string V):Sym("str",V){}
string Str::head() { return "'"+val+"'"; }

Num::Num(string V):Sym("num",V) { val=atof(V.c_str()); }
Num::Num(float F):Sym("num","") { val=F; }
string Num::head() { ostringstream os; os<<val; return os.str(); }
Sym* Num::pfxplus() { return this; }
Sym* Num::pfxminus() { return new Num(-val); }
Sym* Num::add(Sym*o) {
	if (o->tag=="num") return new Num(val + dynamic_cast<Num*>(o)->val);
	else return new Error(this->dump());
}
Sym* Num::mul(Sym*o) {
	if (o->tag=="num") return new Num(val * dynamic_cast<Num*>(o)->val);
	else return new Error(this->dump());
}

Op::Op(string V):Sym("op",V) {}

Add::Add(string V):Op(V){}
Sym* Add::eval() { Sym::eval();
	switch (nest.size()) {
		case 1: return nest[0]->pfxplus();
		case 2: return nest[0]->add(nest[1]);
		default: return new Error(this->dump());
	}
}

Sub::Sub(string V):Op(V){}
Sym* Sub::eval() { Sym::eval();
	switch (nest.size()) {
		case 1: return nest[0]->pfxminus();
		case 2: return nest[0]->sub(nest[1]);
		default: return new Error(this->dump());
	}
}

Mul::Mul(string V):Op(V){}
Sym* Mul::eval() { Sym::eval();
	switch (nest.size()) {
		case 2: return nest[0]->mul(nest[1]);
		default: return new Error(this->dump());
	}
}

