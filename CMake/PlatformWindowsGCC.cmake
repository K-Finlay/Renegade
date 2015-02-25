#============================================================================================================#
# Copyright (c) 2015, Black Rain Interactive
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# * Neither the name of Renegade nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#============================================================================================================#

# Check GCC version
if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.9")
    message (FATAL_ERROR "Renegade requires GCC 4.9 or higher.")
endif ()

# Set include directories
include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/Include"
                     "${CMAKE_CURRENT_SOURCE_DIR}/ExtDeps/glew/include")

# Set library directories
link_directories ("${CMAKE_CURRENT_SOURCE_DIR}/ExtDeps/glew/lib/Win32-GCC")

# Set binary output directory
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/Bin")

# Set compiler flags
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14 -Wall -Wextra")

if (CMAKE_BUILD_TYPE MATCHES Release)
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
endif ()

# Set linker flags
if (CMAKE_BUILD_TYPE MATCHES Release)
    set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -s")
endif ()

# Get Source Files
file (GLOB_RECURSE REN_SOURCES "Source/*.cpp"
                               "Include/*.hpp")

set (SOURCE_FILES "${REN_SOURCES}")

# Create executable
add_executable (Renegade_Engine ${SOURCE_FILES})

# Link libraries
target_link_libraries (Renegade_Engine "Dwmapi" "rpcrt4" "glew32.dll" "opengl32")

# Set debug postfix
set_target_properties (Renegade_Engine PROPERTIES DEBUG_POSTFIX "_d")
