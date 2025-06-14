#! /usr/bin/env awk -f

/^:::+$/ {
	print lastSection ? "</section>" : "<article>"
	printf "<section id='page-%d'>\n", ++page
	lastSection = NR
}

(NR != lastSection)

END {
	if(lastSection)
		print "\n\n</section>\n</article>"
}
