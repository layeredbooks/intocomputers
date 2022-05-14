#ifndef IDECODE_H
#define IDECODE_H

#include <cstdint>

// LUI format:
// imm [31:12], rd [4:0], opcode[6:0)]= 0110111
// imm (31:12), rd (11:7), opcode(6:0) = 0110111
// place imm in top 20 bits of rd, fill with zeros

// ANDI format:
// imm [11:0], rs1[4:0], funct3[(2:0] = 111, rd[4:0], opcode[6:0] = 0010011
// imm (31:20), rs1(19:15), funct3(14:12) = 111, rd (11:7), opcode(6:0) = 0010011
// bitwise and on rs1 and sign-extended imm, store result in rd

class idecode_t
{
    const uint32_t LUI = 0x37;
    const uint32_t OP_IMM = 0x13;

    uint32_t imm_lui(uint32_t instr)
    {
        uint32_t imm_mask = 0xfffff000;
        uint32_t imm_value = instr & imm_mask;
        return imm_value;
    }

    uint32_t imm_op_imm(uint32_t instr)
    {
        // 12 bits, at the left-most position
        uint32_t imm_mask = ((1 << 12) - 1) << 20;

        uint32_t imm_value = (instr & imm_mask) >> 20;
        // sign-extend?
        if (imm_value & (1 << 12))
        {
            uint32_t sign_bits = ((1 << 20) - 1) << 12;
            imm_value = imm_value | sign_bits;
        }
        return imm_value;
    }

public:
    void decode(uint32_t instr,
                uint32_t &imm_value, uint32_t &rs1, uint32_t &rd, uint32_t &opcode)
    {
        uint32_t opcode_mask = 0x7f;
        opcode = instr & opcode_mask;

        if (opcode == LUI)
        {
            imm_value = imm_lui(instr);
            rs1 = 0;
        }
        else if (opcode == OP_IMM)
        {
            imm_value = imm_op_imm(instr);
            uint32_t rs1_mask = ((1 << 5) - 1) << 15;
            rs1 = (instr & rs1_mask) >> 15;
        }
        else
        {
            imm_value = 0;
            rs1 = 0;
        }
        uint32_t rd_mask = ((1 << 5) - 1) << 7;
        rd = (instr & rd_mask) >> 7;
    }
};

#endif
