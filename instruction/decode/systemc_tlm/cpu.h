#ifndef CPU_H
#define CPU_H

#include "tlm.h"
#include "tlm_utils/simple_initiator_socket.h"

#include <vector>
#include <iostream>
#include <iomanip>

class cpu : sc_core::sc_module
{
    uint32_t pc_value; 
    static const int n_registers = 3;
    std::vector<uint32_t> registers;

    void idecode(uint32_t instruction, uint32_t *reg_id_d, uint32_t *imm_value)
    {
        *reg_id_d = (instruction & 0xF80) >> 7;
        *imm_value = instruction & 0xFFFFF000;
    }

    void reg_write(uint32_t reg_id_d, uint32_t imm_value)
    {
        if (reg_id_d >= 5)
        {
            registers[reg_id_d - 5] = imm_value; 
        }
    }

    void report(uint32_t data_out, uint32_t reg_id_d, uint32_t imm_value)
    {
        std::cout << "pc_value=" << std::setw(4) << std::setfill('0')
                  << std::hex << pc_value
                  << ", data_out=" << std::setw(8) << data_out << std::endl;
        std::cout << "reg_id_d=" << std::setw(2) << std::setfill('0')
                  << std::hex << reg_id_d
                  << ", imm_value=" << std::setw(8) << imm_value << std::endl;

        for (size_t reg_number = 0; reg_number < 3; reg_number++)
        {
            if (reg_number > 0)
            {
                std::cout << ", ";
            }
            std::cout << "reg_" << reg_number << "_value="
                      << std::setw(8) << std::setfill('0')
                      << std::hex << registers[reg_number];
        }
        std::cout << std::endl << std::endl;
    }

    void process()
    {
        tlm::tlm_generic_payload trans;
        trans.set_command(tlm::TLM_READ_COMMAND);

        uint32_t data_out; 
        unsigned char *data_ptr = reinterpret_cast<unsigned char*>(&data_out); 
        trans.set_data_ptr(data_ptr); 

        trans.set_data_length(4); 

        for (int i = 0; i < 6; i++)
        {
            uint32_t reg_id_d;
            uint32_t imm_value; 
            trans.set_address(pc_value); 
            sc_core::sc_time delay(sc_core::SC_ZERO_TIME);
            socket->b_transport(trans, delay);

            idecode(data_out, &reg_id_d, &imm_value);
            reg_write(reg_id_d, imm_value);

            report(data_out, reg_id_d, imm_value);

            pc_value += 4;
      	    wait(10, sc_core::SC_NS); 
        }
    }

public: 
    tlm_utils::simple_initiator_socket<cpu> socket; 

    cpu(sc_core::sc_module_name name): 
        sc_module(name),
        pc_value(0),
        registers(n_registers, 0),
        socket("socket")
    {
        SC_HAS_PROCESS(cpu);
        SC_THREAD(process); 
    }
}; 

#endif
