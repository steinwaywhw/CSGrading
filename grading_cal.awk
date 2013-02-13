# Author: Hanwen (Steinway) Wu
# Date: Feb 2013

BEGIN {
	COUNTER = 0
}

END {
	
}

/^[ ]*[-]+[0-9]+[\.]*[0-9]*[ ]+/ {
	$1 = "  " $1 "\tCHECK"
	print $0
	COUNTER = $1 + COUNTER
	next
}

/Total for/ {
	print $0 "\t" COUNTER
	next
}

/Late penalty/ {
	COUNTER = $5 + COUNTER
	print $0 "\tCHECK"
	next
}

/^%/ {
	next
}

{
	print $0
}