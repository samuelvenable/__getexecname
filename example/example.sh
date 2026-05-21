#!/bin/sh
cd "${0%/*}/../"
if [ $(uname) = "Darwin" ]; then
  clang++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -arch arm64 -arch x86_64;c
elif [ $(uname) = "Linux" ]; then
  if [ -f "/bin/g++" ]; then
    g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./a.out -1;
  else
    clang++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall; ./a.out -1;
  fi
elif [ $(uname) = "FreeBSD" ]; then
  clang++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -static; ./a.out -1;
elif [ $(uname) = "DragonFly" ]; then
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./a.out -1;
elif [ $(uname) = "NetBSD" ]; then
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./a.out -1;
elif [ $(uname) = "OpenBSD" ]; then
  clang++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -lkvm -static; ./a.out -1;
elif [ $(uname) = "SunOS" ]; then
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -lproc -static-libgcc; ./a.out -1;
elif [ $(uname) = "Haiku" ]; then
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./a.out -1;
elif [ $(uname) = "QNX" ]; then
  q++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static; ./a.out -1;
else
  g++ __getexecname/external.cpp __getbasepath/external.cpp __getprogname/external.cpp example/example.cpp -o a.out.exe -I. -std=c++17 -Wall -static-libgcc -static-libstdc++ -static -Wl,--subsystem,console; ./a.out.exe -1;
fi
