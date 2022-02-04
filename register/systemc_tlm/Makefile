tb: n_bit_register_tb
waves: n_bit_register_tb_systemc_tlm_wave.png

UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
    LD_DIR=linux64
else ifeq ($(UNAME_S),Darwin)
    LD_DIR=macosx64
endif

n_bit_register_tb: n_bit_register_tb.o
	g++ -o $@ $^ -L $(HOME)/sw/systemc/lib-$(LD_DIR) -lsystemc

n_bit_register_tb.o: n_bit_register_tb.cpp n_bit_register.h n_bit_register_tb.h
	g++ -Wall -std=c++11 -c -I $(HOME)/sw/systemc/include $<

n_bit_register_tb_systemc_tlm_wave.vcd.png: n_bit_register_tb_systemc_tlm_wave.vcd
	gtkwave $< -S $(BASE_DIR)/lib/tcl/make_png.tcl

n_bit_register_tb_systemc_tlm_wave.png: n_bit_register_tb_systemc_tlm_wave.vcd.png
	convert $< -colorspace Gray $@

.PHONY: clean
clean:
	rm -f n_bit_register_tb n_bit_register_tb.o \
	$(addprefix n_bit_register_tb_systemc_tlm_wave, .vcd .vcd.png .png)
