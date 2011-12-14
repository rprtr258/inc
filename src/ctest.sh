#!/bin/sh

gcc -Wall ctest.c startup.c -o test
echo assembly
gcc --omit-frame-pointer -S ctest.c
cat -n ctest.s | expand -t 4 | sed 's/ *//'
echo output
./test

echo '(test-all)' | scheme tests-driver.scm compiler.scm
