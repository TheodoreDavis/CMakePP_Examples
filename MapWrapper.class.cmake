# Experimenting with wrapping the CMakePP map feature

cpp_class(MapWrapper cpp_map)

    # Constructor to call the ctor of cpp_map
    cpp_constructor(CTOR MapWrapper)
    function("${CTOR}" self)
        cpp_map(CTOR ${self}) #create map using instance of this class
    endfunction()

    cpp_member(special_function MapWrapper)
    function("${special_function}" self)
        message("This is a function of the wrapper!")
    endfunction()

cpp_end_class()
