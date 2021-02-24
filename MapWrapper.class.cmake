# Experimenting with wrapping the CMakePP map feature

cpp_class(MapWrapper cpp_map)

    # Class attribute to hold the path of the toolchain file
    cpp_attr(MapWrapper file_path "No path given")

    # Constructor to call the ctor of cpp_map
    cpp_constructor(CTOR MapWrapper str)
    function("${CTOR}" self toolchain_path)
        # Check to see if there's a file
        cpp_file_exists(file_exists "${toolchain_path}")
        if("${file_exists}")
        else()
            message("ERROR: MapWrapper Contructor: Cannot find file at path: ${toolchain_path}")
            return()
        endif()

        # Update toolchain attribute
        MapWrapper(set "${self}" file_path ${toolchain_path})

        # Parse file to add keys & values to map
        file(READ "${toolchain_path}" file_contents)

        #message("${file_contents}")

        string(REGEX MATCHALL "(set\().*\)" match_list "${file_contents}")

        #message("String converted to list")
        foreach(match ${match_list})
            message("${match}")
        endforeach()
    endfunction()

    # Test function to see if inheritence works correctly
    cpp_member(special_function MapWrapper)
    function("${special_function}" self)
        message("This is a function of the wrapper!")
    endfunction()

    #cpp_member(hash_map MapWrapper)
    #function("${hash_map}" self)

    #endfunction()

cpp_end_class()
