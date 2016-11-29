log.log : src.src ./exe.exe
	./exe.exe < $< > $@ && tail $(TAIL) $@
C = cpp.cpp ypp.tab.cpp 
C = cpp.cpp lex.yy.c
H = hpp.hpp ypp.tab.hpp
H = hpp.hpp
CXXFLAGS += -std=gnu++11
./exe.exe : $(C) $(H)
	$(CXX) $(CXXFLAGS) -o $@ $(C) $(L)
ypp.tab.cpp : ypp.ypp
	bison $<
lex.yy.c : lpp.lpp
	flex $<
