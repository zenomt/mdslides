default: all
all: mdslides.html pipeline.svg

%.html : %.md
	awk -f mdsection.awk $< | pikchr | md2html > $@

pipeline.svg: mdslides.md
	pikchr -qb -N @pipeline -a 'style="font-size:initial;font-family:sans-serif;background-color:white"' < $< > $@
