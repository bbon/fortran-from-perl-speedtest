#! /bin/sh
gfortran -shared testlib.f -o testlib.so
echo "test 1:"
echo "======="
perl t1.pl
echo
echo "test 2:"
echo "======="
perl t2.pl
echo
echo "test 3:"
echo "======="
perl t3.pl
echo
echo "test 4:"
echo "======="
perl t4.pl

