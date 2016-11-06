FILES := $(shell find * -type f | egrep ^etc)

templates/_partials.tpl: Makefile $(FILES)
	echo Generating $(CURDIR)/$@
	rm -f $@
	for i in $(FILES); do	printf '{{ define \"'$$i'\" }}' >> $@; cat $$i >> $@; printf "{{ end }}\n\n" >> $@; done

.PHONY: clean
clean:
	rm -f templates/_partials.tpl

.PHONY: all
all: clean templates/_partials.tpl
