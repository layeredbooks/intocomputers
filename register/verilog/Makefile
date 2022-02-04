tb: n_bit_register_tb
waves: n_bit_register_tb_verilog_wave.png

n_bit_register_tb: n_bit_register.v n_bit_register_tb.v
	iverilog -o $@ $^

n_bit_register_tb_verilog_wave.vcd.png: n_bit_register_tb_verilog_wave.vcd
	gtkwave $< -S $(BASE_DIR)/lib/tcl/make_png.tcl

n_bit_register_tb_verilog_wave.png: n_bit_register_tb_verilog_wave.vcd.png
	convert $< -colorspace Gray $@

.PHONY: clean
clean:
	rm -f n_bit_register_tb \
	$(addprefix n_bit_register_tb_verilog_wave, .vcd .vcd.png .png)
