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

message(" ")
message(" ") # clear some space
message(" ")

MapWrapper(CTOR my_map "${CMAKE_CURRENT_SOURCE_DIR/toolchain.cmake}")

cpp_map(SET "${my_map}" key1 value1)
cpp_map(SET "${my_map}" key2 value2)
cpp_map(SET "${my_map}" key3 value3)

cpp_map(HAS_KEY "${my_map}" res key3)
message("Result of looking for key3: ${res}")

cpp_map(HAS_KEY "${my_map}" res key5)
message("Result of looking for key5: ${res}")

MapWrapper(special_function "${my_map}")