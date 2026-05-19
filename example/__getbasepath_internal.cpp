// Code for current executable's base path:
#include <stdio.h>
#include <__getbasepath/internal.h>
int main() {
  const char *internal = __getbasepath();
  printf("Possible Output: %s\n", internal);
  // error when __getbasepath() failed.
  return internal ? 0 : 1;
}
