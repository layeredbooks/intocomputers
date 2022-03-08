#ifndef N_BIT_REGISTER_TB_H
#define N_BIT_REGISTER_TB_H

#include "systemc.h"

#include "n_bit_register.h"

#include <bitset>

class n_bit_register_tb : sc_core::sc_module
{
    sc_clock clk; 

    sc_signal<int> n_bit_register_data_in; 
    sc_signal<int> n_bit_register_data_out;

    int data_in_value;

    void stim_gen()
    {
        n_bit_register_data_in.write(data_in_value);
        data_in_value++;
    }

    void reporter()
    {
        std::cout << "Time: " << sc_time_stamp(); 
        std::cout << ", data_in=" << std::bitset<N> (n_bit_register_data_in.read());
        std::cout << ", data_out=" << std::bitset<N> (n_bit_register_data_out.read())
                  << std::endl;
    }

    static const int N = 4;

public: 
    n_bit_register n_bit_register_0; 

    n_bit_register_tb(sc_core::sc_module_name name):
        sc_module(name),
        clk("n_bit_register_clk", 4, SC_NS, 1.0), 
        data_in_value(1),
        n_bit_register_0("n_bit_register_0", N)
    {
        n_bit_register_0.clk(clk); 
        n_bit_register_0.data_in(n_bit_register_data_in); 
        n_bit_register_0.data_out(n_bit_register_data_out);
        SC_HAS_PROCESS(n_bit_register_tb);
        SC_METHOD(stim_gen);
        sensitive << n_bit_register_0.clk.pos();
        SC_METHOD(reporter);
        sensitive << n_bit_register_0.clk.pos();
    }
}; 

#endif
