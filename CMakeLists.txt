cmake_minimum_required(VERSION 3.30)
project(honeycomb)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(antlr4-runtime CONFIG REQUIRED)
find_package(LLVM CONFIG REQUIRED)

include_directories(src/parser/generated)
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(src/compiler)

separate_arguments(LLVM_DEFINITIONS_LIST NATIVE_COMMAND ${LLVM_DEFINITIONS})
add_definitions(${LLVM_DEFINITIONS_LIST})

#add_executable()

#target_link_libraries( PRIVATE antlr4_shared)
llvm_map_components_to_libnames(llvm_libs support core irreader)
#target_link_libraries( PRIVATE ${llvm_libs})
