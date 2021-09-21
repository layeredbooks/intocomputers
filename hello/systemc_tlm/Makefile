UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    LD_DIR=linux64
else ifeq ($(UNAME_S),Darwin)
    LD_DIR=macosx64
endif

hello: hello.o
	g++ -o hello hello.o -L $(HOME)/sw/systemc/lib-$(LD_DIR) -lsystemc

hello.o: hello.cpp
	g++ -Wall -std=c++11 -c -I $(HOME)/sw/systemc/include hello.cpp

.PHONY: clean
clean:
	rm -f hello hello.o
