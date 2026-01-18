# Specify the minimum required version of CMake
cmake_minimum_required(VERSION 3.22)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

project(DlxAssembler)

set(${PROJECT_NAME}_srcs
  DlxAssembler.cpp
  DlxData.hpp
  DlxInstruction.hpp
  DlxParser.cpp
  DlxParser.hpp
  ParseHelpers.cpp
  ParseHelpers.hpp
)

add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_srcs})
