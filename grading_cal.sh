#!/bin/bash

if ( [ -z $3 ] || [ $1 = '--help' ] || [ $1 = '-h' ] || [ $1 = '-?' ] ) then
	echo " "
	echo "Calculate grade files in students' directories."
	echo " "
	echo "Author: Hanwen (Steinway) Wu"
	echo " "
	echo "Usage: grading_cal hw awk repo [part]"
	echo "Sample: grading_cal hw01 ./grading_cal.awk ./cs112-hw01 a"
	echo "Sample: grading_cal hw05 ./grading_cal.awk ./cs111-hw05"
	exit 1
fi

DIR=$PWD 

AWK_1='awk -f "$DIR/$2" "./$subdir/$1-$subdir.txt" > "./$subdir/$1-$subdir.txt.2"'
RM_1='rm "./$subdir/$1-$subdir.txt"'
MV_1='mv "./$subdir/$1-$subdir.txt.2" "./$subdir/$1-$subdir.txt"'

AWK_2='awk -f "$DIR/$2" "./$subdir/$1-$subdir-$4.txt" > "./$subdir/$1-$subdir-$4.txt.2"'
RM_2='rm "./$subdir/$1-$subdir-$4.txt"'
MV_2='mv "./$subdir/$1-$subdir-$4.txt.2" "./$subdir/$1-$subdir-$4.txt"'

if ( [ -e $3 ] && [ -e $2 ] ) then
	cd $3
	for subdir in *
	do
		echo "Calculating grade file for $subdir"
		if ( [ -z $4 ] ) then
			eval $AWK_1
			eval $RM_1
			eval $MV_1
		else
			eval $AWK_2
			eval $RM_2
			eval $MV_2
		fi
	done
else
	if ( [ -e $2 ] ) then
		echo "Repo $3 does not exist."
	else 
		echo "Awk script $2 does not exist."
	fi
fi

exit 0
