#include "DlxParser.hpp"

#include "Lookup.hpp"
#include "ParseHelpers.hpp"
#include <iomanip>
#include <iostream>

namespace
{
const std::string DATA{".data"};
const std::string TEXT{".text"};
} // namespace

void DlxParser::parse()
{
    parseData();
    writeDataMif();
    parseInstructions();
    writeInstructionMif();
}

void DlxParser::parseData()
{
    std::ifstream input(m_filename);
    if (!input.is_open())
    {
        throw std::runtime_error("ERROR: Unable to open: " + m_filename);
    }
    std::string line;
    bool parseData{false};
    uint32_t insAddress{0};
    uint32_t dataAddress{0};
    while (std::getline(input >> std::ws, line))
    {
        ParseHelpers::cleanupToken(line);
        std::vector<std::string> tokens = ParseHelpers::getTokens(line);
        // Skip any comment
        if (tokens.front().at(0) == ';')
        {
            continue;
        }
        // Check if we've hit the .data field
        if (tokens.front() == DATA)
        {
            parseData = true;
            continue;
        }
        // Check if we've hit the .text field
        else if (tokens.front() == TEXT)
        {
            parseData = false;
            insAddress = 0;
            continue;
        }
        else if (tokens.front().at(0) == '.')
        {
            parseData = false;
            continue;
        }

        if (parseData)
        {
            // Parse the name, size, and values from the line
            std::string name = tokens.front();
            m_addressMap[name] = dataAddress;
            uint32_t size = static_cast<uint32_t>(std::stoi(tokens.at(1)));
            std::vector<int32_t> data;
            for (uint32_t i = 0; i < size; i++)
            {
                int32_t val = static_cast<int32_t>(std::stoi(tokens.at(2 + i)));
                data.emplace_back(val);
            }
            // Add data to our vector
            m_data.emplace_back(DlxData(name, data, dataAddress));
            // Increment the next data address based on the number of bytes used
            dataAddress += size;
        }
        else
        {
            // If the first token is NOT an instruction
            // THEN it is a label
            if (DlxLookup::instructionSet.find(tokens.front()) ==
                DlxLookup::instructionSet.end())
            {
                std::string label = tokens.front();
                m_addressMap[label] = insAddress;
            }
            // Increment because this is a valid instruction
            else
            {
                insAddress++;
            }
        }
    }
}

void DlxParser::writeDataMif()
{
    std::ofstream out(m_dataFilename);
    if (!out.is_open())
    {
        throw std::runtime_error("ERROR: Unable to open file: " +
                                 m_dataFilename);
    }
    out << "DEPTH = 1024;" << std::endl;
    out << "WIDTH = 32;" << std::endl;
    out << "ADDRESS_RADIX = HEX;" << std::endl;
    out << "DATA_RADIX = HEX;" << std::endl;
    out << "CONTENT" << std::endl;
    out << "BEGIN" << std::endl << std::endl;
    for (const auto &value : m_data)
    {
        for (uint32_t i = 0; i < value.m_data.size(); i++)
        {
            out << std::hex << std::uppercase << std::setw(3)
                << std::setfill('0') << value.m_address + i << " : "
                << std::setw(8) << std::setfill('0') << value.m_data.at(i)
                << ";";
            out << "\t--" << value.m_name << "[" << i << "]" << std::endl;
        }
    }
    out << std::endl << "END;" << std::endl;
}

void DlxParser::parseInstructions()
{
    std::ifstream input(m_filename);
    if (!input.is_open())
    {
        throw std::runtime_error("ERROR: Unable to open: " + m_filename);
    }
    std::string line;
    bool start{false};
    uint32_t address{0};
    while (std::getline(input >> std::ws, line))
    {
        ParseHelpers::cleanupToken(line);
        std::vector<std::string> tokens = ParseHelpers::getTokens(line);
        // Skip any comment
        if (tokens.front().at(0) == ';')
        {
            continue;
        }
        // If we find .text
        // set our flag to start processing the instructions
        if (tokens.front() == TEXT)
        {
            start = true;
            continue;
        }
        // Continues are horrible, but because I want less nesting in this
        // function I'm using it.
        // If we haven't found the .text start indication, just skip and go to
        // the next line
        if (!start)
        {
            continue;
        }

        // If this is a valid instruction in our set
        if (DlxLookup::instructionSet.count(tokens.front()) != 0)
        {
            InsType type = DlxLookup::tokenToInsType.at(tokens.front());
            uint32_t opCode = DlxLookup::tokenToOpCode.at(tokens.front());
            uint32_t instruction{0};
            switch (type)
            {
            case InsType::REGISTER:
                instruction = genRegisterInstruction(tokens);
                break;
            case InsType::IMMEDIATE:
                instruction = genImmediateInstruction(tokens);
                break;
            case InsType::MEMORY:
                instruction = genMemoryInstruction(tokens);
                break;
            case InsType::JUMP:
                instruction = genJumpInstruction(tokens);
                break;
            case InsType::BRANCH:
                instruction = genBranchInstruction(tokens);
                break;
            case InsType::NOP:
                instruction = 0;
                break;
            default:
                throw std::runtime_error(
                    "ERROR: Found invalid instruction type!");
                break;
            }
            m_instructs.emplace_back(
                DlxInstruction(address,
                               instruction,
                               static_cast<uint8_t>(opCode),
                               type,
                               line));
            address++;
        }
    }
}

void DlxParser::writeInstructionMif()
{
    std::ofstream out(m_insFilename);
    if (!out.is_open())
    {
        throw std::runtime_error("ERROR: Unable to open file: " +
                                 m_insFilename);
    }
    out << "DEPTH = 1024;" << std::endl;
    out << "WIDTH = 32;" << std::endl;
    out << "ADDRESS_RADIX = HEX;" << std::endl;
    out << "DATA_RADIX = HEX;" << std::endl;
    out << "CONTENT" << std::endl;
    out << "BEGIN" << std::endl << std::endl;
    for (const auto &ins : m_instructs)
    {
        out << std::hex << std::uppercase << std::setw(3) << std::setfill('0')
            << ins.m_address << " : " << std::setw(8) << ins.m_bitField << ";";
        out << "\t-- " << ins.m_line << std::endl;
    }
    out << std::endl << "END;" << std::endl;
}

uint32_t
DlxParser::genRegisterInstruction(const std::vector<std::string> &tokens)
{
    uint32_t instruction{0};
    if (tokens.size() != 4)
    {
        throw std::runtime_error(
            "ERROR: Register Instruction received wrong number of operands");
    }

    try
    {
        // Get the OpCode from the lookup table
        uint32_t opCode = DlxLookup::tokenToOpCode.at(tokens.at(0));
        uint32_t rsd = DlxLookup::tokenToRegister.at(tokens.at(1));
        uint32_t rs1 = DlxLookup::tokenToRegister.at(tokens.at(2));
        uint32_t rs2 = DlxLookup::tokenToRegister.at(tokens.at(3));
        instruction = instruction | (opCode << 26);
        instruction = instruction | (rsd << 21);
        instruction = instruction | (rs1 << 16);
        instruction = instruction | (rs2 << 11);
    }
    catch (std::exception &e)
    {
        std::cout << "ERROR: genRegisterInstruction: " << e.what() << std::endl;
    }
    return instruction;
}

uint32_t
DlxParser::genImmediateInstruction(const std::vector<std::string> &tokens)
{
    uint32_t instruction{0};
    if (tokens.size() != 4)
    {
        throw std::runtime_error(
            "ERROR: Immediate instruction received wrong number of operands");
    }

    try
    {
        // Get the OpCode from the lookup table
        uint32_t opCode = DlxLookup::tokenToOpCode.at(tokens.at(0));
        uint32_t rsd = DlxLookup::tokenToRegister.at(tokens.at(1));
        uint32_t rs1 = DlxLookup::tokenToRegister.at(tokens.at(2));
        uint32_t immediate = static_cast<uint32_t>(std::stoi(tokens.at(3)));

        instruction = instruction | (opCode << 26);
        instruction = instruction | (rsd << 21);
        instruction = instruction | (rs1 << 16);
        instruction = instruction | immediate;
    }
    catch (std::exception &e)
    {
        std::cout << "ERROR: genImmediateInstruction: " << e.what()
                  << std::endl;
    }

    return instruction;
}

uint32_t DlxParser::genMemoryInstruction(const std::vector<std::string> &tokens)
{
    uint32_t instruction{0};
    if (tokens.size() != 3)
    {
        std::cout << "Tokens: ";
        for (const auto &token : tokens)
        {
            std::cout << token << "\t";
        }
        std::cout << std::endl;
        throw std::runtime_error(
            "ERROR: Memory instruction received wrong number of operands");
    }
    try
    {
        // Get the OpCode from the lookup table
        uint32_t opCode = DlxLookup::tokenToOpCode.at(tokens.at(0));
        uint32_t rsd{0};
        uint32_t rOffset{0};
        uint32_t baseAddress{0};

        // if this is a load
        if (tokens.at(0) == "LW")
        {
            rsd = DlxLookup::tokenToRegister.at(tokens.at(1));
            auto pair = ParseHelpers::extractParenths(tokens.at(2));
            rOffset = DlxLookup::tokenToRegister.at(pair.second);
            baseAddress = m_addressMap.at(pair.first);
        }
        else
        {
            rsd = DlxLookup::tokenToRegister.at(tokens.at(2));
            auto pair = ParseHelpers::extractParenths(tokens.at(1));
            rOffset = DlxLookup::tokenToRegister.at(pair.second);
            baseAddress = m_addressMap.at(pair.first);
        }

        instruction = instruction | (opCode << 26);
        instruction = instruction | (rsd << 21);
        instruction = instruction | (rOffset << 16);
        instruction = instruction | baseAddress;
    }
    catch (std::exception &e)
    {
        std::cout << "ERROR: genMemoryInstruction: " << e.what() << std::endl;
    }
    return instruction;
}

uint32_t DlxParser::genJumpInstruction(const std::vector<std::string> &tokens)
{
    uint32_t instruction{0};
    if (tokens.size() != 2)
    {
        throw std::runtime_error(
            "ERROR: Jump instruction received wrong number of operands");
    }

    try
    {
        // Get the OpCode from the lookup table
        uint32_t opCode = DlxLookup::tokenToOpCode.at(tokens.at(0));
        uint32_t regOrAddr{0};
        // If this is a label
        if (DlxLookup::registerSet.count(tokens.at(1)) == 0)
        {
            regOrAddr = m_addressMap.at(tokens.at(1));
        }
        else
        {
            regOrAddr = DlxLookup::tokenToRegister.at(tokens.at(1));
        }

        instruction = instruction | (opCode << 26);
        instruction = instruction | regOrAddr;
    }
    catch (std::exception &e)
    {
        std::cout << "ERROR: genJumpInstruction: " << e.what() << std::endl;
    }

    return instruction;
}

uint32_t DlxParser::genBranchInstruction(const std::vector<std::string> &tokens)
{
    uint32_t instruction{0};
    if (tokens.size() != 3)
    {
        throw std::runtime_error(
            "ERROR: Branch instruction received wrong number of operands");
    }

    try
    {

        // Get the OpCode from the lookup table
        uint32_t opCode = DlxLookup::tokenToOpCode.at(tokens.at(0));
        uint32_t rs1 = DlxLookup::tokenToRegister.at(tokens.at(1));
        uint32_t address = m_addressMap.at(tokens.at(2));

        instruction = instruction | (opCode << 26);
        instruction = instruction | (rs1 << 16);
        instruction = instruction | address;
    }
    catch (std::exception &e)
    {
        std::cout << "ERROR: genBranchInstruction: " << e.what() << std::endl;
    }

    return instruction;
}