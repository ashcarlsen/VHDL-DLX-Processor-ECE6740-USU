#ifndef DLX_PARSER_HPP
#define DLX_PARSER_HPP

#include "DlxData.hpp"
#include "DlxInstruction.hpp"
#include <fstream>
#include <map>

class DlxParser
{
public:
    DlxParser(const std::string &inputFile,
              const std::string &dataFile,
              const std::string &insFile) :
            m_filename(inputFile),
            m_dataFilename(dataFile),
            m_insFilename(insFile)
    {
    }

    void parse();

private:
    void parseData();
    void writeDataMif();
    void parseInstructions();
    void writeInstructionMif();
    uint32_t genRegisterInstruction(const std::vector<std::string> &tokens);
    uint32_t genImmediateInstruction(const std::vector<std::string> &tokens);
    uint32_t genMemoryInstruction(const std::vector<std::string> &tokens);
    uint32_t genJumpInstruction(const std::vector<std::string> &tokens);
    uint32_t genBranchInstruction(const std::vector<std::string> &tokens);
    std::vector<DlxInstruction> m_instructs;
    std::vector<DlxData> m_data;
    std::map<std::string, uint32_t> m_addressMap;
    std::string m_filename;
    std::string m_dataFilename;
    std::string m_insFilename;
};

#endif