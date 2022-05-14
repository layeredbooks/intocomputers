#ifndef CPU_H
#define CPU_H

#include "tlm.h"
#include "tlm_utils/simple_initiator_socket.h"

#include <vector>
#include <iostream>
#include <iomanip>

#include "idecode.h"

class cpu : sc_core::sc_module
{
    uint32_t pc_value; 

    idecode_t idc;

    static const int n_registers = 32;
    std::vector<uint32_t> registers;
    
    void reg_write(uint32_t rd, uint32_t value)
    {
        registers[rd] = value; 
    }

    uint32_t reg_read(uint32_t rs)
    {
        return registers[rs];
    }

    void report(uint32_t data_out, uint32_t rs1, uint32_t rd,
                uint32_t imm_value, uint32_t rd_value)
    {
        std::cout << "pc_value=" << std::setw(8) << std::setfill('0')
                  << std::hex << pc_value
                  << ", data_out=" << std::setw(8) << data_out
                  << ", rs1=" << std::setw(2) << rs1 << std::endl;
        std::cout << "rd=" << std::setw(2) << std::setfill('0')
                  << std::hex << rd
                  << ", imm_value=" << std::setw(8) << imm_value
                  << ", rd_value=" << std::setw(8) << rd_value << std::endl;
    }

    void process()
    {
        tlm::tlm_generic_payload trans;
        trans.set_command(tlm::TLM_READ_COMMAND);

        uint32_t data_out; 
        unsigned char *data_ptr = reinterpret_cast<unsigned char*>(&data_out); 
        trans.set_data_ptr(data_ptr); 

        trans.set_data_length(4); 

        for (int i = 0; i < 7; i++)
        {
            uint32_t imm_value;
            uint32_t rs1;
            uint32_t rd;
            uint32_t opcode;
            
            trans.set_address(pc_value); 
            sc_core::sc_time delay(sc_core::SC_ZERO_TIME);
            socket->b_transport(trans, delay);

            idc.decode(data_out, imm_value, rs1, rd, opcode);

            const uint32_t LUI = 0x37;
            const uint32_t OP_IMM = 0x13;

            uint32_t rd_value;
            if (opcode == LUI)
            {
                rd_value = imm_value;    
            }
            else if (opcode == OP_IMM)
            {
                rd_value = imm_value & reg_read(rs1);
            }
            else
            {
                rd_value = 0;
            }

            reg_write(rd, rd_value);

            report(data_out, rs1, rd, imm_value, rd_value);

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
