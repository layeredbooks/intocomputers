#ifndef N_BIT_REGISTER_H
#define N_BIT_REGISTER_H

#include "systemc.h"

class n_bit_register : sc_core::sc_module
{
public: 
    sc_in<bool> clk;
    sc_in<int> data_in;
    sc_out<int> data_out;

    const int reg_value_min;
    const int reg_value_max;

    int reg_value;
    
    void update()
    {
        reg_value = data_in.read();
        if (reg_value < reg_value_min || reg_value > reg_value_max)
        {
            std::cerr << "reg_value " << reg_value << "is out of "
                      << "range [" << reg_value_min << ", "
                      << reg_value_max << ",]" << "\n";
        }
        data_out.write(reg_value);
    }

    SC_HAS_PROCESS(n_bit_register);

    n_bit_register(sc_core::sc_module_name name, int N):
        sc_module(name),
        reg_value_min(-(1 << N)),
        reg_value_max( (1 << N) - 1 )
    {
        SC_METHOD(update);
        sensitive << clk.pos(); 
    }
}; 

#endif
