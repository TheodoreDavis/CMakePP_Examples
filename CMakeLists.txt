#Example class for CMakePP
cmake_minimum_required(VERSION 3.19)

project(CMakePP_Examples)

include("${PROJECT_SOURCE_DIR}/cmake/get_cpp.cmake")

# Begin class definition
cpp_class(Automobile)

  # Define an attribute "color" with the default value "red"
  cpp_attr(Automobile color red)

# End class definition
cpp_end_class()

# Create an instance of the class called "my_auto" using the default CTOR
Automobile(CTOR my_auto)

# Access the "color" attribute and save it to the var "my_autos_color"
Automobile(GET "${my_auto}" my_autos_color color)

# Print out the value of the var "my_autos_color"
message("The color of my_auto is: ${my_autos_color}")