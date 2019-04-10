if(DEFINED FUSION_CMAKE_PLATFORMS)
    return()
else()
    set(FUSION_CMAKE_PLATFORMS 1)
endif()

if(WIN32)
    include(Platforms/Windows)
elseif(UNIX)
    include(Platforms/Unix)
else()
    message(FATAL "Unsupported Platform")
endif()