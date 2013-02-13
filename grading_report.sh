#!/bin/bash

if ( [ -z $2 ] || [ $1 = '--help' ] || [ $1 = '-h' ] || [ $1 = '-?' ] ) then
	echo " "
	echo "Report grade of each student."
	echo " "
	echo "Author: Hanwen (Steinway) Wu"
	echo " "
	echo "Usage: grading_report hw repo [part]"
	echo "Sample: grading_cal hw01 ./cs112-hw01 a"
	echo "Sample: grading_cal hw05 ./cs111-hw05"
	exit 1
fi

DIR=$PWD 


if ( [ -e $2 ] ) then
	cd $2
	for subdir in *
	do
		printf "Grade for $subdir:  \t"
		if ( [ -z $3 ] ) then
			awk "/Total for/ {print \$4}" "./$subdir/$1-$subdir.txt"
		else
			awk "/Total for/ {print \$4}" "./$subdir/$1-$subdir-$3.txt"
		fi
	done
else
	echo "Repo $2 does not exist."
fi

exit 0
