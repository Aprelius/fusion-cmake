if(DEFINED FUSION_CMAKE_COMMON_)
    return()
else()
    set(FUSION_CMAKE_COMMON_ 1)
endif()

include(Common/Macros)
include(Tests/Architecture)

# Create the build directory if it does not exist already
# the expectation is the project or solution folder is created
# outside of teh configure operation running here.

set(FUSION_BUILD_DIR "${FUSION_ROOT_DIR}/build")
if(NOT EXISTS FUSION_BUILD_DIR)
    file(MAKE_DIRECTORY ${FUSION_BUILD_DIR})
endif()
