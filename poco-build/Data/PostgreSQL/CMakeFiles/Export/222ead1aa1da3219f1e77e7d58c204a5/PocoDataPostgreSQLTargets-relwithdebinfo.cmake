#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Poco::DataPostgreSQL" for configuration "RelWithDebInfo"
set_property(TARGET Poco::DataPostgreSQL APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(Poco::DataPostgreSQL PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libPocoDataPostgreSQL.111.dylib"
  IMPORTED_SONAME_RELWITHDEBINFO "@rpath/libPocoDataPostgreSQL.111.dylib"
  )

list(APPEND _cmake_import_check_targets Poco::DataPostgreSQL )
list(APPEND _cmake_import_check_files_for_Poco::DataPostgreSQL "${_IMPORT_PREFIX}/lib/libPocoDataPostgreSQL.111.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
