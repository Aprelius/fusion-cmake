if(DEFINED FUSION_CMAKE_PLATFORMS_WINDOWS)
    return()
else()
    set(FUSION_CMAKE_PLATFORMS_WINDOWS 1)
endif()

if(NOT WIN32)
    message(FATAL_ERROR "Win32 Platform file loaded on non-Win32 system")
endif()

if(CYGWIN)
    message(FATAL_ERROR "Unsupported WIn32 variant: cygwin")
endif()
if(MINGW)
    message(FATAL_ERROR "Unsupported WIn32 variant: mingw")
endif()

# This is used in generating the build folder for the project.
set(FUSION_SYSTEM_NAME "windows")
string(TOLOWER "${CMAKE_BUILD_TYPE}" FUSION_BUILD_VARIANT)

# determine the MSVC version. Again, used in generating the fully
# qualified build folder name.
if(MSVC_VERSION EQUAL 1800)
    # VS2013
    set(FUSION_COMPILER_NAME "vc120")
elseif(MSVC_VERSION EQUAL 1900)
    # VS2015
    set(FUSION_COMPILER_NAME "vc140")
elseif(MSVC_VERSION EQUAL 1910 OR MSVC_VERSION EQUAL 1912)
    # VS2017
    set(FUSION_COMPILER_NAME "vc150")
elseif(MSVC_VERSION EQUAL 1920)
    # VS2019
    set(FUSION_COMPILER_NAME "vc160")
else()
    message(WARNING "Unexpected MSVC version: ${MSVC_VERSION}")
    set(FUSION_COMPILER_NAME "vcXXX")
endif()

# Setup the linker flags for multi-threaded static or multi-threaded
# debug. This gets set at the project level for the entire project to
# use the same options.

if(BUILD_SHARED_LIBS)
    add_compiler_flags(DEBUG /MDd)
    add_compiler_flags(RELEASE /MD)
else()
    add_compiler_flags(DEBUG /MTd)
    add_compiler_flags(RELEASE /MT)
endif()

if ("${CMAKE_BUILD_TYPE}" STREQUAL "debug")
    # Debug Compiler Flags
    # /Z7 - produce .obj files for debugging
    # /FC - use full pathnames in debugging
    add_compiler_flags(CXX /Z7 /FC)
    # /DEBUG - Generate .pdb files for debugging
    # /LARGEADDRESSAWARE - mark executable for using >2GB addresses
    add_linker_flags(/DEBUG)
endif()

# Basic configuration for all variants. ALso we force building unicode
# compliant because that's just smart.
add_linker_flags(/LARGEADDRESSAWARE)
add_compiler_flags(CXX /GS)
add_compiler_flags(CXX /UNICODE)
