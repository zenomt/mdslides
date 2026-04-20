#! /usr/bin/env awk -f

/^ {0,3}:::+([ \t]+.*)?$/ {
	sub(/^ *:*/, "")
	print page ? "</section>" : "<article>"
	printf "<section id='page-%d'%s>\n", ++page, $0
	next
}

{ print $0 }

END {
	if(page)
		print "\n\n</section>\n</article>"
}
