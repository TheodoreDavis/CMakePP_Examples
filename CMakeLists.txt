#Example class for CMakePP
cmake_minimum_required(VERSION 3.19)

project(CMakePP_Examples)

include("${PROJECT_SOURCE_DIR}/cmake/get_cpp.cmake")

include("${PROJECT_SOURCE_DIR}/AutomobileClass.cmake")

include("${PROJECT_SOURCE_DIR}/main.cmake")