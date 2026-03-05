#include "ParseHelpers.hpp"
#include <algorithm>
#include <iomanip>
#include <iostream>
#include <sstream>

void ParseHelpers::cleanupToken(std::string &token)
{
    if (token.at(0) != ';')
    {
        token = token.substr(0, token.find(';'));
    }
    token.erase(std::remove(token.begin(), token.end(), ','), token.end());
    token.erase(std::remove(token.begin(), token.end(), '\r'), token.end());
    token.erase(std::remove(token.begin(), token.end(), '\n'), token.end());

    size_t pos = 0;
    // Replace all newlines with actual newline characters
    while ((pos = token.find("\\n", pos)) != std::string::npos)
    {
        token.replace(pos, 2, "\n");
        pos += 1;
    }
    // Replace all tabs with actual tab characters
    while ((pos = token.find("\\t", pos)) != std::string::npos)
    {
        token.replace(pos, 2, "\t");
        pos += 1;
    }
}

std::vector<std::string> ParseHelpers::getTokens(const std::string &line)
{
    std::stringstream ss(line);
    std::string token;
    std::vector<std::string> tokens;
    while (ss >> std::quoted(token))
    {
        tokens.push_back(token);
    }
    return tokens;
}

std::pair<std::string, std::string>
ParseHelpers::extractParenths(const std::string &token)
{
    size_t open = token.find('(');
    size_t close = token.find(')');
    std::pair<std::string, std::string> retVal;

    if (open != std::string::npos && close != std::string::npos && close > open)
    {
        retVal.first = token.substr(0, open);
        retVal.second = token.substr(open + 1, close - open - 1);
    }
    return retVal;
}

bool ParseHelpers::contains(const std::string &token, const std::string &subStr)
{
    return (token.find(subStr) != std::string::npos);
}