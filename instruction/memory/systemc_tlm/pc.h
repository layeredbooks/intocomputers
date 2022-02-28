#ifndef PC_H
#define PC_H

#include "tlm.h"
#include "tlm_utils/simple_initiator_socket.h"

#include <cstdint>
#include <iostream>
#include <iomanip>

class pc : sc_core::sc_module
{
    uint32_t pc_value;

    void process()
    {
        tlm::tlm_generic_payload trans;
        trans.set_command(tlm::TLM_READ_COMMAND);

        uint32_t data_read; 
        unsigned char *data_ptr = reinterpret_cast<unsigned char*>(&data_read); 
        trans.set_data_ptr(data_ptr); 

        trans.set_data_length(4); 

        for (int i = 0; i < 7; i++)
        {
            trans.set_address(pc_value); 
            sc_core::sc_time delay(sc_core::SC_ZERO_TIME);
            socket->b_transport(trans, delay);
            std::cout << "pc_value=" << std::setw(4) << std::setfill('0')
                      << std::hex << pc_value
                      << ", data_read=" << std::setw(8) << data_read << std::endl;
       	    pc_value += 4;
        }
    }

public: 
    tlm_utils::simple_initiator_socket<pc> socket; 

    pc(sc_core::sc_module_name name):
        sc_module(name),
        pc_value(0),
        socket("socket")
    {
        SC_HAS_PROCESS(pc);
        SC_THREAD(process); 
    }

}; 

#endif
