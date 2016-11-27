project(fstapi)
cmake_minimum_required(VERSION 2.8.12)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

file(GLOB SOURCES "src/*.c")
add_library(fstapi SHARED ${SOURCES})
target_link_libraries(fstapi ${CONAN_LIBS})