cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

project(fastpass)

set(CMAKE_CXX_STANDARD 17)

include_directories(src)

add_executable(fastpass src/main.cpp)

#for build use it from build dir

#cmake ..
#cmake --build . --config Release

#or if you are using Windows you can run build.bat
