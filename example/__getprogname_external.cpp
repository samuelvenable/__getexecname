// Code for executable prog name from PID:
#include <stdio.h>
#include <__getprogname/external.h>
#if (defined(_WIN32) || defined(_WIN64))
#define OS_WINDOWS true
#elif defined(__HAIKU__)
// Haiku is supported for getting prog name from PID, but init system PID is random:
#error "The current platform has an unpredictable or randomized init system PID!"
#else
#define OS_WINDOWS false
#endif
int main() {
  // May require running as admin/root.
  // Win32 init system process ID is 4.
  // Other init system process ID is 1.
  const char *external = __getprogname(OS_WINDOWS ? 4 : 1);
  printf("Possible Output: %s\n", external);
  // error when __getprogname() failed.
  return external ? 0 : 1;
}
