#include "hpp.hpp"

Sym doc("");
Sym::Sym(string T, string V) { tag=T; val=V; lookup["doc"]=&doc;}
Sym::Sym(string V):Sym("sym",V){}

void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { return "<"+tag+":"+val+">"; }
string Sym::pad(int n) { string S; for (int i=0;i<n;i++) S+='\t'; return S; }
string Sym::dump(int depth) { string S = "\n"+pad(depth)+head();
	// lookup elements
	for (auto it=lookup.begin(),e=lookup.end();it!=e;it++) {
		S += "\n"+pad(depth+1);		// padding+1
		S += it->first+" = ";		// name =
		S += it->second->head(); }	// head() only
	for (auto it=nest.begin(),e=nest.end();it!=e;it++)
		S += (*it)->dump(depth+1);
	return S; }

Num::Num(string V):Sym("num",V) { val = atof(V.c_str()); }
Num::Num(float F):Sym("num","") { val = F; }
string Num::head() { ostringstream os;
	os << "<"<<tag<<":"<<val<<">"; return os.str(); }
