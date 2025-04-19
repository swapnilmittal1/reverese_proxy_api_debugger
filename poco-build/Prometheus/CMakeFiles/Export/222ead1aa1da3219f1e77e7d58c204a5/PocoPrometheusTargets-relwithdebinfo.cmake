#----------------------------------------------------------------
# Generated CMake target import file for configuration "RelWithDebInfo".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Poco::Prometheus" for configuration "RelWithDebInfo"
set_property(TARGET Poco::Prometheus APPEND PROPERTY IMPORTED_CONFIGURATIONS RELWITHDEBINFO)
set_target_properties(Poco::Prometheus PROPERTIES
  IMPORTED_LOCATION_RELWITHDEBINFO "${_IMPORT_PREFIX}/lib/libPocoPrometheus.111.dylib"
  IMPORTED_SONAME_RELWITHDEBINFO "@rpath/libPocoPrometheus.111.dylib"
  )

list(APPEND _cmake_import_check_targets Poco::Prometheus )
list(APPEND _cmake_import_check_files_for_Poco::Prometheus "${_IMPORT_PREFIX}/lib/libPocoPrometheus.111.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
