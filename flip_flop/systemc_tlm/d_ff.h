#ifndef D_FF_H
#define D_FF_H

#include "systemc"

// fig_begin d_ff
class d_ff : sc_core::sc_module
{
    SC_HAS_PROCESS(d_ff);

public:
    sc_core::sc_in<bool> clk;
    sc_core::sc_in<bool> data_in;
    sc_core::sc_out<bool> data_out;

private:
    bool reg_value;

    void update()
    {
        reg_value = data_in.read();
        data_out.write(reg_value);
    }

public:    
    d_ff(sc_core::sc_module_name name):
        sc_module(name) 
    {
        SC_METHOD(update);
        sensitive << clk.pos(); 
    }
}; 
// fig_end d_ff

#endif
