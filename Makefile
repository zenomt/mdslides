default: all
all: mdslides.html

%.html : %.md
	awk -f mdsection.awk $< | pikchr | md2html > $@
