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