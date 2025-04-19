cmake_minimum_required(VERSION 3.21)
project(proxy LANGUAGES CXX)

# ───── compiler / language settings ───────────────────────────────────────────
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# ───── dependencies ───────────────────────────────────────────────────────────
# Tell CMake where Poco lives (already done in your ~/.zshrc)
#   export CMAKE_PREFIX_PATH="$HOME/.local/poco:$CMAKE_PREFIX_PATH"

find_package(Poco 1.14 REQUIRED COMPONENTS
    Foundation
    Net
    Util
    JSON
    Data
    DataPostgreSQL
    NetSSL
)

# DataPostgreSQL’s config expects this:
find_package(PostgreSQL REQUIRED)   # gives us PostgreSQL::PostgreSQL

# ───── target ─────────────────────────────────────────────────────────────────
add_executable(proxy
    src/main.cpp            # add more *.cpp files here if you create them
)

target_link_libraries(proxy
    PRIVATE
        Poco::Foundation
        Poco::Net
        Poco::Util
        Poco::JSON
        Poco::Data
        Poco::DataPostgreSQL   # pulls in libpq at link time
        Poco::NetSSL
        PostgreSQL::PostgreSQL # satisfies the imported‑target dependency
)

# (optional) make the binary find shared libs next to itself
if(APPLE)
    set_target_properties(proxy PROPERTIES INSTALL_RPATH "@loader_path")
elseif(UNIX)
    set_target_properties(proxy PROPERTIES INSTALL_RPATH "$ORIGIN")
endif()
