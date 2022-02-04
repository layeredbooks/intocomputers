tb: work-obj93.cf
waves: d_ff_tb_vhdl_wave.png

work-obj93.cf: d_ff.vhdl d_ff_tb.vhdl
	ghdl -a $^

d_ff_tb_vhdl_wave.vcd.png: d_ff_tb_vhdl_wave.vcd
	gtkwave $< d_ff_tb_wave.gtkw -S $(BASE_DIR)/lib/tcl/grab_png.tcl

d_ff_tb_vhdl_wave.png: d_ff_tb_vhdl_wave.vcd.png
	convert $< -colorspace Gray $@

.PHONY: clean
clean:
	rm -f work-obj93.cf \
	$(addprefix d_ff_tb_vhdl_wave, .vcd .vcd.png .png)
