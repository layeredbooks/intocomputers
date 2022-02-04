tb: work-obj93.cf
waves: n_bit_register_tb_vhdl_wave.png

work-obj93.cf: n_bit_register.vhdl n_bit_register_tb.vhdl
	ghdl -a $^

n_bit_register_tb_vhdl_wave.vcd.png: n_bit_register_tb_vhdl_wave.vcd
	gtkwave $< n_bit_register_tb_wave.gtkw -S $(BASE_DIR)/lib/tcl/grab_png.tcl

n_bit_register_tb_vhdl_wave.png: n_bit_register_tb_vhdl_wave.vcd.png
	convert $< -colorspace Gray $@

.PHONY: clean
clean:
	rm -f work-obj93.cf \
	$(addprefix n_bit_register_tb_vhdl_wave, .vcd .vcd.png .png)

