SOURCES := addi_tb.vhdl memory.vhdl pc.vhdl idecode.vhdl alu.vhdl registers.vhdl
LIBS := string_lib.vhdl

addi_tb: work-obj93.cf 
	ghdl -e --ieee=synopsys $@

work-obj93.cf: $(LIBS) $(SOURCES)
	ghdl -a --ieee=synopsys $(LIBS)
	ghdl -a --ieee=synopsys $(SOURCES)

.PHONY: clean

clean: 
	rm work-obj93.cf

