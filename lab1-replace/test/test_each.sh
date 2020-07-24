#!/bin/bash

if [ -f "../bin/replace.gcda" ]; then
	rm -rf ../bin/replace.gcda
fi

if [ -f "../bin/replace.c.cov" ]; then
	rm -rf replace.c.cov
fi

for i in {1..5542}
do
	c="t${i}.sh"
	echo $c
	bash $c > /dev/null

	gcov -i ../bin/replace.c
	cat replace.c.gcov | grep lcount | grep -v \,0$ | cut -f2 -d":" | cut -f1 -d"," > coverage/t${i}.cov

	rm -rf ../bin/replace.gcda
	rm -rf replace.c.gcov
done
