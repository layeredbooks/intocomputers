SOURCES := memory.v pc.v idecode.v registers.v alu.v andi_tb.v

andi_tb: $(SOURCES)
	iverilog -o $@ $^

.PHONY: clean

clean: 
	rm andi_tb
