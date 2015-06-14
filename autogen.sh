#!/bin/sh

# generate testsuite autoconf
CONFIG="t/include.ac"
echo '# this part is autogenerated by autogen.sh'> $CONFIG
echo > $CONFIG
find t/ -name '*.in' | while read line; do
	echo "AC_CONFIG_FILES(`echo $line | sed 's/\.in$//g'`)" >> $CONFIG
done
echo > $CONFIG
echo '# this part had been autogenerated by autogen.sh'> $CONFIG

autoreconf -i
