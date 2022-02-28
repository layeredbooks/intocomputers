UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    LD_DIR=linux64
else ifeq ($(UNAME_S),Darwin)
    LD_DIR=macosx64
endif

addressing_tb: addressing_tb.o
	g++ -o $@ $^ -L $(HOME)/sw/systemc/lib-$(LD_DIR) -lsystemc

addressing_tb.o: addressing_tb.cpp memory.h pc.h
	g++ -Wall -std=c++11 -c -I $(HOME)/sw/systemc/include $<

.PHONY: clean
clean:
	rm -f addressing_tb addressing_tb.o
