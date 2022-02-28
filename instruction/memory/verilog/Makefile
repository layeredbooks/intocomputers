SOURCES := memory.v pc.v addressing_tb.v

addressing_tb: $(SOURCES)
	iverilog -o $@ $^

.PHONY: clean

clean: 
	rm addressing_tb
