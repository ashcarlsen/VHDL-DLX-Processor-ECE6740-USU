#ifndef DLX_INSTRUCTION_HPP
#define DLX_INSTRUCTION_HPP

#include <cstdint>
#include <string>
#include <vector>

enum class InsType
{
    NOP,
    REGISTER,
    IMMEDIATE,
    MEMORY,
    JUMP,
    BRANCH,
    PRINT,
    SCAN
};

class DlxInstruction
{
public:
    DlxInstruction(uint32_t address,
                   uint32_t bits,
                   uint8_t opCode,
                   InsType type,
                   const std::string &line) :
            m_address(address),
            m_bitField(bits),
            m_opCode(opCode),
            m_type(type),
            m_line(line)
    {
    }

    uint32_t m_address{0};
    uint32_t m_bitField{0};
    uint8_t m_opCode{0};
    InsType m_type{InsType::REGISTER};
    std::string m_line;
};

#endif