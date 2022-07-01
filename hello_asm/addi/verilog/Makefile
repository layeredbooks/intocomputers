SOURCES := memory.v pc.v idecode.v registers.v alu.v addi_tb.v

addi_tb: $(SOURCES)
	iverilog -o $@ $^

.PHONY: clean

clean: 
	rm addi_tb
