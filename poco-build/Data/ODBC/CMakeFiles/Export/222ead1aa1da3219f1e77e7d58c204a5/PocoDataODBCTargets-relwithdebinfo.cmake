#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Poco::DataODBC" for configuration "RelWithDebInfo"
set_property(TARGET Poco::DataODBC APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(Poco::DataODBC PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libPocoDataODBC.111.dylib"
  IMPORTED_SONAME_RELWITHDEBINFO "@rpath/libPocoDataODBC.111.dylib"
  )

list(APPEND _cmake_import_check_targets Poco::DataODBC )
list(APPEND _cmake_import_check_files_for_Poco::DataODBC "${_IMPORT_PREFIX}/lib/libPocoDataODBC.111.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
