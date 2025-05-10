#! /usr/bin/env awk -f

/^:::+$/ || /^\.bp$/ {
	if(!article)
	{
		article = 1;
		print "<article>"
	}
	else
		print "</section>"
	print "<section>"
	lastSection = NR;
}

(NR != lastSection)

END {
	if(article)
		print "\n\n</section>\n</article>"
}
