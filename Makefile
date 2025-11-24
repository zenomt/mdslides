default: all
all: mdslides.html pipeline.svg

%.html : %.md.in mdsection.awk
	awk -f mdsection.awk $< | pikchr | md2html --github > $@

%.svg: mdslides.md.in
	pikchr -qb -N @$@ -a 'style="font-size:initial;font-family:sans-serif;background-color:white"' < $< > $@
