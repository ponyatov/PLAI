string Sym::head() { return "<"+tag+":"+val+">"; }

string Sym::pad(int n) { string S="";
	for (int i=0;i<n;i++) S += '\t'; 	// S='\t'*n
	return S; }

string Sym::dump(int depth) {
	// header
	string S = "\n"+pad(depth)+head();
	// lookup elements
	for (auto it=lookup.begin(),e=lookup.end();\
	it!=e;it++) {
		S += "\n"+pad(depth+1);		// padding+1 (!)
		S += it->first+" = ";		// name =
		S += it->second->head(); }	// head() only
	// nest[]ed
	for (auto it=nest.begin(),e=nest.end();\
	it!=e;it++)
		S += (*it)->dump(depth+1);	// recursive (!)
	return S; }
