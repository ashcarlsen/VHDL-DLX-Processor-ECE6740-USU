#ifndef DLX_DATA_HPP
#define DLX_DATA_HPP

#include <cstdint>
#include <string>
#include <vector>

class DlxData
{
public:
    DlxData(const std::string &name,
            const std::vector<uint32_t> &data,
            uint32_t address) :
            m_name(name),
            m_data(data),
            m_address(address)
    {
    }

    std::string m_name;
    std::vector<uint32_t> m_data;
    uint32_t m_address{0};
};

#endif