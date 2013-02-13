#!/bin/bash

if ( [ -z $2 ] || [ $1 = '--help' ] || [ $1 = '-h' ] || [ $1 = '-?' ] ) then
	echo " "
	echo "Distribute grade files into students' directories."
	echo " "
	echo "Author: Hanwen (Steinway) Wu"
	echo " "
	echo "Usage: grading_dist repo dist..."
	echo "Sample: grading_dist ./cs112-hw01 ~/client1.java ~/client2.java"
	exit 1
fi

DIR=$PWD
CP='cp "$DIR/$file" "./$subdir"'

if ( [ -e $1 ]) then 
	cd $1
	for subdir in *
	do
		for file in "$@" 
		do
			if ( [ "$file" != "$1" ] ) then
				echo "Adding gradeing client $file for $subdir"
				eval $CP			
			fi
		done
	done
else
	echo "Repo $1 does not exist."
fi

exit 0
