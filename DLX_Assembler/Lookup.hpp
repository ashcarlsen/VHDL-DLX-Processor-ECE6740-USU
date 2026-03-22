#ifndef LOOKUP_HPP
#define LOOKUP_HPP
#include "DlxInstruction.hpp"
#include <cstdint>
#include <map>
#include <set>
#include <string>

namespace DlxLookup
{

inline const std::set<std::string> instructionSet{
    {"NOP"},  {"LW"},   {"SW"},    {"ADD"},   {"ADDI"}, {"ADDU"},  {"ADDUI"},
    {"SUB"},  {"SUBI"}, {"SUBU"},  {"SUBUI"}, {"AND"},  {"ANDI"},  {"OR"},
    {"ORI"},  {"XOR"},  {"XORI"},  {"SLL"},   {"SLLI"}, {"SRL"},   {"SRLI"},
    {"SRA"},  {"SRAI"}, {"SLT"},   {"SLTI"},  {"SLTU"}, {"SLTUI"}, {"SGT"},
    {"SGTI"}, {"SGTU"}, {"SGTUI"}, {"SLE"},   {"SLEI"}, {"SLEU"},  {"SLEUI"},
    {"SGE"},  {"SGEI"}, {"SGEU"},  {"SGEUI"}, {"SEQ"},  {"SEQI"},  {"SNE"},
    {"SNEI"}, {"BEQZ"}, {"BNEZ"},  {"J"},     {"JR"},   {"JAL"},   {"JALR"},
    {"PCH"},  {"PD"},   {"PDU"},   {"GD"},    {"GDU"}};

inline const std::set<std::string> registerSet{
    {"R0"},  {"R1"},  {"R2"},  {"R3"},  {"R4"},  {"R5"},  {"R6"},  {"R7"},
    {"R8"},  {"R9"},  {"R10"}, {"R11"}, {"R12"}, {"R13"}, {"R14"}, {"R15"},
    {"R16"}, {"R17"}, {"R18"}, {"R19"}, {"R20"}, {"R21"}, {"R22"}, {"R23"},
    {"R24"}, {"R25"}, {"R26"}, {"R27"}, {"R28"}, {"R29"}, {"R30"}, {"R31"}};

inline const std::map<std::string, uint32_t> tokenToOpCode{
    {"NOP", 0x00},  {"LW", 0x01},   {"SW", 0x02},    {"ADD", 0x03},
    {"ADDI", 0x04}, {"ADDU", 0x05}, {"ADDUI", 0x06}, {"SUB", 0x07},
    {"SUBI", 0x08}, {"SUBU", 0x09}, {"SUBUI", 0x0A}, {"AND", 0x0B},
    {"ANDI", 0x0C}, {"OR", 0x0D},   {"ORI", 0x0E},   {"XOR", 0x0F},
    {"XORI", 0x10}, {"SLL", 0x11},  {"SLLI", 0x12},  {"SRL", 0x13},
    {"SRLI", 0x14}, {"SRA", 0x15},  {"SRAI", 0x16},  {"SLT", 0x17},
    {"SLTI", 0x18}, {"SLTU", 0x19}, {"SLTUI", 0x1A}, {"SGT", 0x1B},
    {"SGTI", 0x1C}, {"SGTU", 0x1D}, {"SGTUI", 0x1E}, {"SLE", 0x1F},
    {"SLEI", 0x20}, {"SLEU", 0x21}, {"SLEUI", 0x22}, {"SGE", 0x23},
    {"SGEI", 0x24}, {"SGEU", 0x25}, {"SGEUI", 0x26}, {"SEQ", 0x27},
    {"SEQI", 0x28}, {"SNE", 0x29},  {"SNEI", 0x2A},  {"BEQZ", 0x2B},
    {"BNEZ", 0x2C}, {"J", 0x2D},    {"JR", 0x2E},    {"JAL", 0x2F},
    {"JALR", 0x30}, {"PCH", 0x31},  {"PD", 0x32},    {"PDU", 0x33},
    {"GD", 0x34},   {"GDU", 0x35}};

inline const std::map<std::string, InsType> tokenToInsType{
    {"NOP", InsType::NOP},         {"LW", InsType::MEMORY},
    {"SW", InsType::MEMORY},       {"ADD", InsType::REGISTER},
    {"ADDI", InsType::IMMEDIATE},  {"ADDU", InsType::REGISTER},
    {"ADDUI", InsType::IMMEDIATE}, {"SUB", InsType::REGISTER},
    {"SUBI", InsType::IMMEDIATE},  {"SUBU", InsType::REGISTER},
    {"SUBUI", InsType::IMMEDIATE}, {"AND", InsType::REGISTER},
    {"ANDI", InsType::IMMEDIATE},  {"OR", InsType::REGISTER},
    {"ORI", InsType::IMMEDIATE},   {"XOR", InsType::REGISTER},
    {"XORI", InsType::IMMEDIATE},  {"SLL", InsType::REGISTER},
    {"SLLI", InsType::IMMEDIATE},  {"SRL", InsType::REGISTER},
    {"SRLI", InsType::IMMEDIATE},  {"SRA", InsType::REGISTER},
    {"SRAI", InsType::IMMEDIATE},  {"SLT", InsType::REGISTER},
    {"SLTI", InsType::IMMEDIATE},  {"SLTU", InsType::REGISTER},
    {"SLTUI", InsType::IMMEDIATE}, {"SGT", InsType::REGISTER},
    {"SGTI", InsType::IMMEDIATE},  {"SGTU", InsType::REGISTER},
    {"SGTUI", InsType::IMMEDIATE}, {"SLE", InsType::REGISTER},
    {"SLEI", InsType::IMMEDIATE},  {"SLEU", InsType::REGISTER},
    {"SLEUI", InsType::IMMEDIATE}, {"SGE", InsType::REGISTER},
    {"SGEI", InsType::IMMEDIATE},  {"SGEU", InsType::REGISTER},
    {"SGEUI", InsType::IMMEDIATE}, {"SEQ", InsType::REGISTER},
    {"SEQI", InsType::IMMEDIATE},  {"SNE", InsType::REGISTER},
    {"SNEI", InsType::IMMEDIATE},  {"BEQZ", InsType::BRANCH},
    {"BNEZ", InsType::BRANCH},     {"J", InsType::JUMP},
    {"JR", InsType::JUMP},         {"JAL", InsType::JUMP},
    {"JALR", InsType::JUMP},       {"PCH", InsType::PRINT},
    {"PD", InsType::PRINT},        {"PDU", InsType::PRINT},
    {"GD", InsType::SCAN},         {"GDU", InsType::SCAN}};

inline const std::map<std::string, uint32_t> tokenToRegister{
    {"R0", 0x00},  {"R1", 0x01},  {"R2", 0x02},  {"R3", 0x03},  {"R4", 0x04},
    {"R5", 0x05},  {"R6", 0x06},  {"R7", 0x07},  {"R8", 0x08},  {"R9", 0x09},
    {"R10", 0x0A}, {"R11", 0x0B}, {"R12", 0x0C}, {"R13", 0x0D}, {"R14", 0x0E},
    {"R15", 0x0F}, {"R16", 0x10}, {"R17", 0x11}, {"R18", 0x12}, {"R19", 0x13},
    {"R20", 0x14}, {"R21", 0x15}, {"R22", 0x16}, {"R23", 0x17}, {"R24", 0x18},
    {"R25", 0x19}, {"R26", 0x1A}, {"R27", 0x1B}, {"R28", 0x1C}, {"R29", 0x1D},
    {"R30", 0x1E}, {"R31", 0x1F}};
} // namespace DlxLookup

#endif