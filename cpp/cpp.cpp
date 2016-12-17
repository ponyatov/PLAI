#include "hpp.hpp"
#define YYERR "\n\n"<<yylineno<<":"<<msg<<"["<<yytext<<"]\n\n"
void yyerror(string msg) { cout<<YYERR; cerr<<YYERR; exit(-1); }
int main() { glob_init(); yyparse(); glob_dump(); return 0; }

Sym::Sym(string T, string V) { tag=T; val=V; }
Sym::Sym(string V):Sym("sym",V){}
void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { return "<"+tag+":"+val+">"; }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { ostringstream os;
	os << endl << pad(depth) << head() << " # " << this ;
	for (auto it=lookup.begin(),e=lookup.end();it!=e;it++) {
		os << endl << pad(depth+1) << it->first;
		os << it->second->dump(depth+2); }
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		os << (*it)->dump(depth+1);
	return os.str(); }

Sym* Sym::eval(Sym*env) {
	if (env->lookup.count(val)) return env->lookup[val];		// env[] lookup
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		(*it) = (*it)->eval(env); // !!! warning: memory leaks
	return this; }

Sym* Sym::pfxplus()		{ return new Error(" + "+head()); }
Sym* Sym::pfxminus()	{ return new Error(" - "+head()); }

Sym* Sym::add(Sym*o)	{ return new Error(head()+" + "+o->head()); }
Sym* Sym::sub(Sym*o)	{ return new Error(head()+" - "+o->head()); }
Sym* Sym::mul(Sym*o)	{ return new Error(head()+" * "+o->head()); }
Sym* Sym::div(Sym*o)	{ return new Error(head()+" / "+o->head()); }

Sym* Sym::str()			{ return new Str(val); }

Sym* Sym::at(Sym*o)		{ return new Error(head()+" @ "+o->head()); }

Error::Error(string V):Sym("error",V) { yyerror(V); }

Num::Num(string V):Sym("num",V) { val=atof(V.c_str()); }
Num::Num(double F):Sym("num","") { val=F; }
string Num::head() { ostringstream os; os.precision(15);
	os<<val; return os.str(); }
Sym* Num::pfxplus() { return this; }
Sym* Num::pfxminus() { return new Num(-val); }
Sym* Num::add(Sym*o) {
	if (o->tag=="num") return new Num(val + dynamic_cast<Num*>(o)->val);
	else return Sym::add(o);
}
Sym* Num::mul(Sym*o) {
	if (o->tag=="num") return new Num(val * dynamic_cast<Num*>(o)->val);
	else return Sym::mul(o);
}

Str::Str(string V):Sym("str",V){}
string Str::head() { string S="'";
	for (int i=0;i<val.length();i++) switch (val[i]) {
		case 0x09: S += "\\t"; break;
		case 0x0A: S += "\\n"; break;
		case 0x0D: S += "\\r"; break;
		default: S += val[i]; break;
	}
	return S+"'"; }
Sym* Str::add(Sym*o) { return new Str(val+o->str()->val); }
Sym* Str::str() { return this; }

Vector::Vector():Sym("vector","[]"){}
string Vector::head() { return "[]"; }
Sym* Vector::add(Sym*o) { push(o); return this; }
Sym* Vector::div(Sym*o) {
	Sym* V = new Vector();
	for (auto it=nest.begin(),e=nest.end();it!=e;it++) {
		V->push(*it); V->push(o); }
	V->nest.pop_back(); // remove *o tail
	return V; }
Sym* Vector::str() { string S;
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->str()->val;
	return new Str(S); }

Op::Op(string V):Sym("op",V){}

Sym* Sym::eq(Sym*E,Sym*V) { E->lookup[val]=V; return V; }
Sym* Op::eval(Sym*env) {
	if (val=="~") return nest[0]; else Sym::eval(env);
	if (val=="=") return nest[0]->eq(env,nest[1]);
	if (val=="@") return nest[0]->at(nest[1]);
	if (val=="+") switch (nest.size()) {
		case 1: return nest[0]->pfxplus();
		case 2: return nest[0]->add(nest[1]);
	}
	if (val=="-") switch (nest.size()) {
		case 1: return nest[0]->pfxminus();
	}
	if (val=="*") return nest[0]->mul(nest[1]);
	if (val=="/") return nest[0]->div(nest[1]);
	return this; }

Lambda::Lambda():Sym("lambda","{}"){}
string Lambda::head() { return "{}"; }

Fn::Fn(string V, FN F):Sym("fn",V) { fn=F; }
Sym* Fn::at(Sym*o) { return fn(o); }

Dir::Dir(string V):Sym("dir",V) { mkdir(V.c_str()); }
Sym* Dir::dir(Sym*o) { return new Dir(o->str()->val); }
Sym* Dir::div(Sym*o) { return new File(val+'/'+o->str()->val); }

File::File(string V):Sym("file",V) { fh= new ofstream(V); }
Sym* File::eq(Sym*E,Sym*V) { *fh<< V->str()->val <<flush; return V; }

Sym glob("env","global");
void glob_dump(){
	cout << endl<<"================== glob ===================" <<endl;
	cout << glob.dump() <<endl<<endl;
}
void glob_init(){
	glob.lookup["dir"] = new Fn("dir",Dir::dir);
}

