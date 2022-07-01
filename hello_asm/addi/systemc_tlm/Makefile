UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    LD_DIR=linux64
else ifeq ($(UNAME_S),Darwin)
    LD_DIR=macosx64
endif

addi_tb: addi_tb.o
	g++ -o $@ $^ -L $(HOME)/sw/systemc/lib-$(LD_DIR) -lsystemc

addi_tb.o: addi_tb.cpp memory.h cpu.h idecode.h
	g++ -Wall -std=c++11 -c -I $(HOME)/sw/systemc/include $<

.PHONY: clean
clean:
	rm -f addi_tb addi_tb.o
