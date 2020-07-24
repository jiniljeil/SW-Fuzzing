rm -rf replace.gcda
./replace Hello "goodbye" < hello.txt
gcov replace.c
