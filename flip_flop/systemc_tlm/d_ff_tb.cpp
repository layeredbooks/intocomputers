#include "systemc"
#include "d_ff_tb.h"

int sc_main(int argc, char* argv[])
{
    d_ff_tb d_ff_tb_0("d_ff_tb_0");

    d_ff_tb_0.init_sc_trace();
    
    sc_core::sc_start(17, sc_core::SC_NS); 

    return 0;
}
