Num::Num(string V):Sym("num",V) { val=atof(V.c_str()); }
Num::Num(float F):Sym("num","") { val = F; }

string Num::head() { ostringstream os;
	os <<"<"<< tag <<":"<< val <<">"; return os.str(); }
