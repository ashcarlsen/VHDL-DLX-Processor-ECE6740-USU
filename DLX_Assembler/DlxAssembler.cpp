#include "CLI11.hpp"
#include "DlxParser.hpp"
#include <fstream>
#include <iostream>

int main(int argc, char** argv)
{
    CLI::App app;
    std::string inputFile;
    app.add_option(
           "<input_file>", inputFile, "Input DLX assembly file to parse")
        ->required()
        ->check(CLI::ExistingFile);
    std::string dataFile;
    app.add_option(
           "<data_file>", dataFile, "Output filename for Data .mif file")
        ->required();
    std::string insFile;
    app.add_option("<instruction_file>",
                   insFile,
                   "Output filename for Instruction .mif file")
        ->required();

    CLI11_PARSE(app, argc, argv);

    // TODO:
    // Read file, populate Data map and label/address map
    // Write Data map into the data MIF
    // Read file starting at top label
    // Parse each instruction into a vector of uint32_t
    // Write Instruction MIF
    // END :)

    try
    {
        DlxParser parser(inputFile, dataFile, insFile);
        parser.parse();
    }
    catch (std::exception &e)
    {
        std::cerr << "Caught exception: " << e.what() << std::endl;
    }

    return 0;
}