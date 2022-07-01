#ifndef MEMORY_H
#define MEMORY_H

#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"

#include <vector>
#include <cstdint>
#include <fstream>
#include <sstream>

class memory : sc_core::sc_module
{
    std::vector<uint32_t> mem;

    void read_from_file(std::string file_name, size_t max_values)
    {
        std::ifstream memory_file(file_name);
        if (!memory_file.is_open())
        {
       	    std::cerr << "ERROR: could not open file " << file_name << std::endl; 
    	    exit(1); 
        }
        size_t lines_read = 0;
        std::string line; 
        while (std::getline(memory_file, line) && lines_read < max_values)
        {
      	    std::istringstream(line) >> std::hex >> mem[lines_read];
    	    lines_read++;
        }
        memory_file.close();
    }
    
    void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay)
    {
        size_t index = static_cast<size_t>(trans.get_address() / 4);
        if (index > mem.size() - 1)
        {
       	    std::cerr << "Error : address " << trans.get_address()
                      << " out of range!" << std::endl;
            trans.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
            return;
        }

        uint32_t *mem_ptr = reinterpret_cast<uint32_t *>(trans.get_data_ptr());
        tlm::tlm_command cmd = trans.get_command();
        if (cmd == tlm::TLM_READ_COMMAND)
        {
            *mem_ptr = mem[index];
        }
        else if (cmd == tlm::TLM_WRITE_COMMAND)
        {
            mem[index] = *mem_ptr;
        }
        else
        {
            std::cout << "Error: illegal command - not read or write" << std::endl; 
        }
    }

public: 
    tlm_utils::simple_target_socket<memory> socket; 

    memory(sc_core::sc_module_name name, size_t size): 
        sc_module(name),
        mem(size, 0),
        socket("socket")
    {
        read_from_file("../memory_contents.txt", size);
        socket.register_b_transport(this, &memory::b_transport);
    }
}; 

#endif
