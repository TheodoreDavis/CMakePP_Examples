# Sadly you can't inherit from the map type so this class acts as a wrapper for a map

cpp_class(MapWrapper)

    # Class attribute to hold the path of the toolchain file
    cpp_attr(MapWrapper file_path "")
    cpp_attr(MapWrapper toolchain_map map)
    cpp_attr(MapWrapper toolchain_keys "")

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
        MapWrapper(SET "${self}" file_path ${toolchain_path})

        # Parse file to add keys & values to map
        file(READ "${toolchain_path}" file_contents)

        # Create an instance of a cpp_map
        cpp_map(CTOR my_map)
        MapWrapper(SET "${self}" toolchain_map ${my_map})

        # Create a list of all variables in the toolchain file
        string(REGEX MATCHALL "(set\()[^\r\n]*\)" match_list "${file_contents}")

        #message("String converted to list")
        foreach(match ${match_list})
            #message("${match}")
            string(FIND ${match} "\(" beg_index)
            string(FIND ${match} " " mid_index)
            string(FIND ${match} "\)" end_index REVERSE)
            #message("${beg_index} ${mid_index} ${end_index}")

            MATH(EXPR beg_index "${beg_index} + 1")
            MATH(EXPR len_key "${mid_index} - ${beg_index}")
            MATH(EXPR mid_index "${mid_index} + 1")
            MATH(EXPR len_val "${end_index} - ${mid_index}")

            string(SUBSTRING ${match} ${beg_index} ${len_key} key)
            string(SUBSTRING ${match} ${mid_index} ${len_val} value)
            
            cpp_map(SET "${my_map}" "${key}" "${value}")
        endforeach()

        # Store variables added from toolchain file to warn against overwriting
        cpp_map(KEYS "${my_map}" key_list) # TODO : do this myself inside the for loop
        MapWrapper(SET "${self}" toolchain_keys "${key_list}")
    endfunction()

    # Implement SET functionality with extra error checking
    cpp_member(SET MapWrapper str str)
    function("${SET}" self key_param value_param)

        # Grab list of variables set in toolchain file and see if we're setting one of them
        MapWrapper(GET "${self}" key_list toolchain_keys)
        foreach(key ${key_list})
            string(COMPARE EQUAL "${key_param}" "${key}" comparison)
            message("${key_param} == ${key}?: ${comparison}")
            if(${comparison})
                message("Warning: You're overwritting a variable set in the toolchain file")
                break()
            endif()
        endforeach()
        MapWrapper(GET "${self}" my_map toolchain_map)
        cpp_map(SET "${my_map}" "${key_param}" "${value_param}")
    endfunction()
    
    # Implements the KEYS functionality
    cpp_member(KEYS MapWrapper str)
    function("${KEYS}" self return_id)
        MapWrapper(GET "${self}" my_map toolchain_map)
        cpp_map(KEYS "${my_map}" keys)
        set("${return_id}" "${keys}" PARENT_SCOPE)
    endfunction()

cpp_end_class()
