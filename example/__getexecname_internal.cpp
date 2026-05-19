// Code for current executable's exec name:
#include <stdio.h>
#include <__getexecname/internal.h>
int main() {
  const char *internal = __getexecname();
  printf("Possible Output: %s\n", internal);
  // error when __getexecname() failed.
  return internal ? 0 : 1;
}
