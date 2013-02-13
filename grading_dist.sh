#!/bin/bash

if ( [ -z $3 ] || [ $1 = '--help' ] || [ $1 = '-h' ] || [ $1 = '-?' ] ) then
	echo " "
	echo "Distribute grade files into students' directories."
	echo " "
	echo "Author: Dave Sullivan"
	echo "Updated: Hanwen (Steinway) Wu"
	echo " "
	echo "Usage: grading_dist hw dist repo [part]"
	echo "Sample: grading_dist hw01 ~/gradefile.txt ./cs112-hw01 a"
	echo "Sample: grading_dist hw05 ~/gradefile.txt ./cs111-hw05"
	exit 1
fi

DIR=$PWD

CP_1='cp "$DIR/$2" "./$subdir/$1-$subdir.txt"'
CP_2='cp "$DIR/$2" "./$subdir/$1-$subdir-$4.txt"'

if ( [ -e $3 ] && [ -e $2 ]) then 
	cd $3
	for subdir in *
	do
		echo "Adding grade file $2 for $subdir"
		if ( [ -z $4 ] )
		then
			eval $CP_1
		else
			eval $CP_2
		fi
	done
else
	if ( [ -e $2 ]) then
		echo "Repo $3 or does not exist."
	else
		echo "Grading file $2 does not exist"
	fi
fi

exit 0
