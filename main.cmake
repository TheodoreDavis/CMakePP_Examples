# # Create an instance of the class called "my_auto" using the default CTOR
# Automobile(CTOR my_auto)

# # Set color attribute to a different color
# Automobile(SET "${my_auto}" color magenta)

# # Access the "color" attribute and save it to the var "my_autos_color"
# Automobile(GET "${my_auto}" my_autos_color color)


# Automobile(describe_self "${my_auto}" my_result)
# message("${my_result}")

# # Print out the value of the var "my_autos_color"
# message("The color of my_auto is: ${my_autos_color}")
# Automobile(drive "${my_auto}" 2)
# Automobile(start "${my_auto}")
# Automobile(drive "${my_auto}" 4)
# Automobile(drive "${my_auto}" 8)

# Automobile(describe_self "${my_auto}" my_result)
# message("${my_result}")

# message(" ")
# message(" ") # clear some space
# message(" ")

#MapWrapper(CTOR my_wrapper "${CMAKE_CURRENT_SOURCE_DIR}/toolchain.cmake")

#control
cpp_map(CTOR my_map)

#test get and set
message("Testing get and set:")
cpp_map(SET "${my_map}" key1 val1)
cpp_map(SET "${my_map}" key2 val2)
cpp_map(SET "${my_map}" key3 val3)
cpp_map(SET "${my_map}" key4 val4)
cpp_map(SET "${my_map}" key5 val5)

cpp_map(GET "${my_map}" res key1)
message("${res}")
cpp_map(GET "${my_map}" res key2)
message("${res}")
cpp_map(GET "${my_map}" res key3)
message("${res}")
cpp_map(GET "${my_map}" res key4)
message("${res}")
cpp_map(GET "${my_map}" res key5)
message("${res}")
message("")

#test append
message("Testing append:")
cpp_map(APPEND "${my_map}" key1 "appended")
cpp_map(GET "${my_map}" res key1)
message("${res}")
message("")

#test copy and equals
message("Testing copy and equals:")
cpp_map(COPY "${my_map}" my_map_copy)
cpp_map(EQUAL "${my_map}" res "${my_map_copy}")
message("${res}")
cpp_map(SET "${my_map_copy}" key6 val6)
cpp_map(EQUAL "${my_map}" res "${my_map_copy}")
message("${res}")
message("")

#test has_key
message("Testing has_key:")
cpp_map(HAS_KEY "${my_map}" res key6)
message("${res}")
cpp_map(HAS_KEY "${my_map_copy}" res key6)
message("${res}")
message("")

#test keys
message("Testing keys:")
cpp_map(KEYS "${my_map}" res)
message("${res}")
message("")
message("")

###########################################################
#test

MapWrapper(CTOR mw)

#test get and set
message("Testing get and set:")
MapWrapper(SETT "${mw}" key1 val1)
MapWrapper(SETT "${mw}" key2 val2)
MapWrapper(SETT "${mw}" key3 val3)
MapWrapper(SETT "${mw}" key4 val4)
MapWrapper(SETT "${mw}" key5 val5)

MapWrapper(GETT "${mw}" res key1)
message("${res}")
MapWrapper(GETT "${mw}" res key2)
message("${res}")
MapWrapper(GETT "${mw}" res key3)
message("${res}")
MapWrapper(GETT "${mw}" res key4)
message("${res}")
MapWrapper(GETT "${mw}" res key5)
message("${res}")
message("")

#test append
message("Testing append:")
MapWrapper(APPEND "${mw}" key1 "appended")
MapWrapper(GETT "${mw}" res key1)
message("${res}")
message("")

#test copy and equals
message("Testing copy and equals:")
MapWrapper(COPY "${mw}" mw_copy)
MapWrapper(EQUAL "${mw}" res "${mw}")
message("${res}")
MapWrapper(SETT "${mw_copy}" key6 val6)
MapWrapper(EQUAL "${mw}" res "${mw_copy}")
message("${res}")
message("")

#test has_key
message("Testing has_key:")
MapWrapper(HAS_KEY "${mw}" res key6)
message("${res}")
MapWrapper(HAS_KEY "${mw_copy}" res key6)
message("${res}")
message("")

#test keys
message("Testing keys:")
MapWrapper(KEYS "${mw}" res)
message("${res}")
message("")
message("")
###################################################






