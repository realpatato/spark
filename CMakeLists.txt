cmake_minimum_required(VERSION 3.16)
project(spark)

set(CMAKE_CXX_STANDARD 17)
set(SMAKE_CXX_STANDARD_REQUIRED ON)

find_package(SDL3)

if(NOT SDL3_FOUND)
    include(FetchContent)

    FetchContent_Declare(
        SDL3
        GIT_REPOSITORY
        https://github.com/libsdl-org/SDL.git
        GIT_TAG release-3.4.2
    )

    FetchContent_MakeAvailable(SDL3)
endif()

add_executable(app ../code/main.cpp)
target_link_libraries(app SDL3::SDL3)