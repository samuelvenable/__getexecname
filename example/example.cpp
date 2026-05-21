#include <cstdio>
#include <cctype>
#include <cstring>
#include <cstdlib>
#include <__getexecname/external.h>
#include <__getbasepath/external.h>
#include <__getprogname/external.h>
int main(int argc, char **argv) {
  if (argc <= 1) {
    const char *execname = __getexecname();
    const char *basepath = __getbasepath();
    const char *progname = __getprogname();
    printf("__getexecname(): %s\n__getbasepath(): %s\n__getprogname(): %s\n", execname, basepath, progname);
    return ((!execname || !basepath || !progname) ? 0 : 1);
  }
  long long pid = strtoll(argv[1], nullptr, 10);
  const char *execname = __getexecname(pid);
  const char *basepath = __getbasepath(pid);
  const char *progname = __getprogname(pid);
  printf("__getexecname(%lld): %s\n__getbasepath(%lld): %s\n__getprogname(%lld): %s\n", pid, execname, pid, basepath, pid, progname);
  return ((!execname || !basepath || !progname) ? 0 : 2);
}
