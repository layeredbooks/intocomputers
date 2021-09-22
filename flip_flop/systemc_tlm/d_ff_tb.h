#ifndef D_FF_TB_H
#define D_FF_TB_H

#include "systemc"

#include "d_ff.h"

// fig_begin d_ff_tb_h
class d_ff_tb : sc_core::sc_module
{
    SC_HAS_PROCESS(d_ff_tb);

    d_ff d_ff_0; 
    sc_core::sc_clock clk; 
    sc_core::sc_signal<bool> d_ff_data_in; 
    sc_core::sc_signal<bool> d_ff_data_out;

    // fig_begin d_ff_stim
    void stim_gen()
    {
        d_ff_data_in.write(true);
        wait(1, sc_core::SC_NS);
        d_ff_data_in.write(false);
        wait(5, sc_core::SC_NS);
        d_ff_data_in.write(true);
        wait(3, sc_core::SC_NS);
        d_ff_data_in.write(false);
        wait(); 
    }
    // fig_end d_ff_stim

    void reporter()
    {
        std::cout << "Time: " << sc_core::sc_time_stamp(); 
        std::cout << ", data_in=" << d_ff_data_in.read(); 
        std::cout << ", data_out=" << d_ff_data_out.read()
                  << std::endl;
    }

public: 
    d_ff_tb(sc_core::sc_module_name name):
        sc_core::sc_module(name),
        d_ff_0("d_ff_0"),
        //fig_begin clk_gen
        clk("d_ff_clk", 4, sc_core::SC_NS, 1.0)
        //fig_end clk_gen
    {
        SC_THREAD(stim_gen);
        d_ff_0.clk(clk); 
        d_ff_0.data_in(d_ff_data_in); 
        d_ff_0.data_out(d_ff_data_out);
        SC_METHOD(reporter);
        // fig_begin d_ff_tb_sensitive
        sensitive << d_ff_0.clk.pos();
        sensitive << d_ff_data_in; 
        // fig_end d_ff_tb_sensitive
    }

    void init_sc_trace()
    {
        sc_core::sc_trace_file *d_ff_tb_wave =
            sc_core::sc_create_vcd_trace_file("d_ff_tb_wave");

        sc_core::sc_trace(d_ff_tb_wave, d_ff_0.clk, "clk");
        sc_core::sc_trace(d_ff_tb_wave, d_ff_0.data_in, "data_in");
        sc_core::sc_trace(d_ff_tb_wave, d_ff_0.data_out, "data_out");
    }    
}; 
// fig_end d_ff_tb_h

#endif
