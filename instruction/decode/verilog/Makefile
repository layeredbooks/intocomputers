SOURCES := memory.v pc.v idecode.v registers.v one_instruction_tb.v

one_instruction_tb: $(SOURCES)
	iverilog -o $@ $^

.PHONY: clean

clean: 
	rm one_instruction_tb
