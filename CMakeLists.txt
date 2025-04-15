cmake_minimum_required(VERSION 3.30)
project(honeycomb)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(antlr4-runtime CONFIG REQUIRED)
find_package(LLVM CONFIG REQUIRED)

include_directories(src/parser/generated)
include_directories(${LLVM_INCLUDE_DIRS})

separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

add_executable(hcc
        src/parser/generated/HCLexer.h
        src/parser/generated/HCLexer.cpp
        src/parser/generated/HCParser.h
        src/parser/generated/HCParser.cpp
        src/parser/generated/HCParserBaseVisitor.h
        src/parser/generated/HCParserBaseVisitor.cpp
        src/parser/generated/HCParserVisitor.h
        src/parser/generated/HCParserVisitor.cpp
)

target_link_libraries(hcc PRIVATE antlr4_shared)
llvm_map_components_to_libnames(llvm_libs support core irreader)
target_link_libraries(hcc PRIVATE ${llvm_libs})
