UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    LD_DIR=linux64
else ifeq ($(UNAME_S),Darwin)
    LD_DIR=macosx64
endif

d_ff_tb: d_ff_tb.o
	g++ -o $@ $^ -L $(HOME)/sw/systemc/lib-$(LD_DIR) -lsystemc

d_ff_tb.o: d_ff_tb.cpp d_ff.h d_ff_tb.h
	g++ -Wall -std=c++11 -c -I $(HOME)/sw/systemc/include $<

.PHONY: clean
clean:
	rm -f d_ff_tb d_ff_tb.o d_ff_tb_wave.vcd
