// fig_begin hello
#include "systemc"
#include "tlm.h"

#include <iostream>

int sc_main(int argc, char* argv[])
{
    std::cout << "Hello, world" << std::endl; 
    sc_core::sc_start();
    return 0;
}
// fig_end hello
