#Example class for CMakePP
cmake_minimum_required(VERSION 3.19)

project(CMakePP_Examples)

include("${PROJECT_SOURCE_DIR}/cmake/get_cpp.cmake")

# Begin class definition
cpp_class(Automobile)

  # Define an attribute "color" with the default value "red"
  cpp_attr(Automobile color red)
  cpp_attr(Automobile started off)
  cpp_attr(Automobile dist_driven 0)

  # Define a function "start"
  cpp_member(start Automobile)
  function("${start}" self)
    message("You started the engine.")
    Automobile(SET "${self}" started on)
  endfunction()

  # Example of function that references attributes / if else logic
  cpp_member(drive Automobile int)
  function("${drive}" self distance_km)
  Automobile(Get "${self}" is_started started)
    if("${is_started}")
      message("You drove ${distance_km} km!")
      Automobile(Get "${self}" dist dist_driven)
      MATH(EXPR dist "${dist} + ${distance_km}") # MATH example
      Automobile(SET "${self}" dist_driven ${dist})
    else()
      message("The car is not started")
    endif()
  endfunction()

  # Example of a function with a return variable
  cpp_member(describe_self Automobile str)
  function("${describe_self}" self return_id)

    # grab descriptors
    Automobile(GET "${self}" my_color color)
    Automobile(GET "${self}" my_state started)
    Automobile(GET "${self}" my_dist dist_driven)

    # Set return_id with PARENT_SCOPE flag
    set("${return_id}" "I'm an automobile, I'm ${my_color}, I'm ${my_state}, and I've driven ${my_dist} km!" PARENT_SCOPE)
    
  endfunction()

# End class definition
cpp_end_class()

# Create an instance of the class called "my_auto" using the default CTOR
Automobile(CTOR my_auto)

# Set color attribute to a different color
Automobile(SET "${my_auto}" color magenta)

# Access the "color" attribute and save it to the var "my_autos_color"
Automobile(GET "${my_auto}" my_autos_color color)


Automobile(describe_self "${my_auto}" my_result)
message("${my_result}")

# Print out the value of the var "my_autos_color"
message("The color of my_auto is: ${my_autos_color}")
Automobile(drive "${my_auto}" 2)
Automobile(start "${my_auto}")
Automobile(drive "${my_auto}" 4)
Automobile(drive "${my_auto}" 8)

Automobile(describe_self "${my_auto}" my_result)
message("${my_result}")