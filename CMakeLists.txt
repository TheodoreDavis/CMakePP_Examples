#Example class for CMakePP
cmake_minimum_required(VERSION 3.19)

project(CMakePP_Examples)

include("${PROJECT_SOURCE_DIR}/cmake/get_cpp.cmake")

# Begin class definition
cpp_class(Automobile)

  # Define an attribute "color" with the default value "red"
  cpp_attr(Automobile color red)
  cpp_attr(Automobile started off)

  # Define a function "start"
  cpp_member(start Automobile)
  function("${start}" self)
    message("You started the engine.")
    Automobile(SET "${self}" started on)
  endfunction()

  cpp_member(drive Automobile int)
  function("${drive}" self distance_km)
  Automobile(Get "${self}" is_started started)
    if("${is_started}")
      message("You drove ${distance_km} km!")
    else()
      message("The car is not started")
    endif()
  endfunction()

# End class definition
cpp_end_class()

# Create an instance of the class called "my_auto" using the default CTOR
Automobile(CTOR my_auto)

# Set color attribute to a different color
Automobile(SET "${my_auto}" color magenta)

# Access the "color" attribute and save it to the var "my_autos_color"
Automobile(GET "${my_auto}" my_autos_color color)

# Print out the value of the var "my_autos_color"
message("The color of my_auto is: ${my_autos_color}")
Automobile(drive "${my_auto}" 2)
Automobile(start "${my_auto}")
Automobile(drive "${my_auto}" 4)