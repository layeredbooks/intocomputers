#include "systemc"

#include "tlm.h"

#include "cpu.h"
#include "memory.h"

class one_instruction_tb : sc_core::sc_module
{
private:
    cpu cpu_0;
    memory memory_0;
public:
    one_instruction_tb(sc_core::sc_module_name name) : 
        sc_module(name),
        cpu_0("cpu_0"),
        memory_0("memory_0", 8)
    {
        cpu_0.socket.bind(memory_0.socket); 
    }
};

int sc_main(int argc, char* argv[])
{
    one_instruction_tb one_instruction_tb_0("one_instruction_tb_0"); 
    sc_core::sc_start();
    return 0;
}
