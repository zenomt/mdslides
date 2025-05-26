#! /usr/bin/env awk -f

/^:::+$/ || /^\.bp$/ {
	print lastSection ? "</section>" : "<article>"
	print "<section>"
	lastSection = NR
}

(NR != lastSection)

END {
	if(lastSection)
		print "\n\n</section>\n</article>"
}
