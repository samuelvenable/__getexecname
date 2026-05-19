// Code for executable exec name from PID:
#include <stdio.h>
#include <__getexecname/external.h>
#if (defined(_WIN32) || defined(_WIN64))
#define OS_WINDOWS true
#elif defined(__HAIKU__)
// Haiku is supported for getting exec name from PID, but init system PID is random:
#error "The current platform has an unpredictable or randomized init system PID!"
#else
#define OS_WINDOWS false
#endif
int main() {
  // May require running as admin/root.
  // Win32 init system process ID is 4.
  // Other init system process ID is 1.
  const char *external = __getexecname(OS_WINDOWS ? 4 : 1);
  printf("Possible Output: %s\n", external);
  // error when __getexecname() failed.
  return external ? 0 : 1;
}
