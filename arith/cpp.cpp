#include "hpp.hpp"

Sym::Sym(string T, string V) { tag=T; val=V; }
Sym::Sym(string V):Sym("sym",V){}

string Sym::head() { return "<"+tag+":"+val+">"; }
