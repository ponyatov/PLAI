#include "hpp.hpp"

Sym::Sym(string T, string V) { tag=T; val=V; }
Sym::Sym(string V):Sym("sym",V){}

void Sym::push(Sym*o) { nest.push_back(o); }

string Sym::head() { return "<"+tag+":"+val+">"; }
