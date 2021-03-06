# Sadly you can't inherit from the map type so this class acts as a wrapper for a map

cpp_class(MapWrapper)

    # Holds the UID of the map
    cpp_attr(MapWrapper toolchain_map map)

    # Constructor creates a new map
    cpp_constructor(CTOR MapWrapper)
    function("${CTOR}" self)
        cpp_map(CTOR my_map)
        MapWrapper(SET "${self}" toolchain_map ${my_map})
    endfunction()

    # Constructor to allow the user to pass in a pre-defined map
    cpp_constructor(CTOR MapWrapper map)
    function("${CTOR}" self _map_p)
        MapWrapper(SET "${self}" toolchain_map ${_map_p})
    endfunction()

    # Implement GET functionality
    cpp_member(GETT MapWrapper str str)
    function("${GETT}" self _return_id _key_p)
        MapWrapper(GET "${self}" my_map toolchain_map)
        cpp_map(GET "${my_map}" _temp "${_key_p}")
        set("${_return_id}" "${_temp}" PARENT_SCOPE)
    endfunction()

    # Implement SET functionality
    cpp_member(SETT MapWrapper str str)
    function("${SETT}" self _key_p _value_p)
        MapWrapper(GET "${self}" my_map toolchain_map)
        cpp_map(SET "${my_map}" "${_key_p}" "${_value_p}")
    endfunction()

    # Implement APPEND functionality
    cpp_member(APPEND MapWrapper str str)
    function("${APPEND}" self _key_p _new_value_p)
        MapWrapper(GET "${self}" my_map toolchain_map)
        cpp_map(APPEND "${my_map}" "${_key_p}" "${_new_value_p}")
    endfunction()

    # Implement COPY functionality
    # Overwrite this if inheriting from this class
    cpp_member(COPY MapWrapper obj)
    function("${COPY}" self  _mw_copy_p)
        MapWrapper(GET "${self}" my_map toolchain_map)
        cpp_map(COPY "${my_map}" _temp)

        # Create new class instance
        MapWrapper(CTOR _temp2 "${_temp}") 
        set("${_mw_copy_p}" "${_temp2}" PARENT_SCOPE)
    endfunction()

    # TODO: EQUAL
    cpp_member(EQUAL MapWrapper str MapWrapper)
    function("${EQUAL}" self  _return_id _mw_p)
        MapWrapper(GET "${self}" my_map toolchain_map)
        MapWrapper(GET "${_mw_p}" their_map toolchain_map)
        cpp_map(EQUAL "${my_map}" _temp "${their_map}")
        set("${_return_id}" "${_temp}" PARENT_SCOPE)
    endfunction()

    # TODO: HAS_KEY
    cpp_member(HAS_KEY MapWrapper str str)
    function("${COPY}" self  _return_id)
        MapWrapper(GET "${self}" my_map toolchain_map)
        cpp_map(HAS_KEY "${my_map}" _temp)
        set("${_return_id}" "${_temp}" PARENT_SCOPE)
    endfunction()

    # Implements the KEYS functionality
    cpp_member(KEYS MapWrapper str)
    function("${KEYS}" self _return_id)
        MapWrapper(GET "${self}" my_map toolchain_map)
        cpp_map(KEYS "${my_map}" keys)
        set("${_return_id}" "${keys}" PARENT_SCOPE)
    endfunction()

cpp_end_class()
