// Code for current executable's prog name:
#include <stdio.h>
#include <__getprogname/internal.h>
int main() {
  const char *internal = __getprogname();
  printf("Possible Output: %s\n", internal);
  // error when __getprogname() failed.
  return internal ? 0 : 1;
}
