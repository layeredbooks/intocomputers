tb: d_ff_tb
waves: d_ff_tb_systemc_tlm_wave.png

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

d_ff_tb_systemc_tlm_wave.vcd.png: d_ff_tb_systemc_tlm_wave.vcd
	gtkwave d_ff_tb_systemc_tlm_wave.vcd -S $(BASE_DIR)/lib/tcl/make_png.tcl

d_ff_tb_systemc_tlm_wave.png: d_ff_tb_systemc_tlm_wave.vcd.png
	convert $< -colorspace Gray $@

.PHONY: clean
clean:
	rm -f d_ff_tb d_ff_tb.o \
	$(addprefix d_ff_tb_systemc_tlm_wave, .vcd .vcd.png .png)


