#! /usr/bin/env awk -f

/^:::+$/ {
	print page ? "</section>" : "<article>"
	printf "<section id='page-%d'>\n", ++page
	next
}

{ print $0 }

END {
	if(page)
		print "\n\n</section>\n</article>"
}
