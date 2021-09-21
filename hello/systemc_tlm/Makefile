hello: hello.o
	g++ -o hello hello.o -L $(HOME)/sw/systemc/lib-macosx64 -lsystemc

hello.o: hello.cpp
	g++ -Wall -std=c++11 -c -I $(HOME)/sw/systemc/include hello.cpp

.PHONY: clean
clean:
	rm -f hello hello.o
