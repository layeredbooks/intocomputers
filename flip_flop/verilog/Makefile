tb: d_ff_tb
waves: d_ff_tb_verilog_wave.png

d_ff_tb: d_ff.v d_ff_tb.v
	iverilog -o $@ $^

d_ff_tb_verilog_wave.vcd.png: d_ff_tb_verilog_wave.vcd
	gtkwave d_ff_tb_verilog_wave.vcd -S $(BASE_DIR)/lib/tcl/make_png.tcl

d_ff_tb_verilog_wave.png: d_ff_tb_verilog_wave.vcd.png
	convert $< -colorspace Gray $@

.PHONY: clean
clean:
	rm -f d_ff_tb \
	$(addprefix d_ff_tb_verilog_wave, .vcd .vcd.png .png)
