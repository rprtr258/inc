#!/bin/sh

gcc -m32 -Wall ctest.c startup.c -o test
echo assembly
gcc -m32 --omit-frame-pointer -S ctest.c
cat -n ctest.s | expand -t 4 | sed 's/ *//'
echo output
./test

echo '(test-all)' | scheme tests-driver.scm compiler.scm
