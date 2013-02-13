#!/bin/bash

if ( [ -z $3 ] || [ $1 = '--help' ] || [ $1 = '-h' ] || [ $1 = '-?' ] ) then
	echo " "
	echo "Archive homework files in students' directories."
	echo " "
	echo "Author: Hanwen (Steinway) Wu"
	echo " "
	echo "Usage: grading_tar hw groupby repo"
	echo "Sample: grading_tar hw01 27 ./cs112-hw01"
	exit 1
fi


COUNTER=0
FILES=""
GROUP=$2
OUTPUT=1

DIR=$PWD
TAR='tar -cf "$DIR/dist-$OUTPUT.tar" $FILES'

if ( [ -e $3 ] ) then

	# enter REPO
	cd $3

	for subdir in *
	do		
		# count, and collect file names
		FILES="$FILES $subdir"
		let COUNTER=COUNTER+1

		# if reaches GROUP, then tar, and re-count
		if ( [ $COUNTER -ge $GROUP ]) then
			echo "Archiving group $OUTPUT"
			eval $TAR

			let COUNTER=0
			FILES=""
			let OUTPUT=OUTPUT+1
		fi
	done
else
	echo "Repo $3 does not exist."
fi

# tar the remaining files
echo "Archiving group $OUTPUT"
eval $TAR
