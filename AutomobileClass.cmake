# Begin class definition
cpp_class(Automobile)

  # Define an attribute "color" with the default value "red"
  cpp_attr(Automobile color red)
  cpp_attr(Automobile started off)
  cpp_attr(Automobile dist_driven 0)

  # Define a constructor with arguments
  cpp_constructor(CTOR Automobile bool)
  function("${CTOR}" self _start)
    Automobile(SET "${self}" started ${_start})
  endfunction()

  # Define a function "start"
  cpp_member(start Automobile)
  function("${start}" self)
    Automobile(Get "${self}" is_started started)
    if("${is_started}")
    message("You already started the engine!")
    else()
      message("You started the engine.")
      Automobile(SET "${self}" started on)
    endif()
  endfunction()

  # Overload a function "start"
  cpp_member(start Automobile int)
  function("${start}" self distance_km)
    Automobile(Get "${self}" is_started started)
    if("${is_started}")
      Automobile(Get "${self}" dist dist_driven)
      MATH(EXPR dist "${dist} + ${distance_km}")
      Automobile(SET "${self}" dist_driven ${dist})
      message("You already started the car but you drove ${distance_km} km.")
    else()
      Automobile(SET "${self}" dist_driven ${dist})
      message("You started the engine and drove ${distance_km} km!")
      Automobile(SET "${self}" started on)
    endif()
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

    # grab descriptors; my is the prefix for each variable
    Automobile(GET "${self}" my color started dist_driven)

    # Set return_id with PARENT_SCOPE flag
    set("${return_id}" "I'm an automobile, I'm ${my_color}, I'm ${my_started}, and I've driven ${my_dist_driven} km!")
    
    cpp_return("${return_id}")

  endfunction()

# End class definition
cpp_end_class()