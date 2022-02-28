#ifndef D_FF_TB_H
#define D_FF_TB_H

#include "systemc"

#include "d_ff.h"

class d_ff_tb : sc_core::sc_module
{
    SC_HAS_PROCESS(d_ff_tb);

    d_ff d_ff_0; 
    sc_core::sc_clock clk; 
    sc_core::sc_signal<bool> d_ff_data_in; 
    sc_core::sc_signal<bool> d_ff_data_out;

    void stim_gen()
    {
        d_ff_data_in.write(false);
        wait(5, sc_core::SC_NS);
        d_ff_data_in.write(true);
        wait(4, sc_core::SC_NS);
        d_ff_data_in.write(false);
        wait(); 
    }

    void reporter()
    {
        std::cout << "Time: " << sc_core::sc_time_stamp(); 
        std::cout << ", clk=" << clk.read(); 
        std::cout << ", data_in=" << d_ff_data_in.read(); 
        std::cout << ", data_out=" << d_ff_data_out.read()
                  << std::endl;
    }

public: 
    d_ff_tb(sc_core::sc_module_name name):
        sc_core::sc_module(name),
        d_ff_0("d_ff_0"),
        clk("d_ff_clk", 4, sc_core::SC_NS, 0.5, 2, sc_core::SC_NS, true)
    {
        SC_THREAD(stim_gen);
        d_ff_0.clk(clk); 
        d_ff_0.data_in(d_ff_data_in); 
        d_ff_0.data_out(d_ff_data_out);
        SC_METHOD(reporter);
        sensitive << d_ff_0.clk.pos();
        sensitive << d_ff_data_in; 
    }

    void init_sc_trace()
    {
        sc_core::sc_trace_file *d_ff_tb_wave =
            sc_core::sc_create_vcd_trace_file("d_ff_tb_systemc_tlm_wave");

        sc_core::sc_trace(d_ff_tb_wave, d_ff_0.clk, "clk");
        sc_core::sc_trace(d_ff_tb_wave, d_ff_0.data_in, "data_in");
        sc_core::sc_trace(d_ff_tb_wave, d_ff_0.data_out, "data_out");
        sc_core::sc_trace(d_ff_tb_wave, d_ff_0.reg_value, "reg_value");
    }    
}; 

#endif
