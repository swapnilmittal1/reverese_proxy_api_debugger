# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/swapnilmittal/reverse_proxy_api_debugger/poco

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build

# Include any dependencies generated for this target.
include Data/ODBC/CMakeFiles/DataODBC.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.make

# Include the progress variables for this target.
include Data/ODBC/CMakeFiles/DataODBC.dir/progress.make

# Include the compile flags for this target's objects.
include Data/ODBC/CMakeFiles/DataODBC.dir/flags.make

Data/ODBC/CMakeFiles/DataODBC.dir/codegen:
.PHONY : Data/ODBC/CMakeFiles/DataODBC.dir/codegen

Data/ODBC/CMakeFiles/DataODBC.dir/src/Binder.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Binder.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Binder.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Binder.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Binder.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Binder.cpp.o -MF CMakeFiles/DataODBC.dir/src/Binder.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Binder.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Binder.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Binder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Binder.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Binder.cpp > CMakeFiles/DataODBC.dir/src/Binder.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Binder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Binder.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Binder.cpp -o CMakeFiles/DataODBC.dir/src/Binder.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ConnectionHandle.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o -MF CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o.d -o CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ConnectionHandle.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ConnectionHandle.cpp > CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ConnectionHandle.cpp -o CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/Connector.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Connector.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Connector.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Connector.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Connector.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Connector.cpp.o -MF CMakeFiles/DataODBC.dir/src/Connector.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Connector.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Connector.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Connector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Connector.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Connector.cpp > CMakeFiles/DataODBC.dir/src/Connector.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Connector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Connector.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Connector.cpp -o CMakeFiles/DataODBC.dir/src/Connector.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Diagnostics.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o -MF CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Diagnostics.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Diagnostics.cpp > CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Diagnostics.cpp -o CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/EnvironmentHandle.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o -MF CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o.d -o CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/EnvironmentHandle.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/EnvironmentHandle.cpp > CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/EnvironmentHandle.cpp -o CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/Error.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Error.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Error.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Error.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Error.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Error.cpp.o -MF CMakeFiles/DataODBC.dir/src/Error.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Error.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Error.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Error.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Error.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Error.cpp > CMakeFiles/DataODBC.dir/src/Error.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Error.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Error.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Error.cpp -o CMakeFiles/DataODBC.dir/src/Error.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/Extractor.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Extractor.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Extractor.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Extractor.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Extractor.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Extractor.cpp.o -MF CMakeFiles/DataODBC.dir/src/Extractor.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Extractor.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Extractor.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Extractor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Extractor.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Extractor.cpp > CMakeFiles/DataODBC.dir/src/Extractor.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Extractor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Extractor.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Extractor.cpp -o CMakeFiles/DataODBC.dir/src/Extractor.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCException.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o -MF CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o.d -o CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCException.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCException.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/ODBCException.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCException.cpp > CMakeFiles/DataODBC.dir/src/ODBCException.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCException.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/ODBCException.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCException.cpp -o CMakeFiles/DataODBC.dir/src/ODBCException.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCMetaColumn.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o -MF CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o.d -o CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCMetaColumn.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCMetaColumn.cpp > CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCMetaColumn.cpp -o CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCStatementImpl.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o -MF CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o.d -o CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCStatementImpl.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCStatementImpl.cpp > CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/ODBCStatementImpl.cpp -o CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/Parameter.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Parameter.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Parameter.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Parameter.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Parameter.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Parameter.cpp.o -MF CMakeFiles/DataODBC.dir/src/Parameter.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Parameter.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Parameter.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Parameter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Parameter.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Parameter.cpp > CMakeFiles/DataODBC.dir/src/Parameter.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Parameter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Parameter.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Parameter.cpp -o CMakeFiles/DataODBC.dir/src/Parameter.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/Preparator.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Preparator.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Preparator.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Preparator.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Preparator.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Preparator.cpp.o -MF CMakeFiles/DataODBC.dir/src/Preparator.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Preparator.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Preparator.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Preparator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Preparator.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Preparator.cpp > CMakeFiles/DataODBC.dir/src/Preparator.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Preparator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Preparator.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Preparator.cpp -o CMakeFiles/DataODBC.dir/src/Preparator.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/SessionImpl.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o -MF CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o.d -o CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/SessionImpl.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/SessionImpl.cpp > CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/SessionImpl.cpp -o CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/TypeInfo.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o -MF CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o.d -o CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/TypeInfo.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/TypeInfo.cpp > CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/TypeInfo.cpp -o CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/Unicode.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Unicode.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Unicode.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Unicode.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Unicode.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Unicode.cpp.o -MF CMakeFiles/DataODBC.dir/src/Unicode.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Unicode.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Unicode.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Unicode.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Unicode.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Unicode.cpp > CMakeFiles/DataODBC.dir/src/Unicode.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Unicode.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Unicode.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Unicode.cpp -o CMakeFiles/DataODBC.dir/src/Unicode.cpp.s

Data/ODBC/CMakeFiles/DataODBC.dir/src/Utility.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/flags.make
Data/ODBC/CMakeFiles/DataODBC.dir/src/Utility.cpp.o: /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Utility.cpp
Data/ODBC/CMakeFiles/DataODBC.dir/src/Utility.cpp.o: Data/ODBC/CMakeFiles/DataODBC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object Data/ODBC/CMakeFiles/DataODBC.dir/src/Utility.cpp.o"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Data/ODBC/CMakeFiles/DataODBC.dir/src/Utility.cpp.o -MF CMakeFiles/DataODBC.dir/src/Utility.cpp.o.d -o CMakeFiles/DataODBC.dir/src/Utility.cpp.o -c /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Utility.cpp

Data/ODBC/CMakeFiles/DataODBC.dir/src/Utility.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/DataODBC.dir/src/Utility.cpp.i"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Utility.cpp > CMakeFiles/DataODBC.dir/src/Utility.cpp.i

Data/ODBC/CMakeFiles/DataODBC.dir/src/Utility.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/DataODBC.dir/src/Utility.cpp.s"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC/src/Utility.cpp -o CMakeFiles/DataODBC.dir/src/Utility.cpp.s

# Object files for target DataODBC
DataODBC_OBJECTS = \
"CMakeFiles/DataODBC.dir/src/Binder.cpp.o" \
"CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o" \
"CMakeFiles/DataODBC.dir/src/Connector.cpp.o" \
"CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o" \
"CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o" \
"CMakeFiles/DataODBC.dir/src/Error.cpp.o" \
"CMakeFiles/DataODBC.dir/src/Extractor.cpp.o" \
"CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o" \
"CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o" \
"CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o" \
"CMakeFiles/DataODBC.dir/src/Parameter.cpp.o" \
"CMakeFiles/DataODBC.dir/src/Preparator.cpp.o" \
"CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o" \
"CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o" \
"CMakeFiles/DataODBC.dir/src/Unicode.cpp.o" \
"CMakeFiles/DataODBC.dir/src/Utility.cpp.o"

# External object files for target DataODBC
DataODBC_EXTERNAL_OBJECTS =

lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Binder.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/ConnectionHandle.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Connector.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Diagnostics.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/EnvironmentHandle.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Error.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Extractor.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCException.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCMetaColumn.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/ODBCStatementImpl.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Parameter.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Preparator.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/SessionImpl.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/TypeInfo.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Unicode.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/src/Utility.cpp.o
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/build.make
lib/libPocoDataODBC.111.dylib: lib/libPocoData.111.dylib
lib/libPocoDataODBC.111.dylib: /Users/swapnilmittal/anaconda3/lib/libodbc.dylib
lib/libPocoDataODBC.111.dylib: lib/libPocoFoundation.111.dylib
lib/libPocoDataODBC.111.dylib: Data/ODBC/CMakeFiles/DataODBC.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Linking CXX shared library ../../lib/libPocoDataODBC.dylib"
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DataODBC.dir/link.txt --verbose=$(VERBOSE)
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && $(CMAKE_COMMAND) -E cmake_symlink_library ../../lib/libPocoDataODBC.111.dylib ../../lib/libPocoDataODBC.111.dylib ../../lib/libPocoDataODBC.dylib

lib/libPocoDataODBC.dylib: lib/libPocoDataODBC.111.dylib
	@$(CMAKE_COMMAND) -E touch_nocreate lib/libPocoDataODBC.dylib

# Rule to build all files generated by this target.
Data/ODBC/CMakeFiles/DataODBC.dir/build: lib/libPocoDataODBC.dylib
.PHONY : Data/ODBC/CMakeFiles/DataODBC.dir/build

Data/ODBC/CMakeFiles/DataODBC.dir/clean:
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC && $(CMAKE_COMMAND) -P CMakeFiles/DataODBC.dir/cmake_clean.cmake
.PHONY : Data/ODBC/CMakeFiles/DataODBC.dir/clean

Data/ODBC/CMakeFiles/DataODBC.dir/depend:
	cd /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/swapnilmittal/reverse_proxy_api_debugger/poco /Users/swapnilmittal/reverse_proxy_api_debugger/poco/Data/ODBC /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC /Users/swapnilmittal/reverse_proxy_api_debugger/poco-build/Data/ODBC/CMakeFiles/DataODBC.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : Data/ODBC/CMakeFiles/DataODBC.dir/depend

