#include <sstream>

struct Num:Sym {		// number/float wrap class
	float val;				// wrapped value type
	Num(string);			// token/string constructor
	Num(float);				// float constructor
	string head();			// redefine for float val
};
