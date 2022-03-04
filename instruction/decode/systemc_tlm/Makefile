UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    LD_DIR=linux64
else ifeq ($(UNAME_S),Darwin)
    LD_DIR=macosx64
endif

one_instruction_tb: one_instruction_tb.o
	g++ -o $@ $^ -L $(HOME)/sw/systemc/lib-$(LD_DIR) -lsystemc

one_instruction_tb.o: one_instruction_tb.cpp memory.h cpu.h
	g++ -Wall -std=c++11 -c -I $(HOME)/sw/systemc/include $<

.PHONY: clean
clean:
	rm -f one_instruction_tb one_instruction_tb.o
