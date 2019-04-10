#include <stdio.h>

#if defined(__arm__) || defined(__TARGET_ARCH_ARM)
#elif defined(__i386) || defined(__i386__) || defined(_M_IX86)
#define CMAKE_ARCHITECTURE "i386"
#elif defined(__x86_64) || defined(__x86_64__) || defined(__amd64) \
  || defined(_M_X64)
#define CMAKE_ARCHITECTURE "x86_64"
#elif defined(__ia64) || defined(__ia64__) || defined(_M_IA64)
#define CMAKE_ARCHITECTURE "ia64"
#else
#error "Unsupported compiler"
#endif

int main(int argc, char** argv)
{
  printf("%s", CMAKE_ARCHITECTURE);
  return 0;
}
