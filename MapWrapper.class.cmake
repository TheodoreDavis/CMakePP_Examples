#[[[ MapWrapper class
# 
# This class implements all the functionality of the map data type
# implemented in CMakePP. The use case for this class is for inhertability.
#]]
cpp_class(MapWrapper)

    #[[[
    # 
    # Attribute to hold the map
    #]]
    cpp_attr(MapWrapper mw_map map)

    #[[[ Constructs a new MapWrapper instance along with a new map instance.
    #
    # This function creates a new MapWrapper instance. The resulting MapWrapper
    # instance will always be empty.
    #
    # TODO: add args parameter to allow users to add keys/vals to construction.
    #
    # :param self: The map storing the key-value pairs.
    # :type self: MapWrapper
    # :returns: ``self`` will be set to the newly created MapWrapper.
    # :rtype: MapWrapper
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_constructor(CTOR MapWrapper)
    function("${CTOR}" self)
        cpp_assert_signature("${ARGV}" MapWrapper)

        cpp_map(CTOR my_map)
        MapWrapper(SET "${self}" mw_map ${my_map})
    endfunction()

    #[[[ Constructs a new MapWrapper instance using the instance of the passed in map.
    #
    # This function creates a new MapWrapper instance. The resulting MapWrapper
    # instance will contain all the keys and values of the passed in map. Note
    # that this instance does not deep copy the map and will alias the original map.
    #
    # :param self: The MapWrapper to emulate a map.
    # :type self: MapWrapper
    # :param _map_p: The preconstructed map instance.
    # :type _map_p: map
    # :returns: ``self`` will be set to the newly created MapWrapper.
    # :rtype: MapWrapper
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_constructor(CTOR MapWrapper map)
    function("${CTOR}" self _map_p)
        cpp_assert_signature("${ARGV}" MapWrapper map)

        MapWrapper(SET "${self}" mw_map ${_map_p})
    endfunction()

    #[[[ Retrieves the value of the specified key.
    #
    # This function is used to retrieve the value associated with the provided key.
    # If a key has not been set this function will return the empty string. Users
    # can use ``has_key(mapwrapper, desc, str)`` to determine whether the map does not have the
    # key or if the key was simply set to the empty string.
    #
    # :param self: The map storing the key-value pairs.
    # :type self: MapWrapper
    # :param _return_id: Name for the identifier to save the value to.
    # :type _return_id: desc
    # :param _key_p: The key whose value we want.
    # :type _key_p: str
    # :returns: ``_return_id`` will be set to the value associated with ``_key_p``.
    #           If ``_key_p`` has no value associated with it ``_return_id`` will be
    #           set to the empty string.
    # :rtype: str
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_member(GET_VAL MapWrapper desc str)
    function("${GET_VAL}" self _return_id _key_p)
        cpp_assert_signature("${ARGV}" MapWrapper desc str)

        MapWrapper(GET "${self}" my_map mw_map)
        cpp_map(GET "${my_map}" _temp "${_key_p}")
        set("${_return_id}" "${_temp}" PARENT_SCOPE)
    endfunction()

    #[[[ Associates a value with the specified key.
    #
    # This function can be used to set the value of a map's key. If the key has a
    # value associated with it already that value will be overridden.
    #
    # :param self: The map whose key is going to be set.
    # :type self: MapWrapper
    # :param _key_p: The key whose value is going to be set.
    # :type _key_p: str
    # :param _value_p: Value we are seting to be stored under ``_key_p``.
    # :type _app_value_p: str
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_member(SET_VAL MapWrapper str str)
    function("${SET_VAL}" self _key_p _value_p)
        cpp_assert_signature("${ARGV}" MapWrapper str str)

        MapWrapper(GET "${self}" my_map mw_map)
        cpp_map(SET "${my_map}" "${_key_p}" "${_value_p}")
    endfunction()

    #[[[ Appends to the value stored under the specified key.
    #
    # This function can be used to get a list of keys which have been set for this
    # map.
    #
    # :param self: The map whose keys are being retrieved.
    # :type self: MapWrapper
    # :param _key_p: The key whose value is being appended to.
    # :type _key_p: str
    # :param _app_value_p: Value we are appending to the list stored under ``_key_p``.
    # :type _app_value_p: str
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_member(APPEND MapWrapper str str)
    function("${APPEND}" self _key_p _app_value_p)
        cpp_assert_signature("${ARGV}" MapWrapper str str)

        MapWrapper(GET "${self}" my_map mw_map)
        cpp_map(APPEND "${my_map}" "${_key_p}" "${_app_value_p}")
    endfunction()

    #[[[ Makes a deep copy of a Map instance.
    #
    # This function will deep copy (recursively) the contents of a map into a new
    # Map instance. The resulting instance will not alias the original map in any
    # way.
    #
    # :param self: The MapWrapper instance being copied.
    # :type self: MapWrapper
    # :param _mw_copy_p: The name of the variable which will hold the deep copy.
    # :type _mw_copy_p: desc
    # :returns: ``_mw_copy_p`` will be set to a deep copy of ``self``.
    # :rtype: MapWrapper   
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_member(COPY MapWrapper desc)
    function("${COPY}" self _mw_copy_p)
        cpp_assert_signature("${ARGV}" MapWrapper desc)

        MapWrapper(GET "${self}" my_map mw_map)
        cpp_map(COPY "${my_map}" _map_temp)
        MapWrapper(CTOR _mw_temp "${_map_temp}")
        set("${_mw_copy_p}" "${_mw_temp}" PARENT_SCOPE)
    endfunction()

    #[[[ Determines if two map instances are equivalent.
    #
    # Two MapWrapper instances are considered equal if they contain the same keys and each
    # key is associated with the same value. The order of the keys does not need to
    # be the same.
    #
    # :param self: Instance of the MapWrapper being called to compare.
    # :type self: MapWrapper
    # :param _return_id: Name for the variable which will hold the result.
    # :type _return_id: desc
    # :param _mw_p: The MapWrapper we are comparing to.
    # :type _mw_p: MapWrapper
    # :returns: ``_return_id`` will be set to ``TRUE`` if the two map instances
    #           compare equal and ``FALSE`` otherwise.
    # :rtype: bool  
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_member(EQUAL MapWrapper desc MapWrapper)
    function("${EQUAL}" self  _return_id _mw_p)
        cpp_assert_signature("${ARGV}" MapWrapper desc MapWrapper)

        MapWrapper(GET "${self}" my_map mw_map)
        MapWrapper(GET "${_mw_p}" their_map mw_map)
        cpp_map(EQUAL "${my_map}" _temp "${their_map}")
        set("${_return_id}" "${_temp}" PARENT_SCOPE)
    endfunction()

    #[[[ Determines if a MapWrapper has the specified key.
    #
    # This function is used to determine if a particular key has been set for this
    # MapWrapper.
    #
    # :param self: Instance of the MapWrapper being called to compare.
    # :type self: MapWrapper
    # :param _return_id: Name to use for the variable which will hold the result.
    # :type _return_id: desc
    # :param _key_p: The key we want to know if the map has.
    # :type _key_p: str
    # :returns: ``_return_id`` will be set to ``TRUE`` if ``_key_p`` has been
    #           set for this map and ``FALSE`` otherwise.
    # :rtype: bool  
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_member(HAS_KEY MapWrapper desc str)
    function("${HAS_KEY}" self  _return_id _key_p)
        cpp_assert_signature("${ARGV}" MapWrapper desc str)

        MapWrapper(GET "${self}" my_map mw_map)
        cpp_map(HAS_KEY "${my_map}" _temp "${_key_p}")
        set("${_return_id}" "${_temp}" PARENT_SCOPE)
    endfunction()

    #[[[ Gets a list of all keys known to a map.
    #
    # This function can be used to get a list of keys which have been set for this
    # MapWrapper.
    #
    # :param self: Instance of the MapWrapper being called to compare.
    # :type self: MapWrapper
    # :param _return_id: Name to use for the variable which will hold the result.
    # :type _return_id: desc
    # :returns: ``_return_id`` will be set to the list of keys which have been set for
    #           ``self``.
    # :rtype: [desc]  
    #
    # Error Checking
    # ==============
    #
    # If CMakePP is run in debug mode this function will assert that it was called
    # with exactly two arguments, and that those arguments have the correct types.
    # If these assertions fail an error will be raised. These checks are only
    # performed if CMakePP is run in debug mode.
    #
    # :var CMAKEPP_CORE_DEBUG_MODE: Used to determine if CMakePP is being run in
    #                               debug mode or not.
    # :vartype CMAKEPP_CORE_DEBUG_MODE: bool
    #]]
    cpp_member(KEYS MapWrapper desc)
    function("${KEYS}" self _return_id)
        cpp_assert_signature("${ARGV}" MapWrapper desc)

        MapWrapper(GET "${self}" my_map mw_map)
        cpp_map(KEYS "${my_map}" keys)
        set("${_return_id}" "${keys}" PARENT_SCOPE)
    endfunction()

cpp_end_class()
