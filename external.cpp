/*

 MIT License
 
 Copyright © 2026 Samuel Venable
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

#include "__getexecname/external.h"
#include "__getbasepath/external.h"
#include "__getprogname/external.h"
#include <cstdlib>
#include <cstdio>

int main(int argc, char **argv) {
  long long pid = -1;
  if (argc > 1) {
    pid = strtoll(argv[1], nullptr, 10);
  }
  const char *external_execname = __getexecname(pid);
  const char *external_basepath = __getbasepath(pid);
  const char *external_progname = __getprogname(pid);
  if (external_execname) {
    printf("const char *__getexecname(long long pid = %lld) = \"%s\"\n", pid, external_execname);
  } else {
    printf("const char *__getexecname(long long pid = %lld) = %s\n", pid, external_execname);
  }
  if (external_basepath) {
    printf("const char *__getbasepath(long long pid = %lld) = \"%s\"\n", pid, external_basepath);
  } else {
    printf("const char *__getbasepath(long long pid = %lld) = %s\n", pid, external_basepath);
  }
  if (external_progname) {
    printf("const char *__getprogname(long long pid = %lld) = \"%s\"\n", pid, external_progname);
  } else {
    printf("const char *__getprogname(long long pid = %lld) = %s\n", pid, external_progname);
  }
  return 0;
}
