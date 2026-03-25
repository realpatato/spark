# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/realp/projects/spark/build/_deps/sdl3-src"
  "/home/realp/projects/spark/build/_deps/sdl3-build"
  "/home/realp/projects/spark/build/_deps/sdl3-subbuild/sdl3-populate-prefix"
  "/home/realp/projects/spark/build/_deps/sdl3-subbuild/sdl3-populate-prefix/tmp"
  "/home/realp/projects/spark/build/_deps/sdl3-subbuild/sdl3-populate-prefix/src/sdl3-populate-stamp"
  "/home/realp/projects/spark/build/_deps/sdl3-subbuild/sdl3-populate-prefix/src"
  "/home/realp/projects/spark/build/_deps/sdl3-subbuild/sdl3-populate-prefix/src/sdl3-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/realp/projects/spark/build/_deps/sdl3-subbuild/sdl3-populate-prefix/src/sdl3-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/realp/projects/spark/build/_deps/sdl3-subbuild/sdl3-populate-prefix/src/sdl3-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
