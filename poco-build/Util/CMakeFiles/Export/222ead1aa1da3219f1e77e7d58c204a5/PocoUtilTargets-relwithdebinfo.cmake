#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Poco::Util" for configuration "RelWithDebInfo"
set_property(TARGET Poco::Util APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(Poco::Util PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libPocoUtil.111.dylib"
  IMPORTED_SONAME_RELWITHDEBINFO "@rpath/libPocoUtil.111.dylib"
  )

list(APPEND _cmake_import_check_targets Poco::Util )
list(APPEND _cmake_import_check_files_for_Poco::Util "${_IMPORT_PREFIX}/lib/libPocoUtil.111.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
