#include "systemc.h"
#include "n_bit_register_tb.h"

int sc_main(int argc, char* argv[])
{
    n_bit_register_tb n_bit_register_tb_0("n_bit_register_tb_0");
    
    sc_trace_file *n_bit_register_tb_wave =
	sc_create_vcd_trace_file("n_bit_register_tb_systemc_tlm_wave");

    sc_trace(n_bit_register_tb_wave,
	     n_bit_register_tb_0.n_bit_register_0.clk, "clk");
    sc_trace(n_bit_register_tb_wave,
	     n_bit_register_tb_0.n_bit_register_0.data_in, "data_in");
    sc_trace(n_bit_register_tb_wave,
	     n_bit_register_tb_0.n_bit_register_0.data_out, "data_out");

    sc_start(17, SC_NS); 

    return 0;
}
