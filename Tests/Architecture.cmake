if(DEFINED FUSION_CMAKE_TESTS_ARCHITECTURE)
    return()
else()
    set(FUSION_CMAKE_TESTS_ARCHITECTURE 1)
endif()

# The purpose of this is to rely on the generated CMake project
# to give us the actual value. Whne the Architecture file runs
# above, it does the work to determine what the architecture
# SHOULD be as determing by fusion-cli.
try_run(ARCH_RUN_RESULT ARCH_COMPILE_RESULT
    "${CMAKE_BINARY_DIR}"
    "${PROJECT_SOURCE_DIR}/cmake/Tests/Architecture.c"
    COMPILE_OUTPUT_VARIABLE ARCH_RESULT
    RUN_OUTPUT_VARIABLE FUSION_BUILD_ARCH)


set(FUSION_ARCH_64BIT FALSE)
set(FUSION_ARCH_32BIT FALSE)

if(DEFINED FUSION_BUILD_ARCH)
    if(FUSION_BUILD_ARCH STREQUAL "x86_64")
        set(FUSION_ARCH_64BIT TRUE)
    elseif(FUSION_BUILD_ARCH STREQUAL "i386")
        set(FUSION_ARCH_32BIT TRUE)
    endif()
endif()

if(FUSION_ARCH_64BIT)
    message("Building 64-Bit binaries and libraries.")
    add_compiler_flags(CXX -m64)
    add_compiler_flags(C -m64)
elseif(FUSION_ARCH_32BIT)
    message("Building 32-Bit binaries and libraries.")
    add_compiler_flags(CXX -m32)
    add_compiler_flags(C -m32)
endif()
