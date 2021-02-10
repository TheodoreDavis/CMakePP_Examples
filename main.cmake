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