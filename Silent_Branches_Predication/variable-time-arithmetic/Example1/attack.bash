#!/bin/bash
folder=full/path/to/llvm-project/build/bin
$folder/clang -fPIC -c dummy.c -o dummy.o
$folder/clang -shared -o libdummy.so dummy.o

$folder/clang main.c -O1 -S -emit-llvm
$folder/llc main.ll
# clang main.c -O1 -S -emit-llvm
# llc main.ll
$folder/clang -no-pie main.s -L. -ldummy -Wl,-rpath=.

# Set the secret character to be leaked to 'U' (ASCII 0x55)
secret_char=85  

for i in {1..50}
do
  echo "===== Run $i ====="
  ./a.out $secret_char
  sleep 0.1
done
