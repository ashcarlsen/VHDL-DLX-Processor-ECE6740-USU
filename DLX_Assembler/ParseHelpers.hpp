#ifndef PARSE_HELPERS_HPP
#define PARSE_HELPERS_HPP
#include <fstream>
#include <string>
#include <vector>

class ParseHelpers
{
public:
    static std::vector<std::string> getTokens(const std::string &line);
    static void cleanupToken(std::string &token);
    static std::pair<std::string, std::string>
    extractParenths(const std::string &token);
    static bool contains(const std::string &token, const std::string &subStr);
};

#endif