#!/bin/sh
cd "${0%/*}/../";
if [ `uname -o` = "Msys" ]; then
  g++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal.exe -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./internal.exe;
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external.exe -I. -std=c++17 -D__external__ -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./external.exe -1;
elif [ `uname` = "Darwin" ]; then
  clang++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -arch arm64 -arch x86_64; ./internal;
  clang++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -arch arm64 -arch x86_64; ./external -1;
elif [ `uname -o` = "GNU/Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal;
    g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -static-libgcc -static-libstdc++ -static; ./external -1;
  else
    clang++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall; ./internal;
    clang++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall; ./external -1;
  fi;
elif [ `uname -o` = "GNU/Hurd" ]; then
  g++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal;
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -static-libgcc -static-libstdc++ -static; ./external -1;
elif [ `uname -o` = "Cygwin" ]; then
  g++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal.exe -I. -std=gnu++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./internal.exe;
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external.exe -I. -std=gnu++17 -D__external__ -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./external.exe -1;
elif [ `uname` = "FreeBSD" ]; then
  clang++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -static; ./internal;
  clang++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -static; ./external -1;
elif [ `uname` = "DragonFly" ]; then
  g++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal;
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -static-libgcc -static-libstdc++ -static; ./external -1;
elif [ `uname` = "NetBSD" ]; then
  g++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal;
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -static-libgcc -static-libstdc++ -static; ./external -1;
elif [ `uname` = "OpenBSD" ]; then
  clang++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -lkvm -static; ./internal;
  clang++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -lkvm -static; ./external -1;
elif [ `uname` = "SunOS" ]; then
  g++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -static-libgcc; ./internal;
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -lproc -static-libgcc; ./external -1;
elif [ `uname` = "QNX" ]; then
  q++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal;
  q++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -static-libgcc -static-libstdc++ -static; ./external -1;
elif [ `uname` = "Haiku" ]; then
  g++ __getexecname/internal.cpp __getbasepath/internal.cpp __getprogname/internal.cpp example/example.cpp -o internal -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./internal;
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o external -I. -std=c++17 -D__external__ -Wall -static-libgcc -static-libstdc++ -static; ./external -1;
fi;
