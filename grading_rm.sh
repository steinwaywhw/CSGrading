#!/bin/bash

if ( [ -z $2 ] || [ $1 = '--help' ] || [ $1 = '-h' ] || [ $1 = '-?' ] ) then
	echo " "
	echo "Remove grade files from students' directories."
	echo " "
	echo "Author: Hanwen (Steinway) Wu"
	echo "Credit: Dave Sullivan"
	echo " "
	echo "Usage: grading_rm hw repo [part]"
	echo "Sample: grading_rm hw01 ./cs112-hw01 a"
	echo "Sample: grading_rm hw05 ./cs111-hw05"
	exit 1
fi

RM_1='rm "./$subdir/$1-$subdir.txt"'
RM_2='rm "./$subdir/$1-$subdir-$3.txt"'

if ( [ -e $2 ] ) then
	cd $2
	for subdir in *
	do
		echo "Removing grade file from $subdir"
		if ( [ -z $3 ] )
		then
			eval $RM_1
		else
			eval $RM_2
		fi
	done
else
	echo "Repo $2 does not exist."
fi

exit 0
