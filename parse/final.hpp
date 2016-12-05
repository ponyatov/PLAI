
struct Sym {
	string tag; string val;
	Sym(string,string); Sym(string);
	vector<Sym*> nest; void push(Sym*);
	map<string,Sym*> lookup;
	virtual string head(); string pad(int); virtual string dump(int=0);
};

struct Sym {			// algebraic data type
	string tag;					// T: class/type tag
	string val;					// V: value
	Sym(string T, string V);	// <T:V> constructor
	Sym(string V);				// token constructor
	vector<Sym*> nest;			// \ nested element
	void push(Sym*);			// / add nested elememt
	map<string,Sym*> lookup;	// lookup table
	virtual string head();		// \ <T:V> string representation
	string pad(int);			//   tree padding
	virtual string dump(int=0);	// / dump tree
};
