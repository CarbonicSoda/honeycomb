cmake_minimum_required(VERSION 3.30)

project(honeycomb VERSION 0.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_definitions(-DANTLR4CPP_STATIC)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(ExternalAntlr4Cpp)
include_directories(${ANTLR4_INCLUDE_DIRS})
find_package(ANTLR REQUIRED)

antlr_target(HCLexer src/parser/HCLexer.g4 LEXER
        PACKAGE parser)
antlr_target(HCParser src/parser/HCParser.g4 PARSER
        PACKAGE parser
        DEPENDS_ANTLR HCLexer
        COMPILE_FLAGS -lib ${ANTLR_HCLexer_OUTPUT_DIR}
        VISITOR)

include_directories(${ANTLR_HCLexer_OUTPUT_DIR})
include_directories(${ANTLR_HCParser_OUTPUT_DIR})

add_executable(hcc
        src/hcc.cpp
        ${ANTLR_HCLexer_CXX_OUTPUTS}
        ${ANTLR_HCParser_CXX_OUTPUTS}
)

target_link_libraries(hcc antlr4_static)

# get_cmake_property(variables VARIABLES)
# foreach (var ${variables})
#    message(STATUS "${var}=${${var}}")
# endforeach ()
