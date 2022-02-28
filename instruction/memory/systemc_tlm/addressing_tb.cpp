#include "systemc"

#include "tlm.h"

#include "pc.h"
#include "memory.h"

class addressing_tb : sc_core::sc_module
{
private:
    pc pc_0; 
    memory memory_0;
public:
    addressing_tb(sc_core::sc_module_name name) : 
        sc_module(name),
        pc_0("pc_0"),
        memory_0("memory_0", 8)
    {
        pc_0.socket.bind(memory_0.socket); 
    }
};

int sc_main(int argc, char* argv[])
{
    addressing_tb addressing_tb_0("addressing_tb_0"); 
    sc_core::sc_start();
    return 0;
}
