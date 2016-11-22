
FILES := $(shell find * -type f | egrep ^etc)

MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))

PART ?= "patch"

templates/_partials.tpl: Makefile $(FILES)
	@echo Generating $(CURDIR)/$@
	@rm -f $@
	@for i in $(FILES); do	printf '{{ define \"'$$i'\" }}' >> $@; cat $$i >> $@; printf "{{ end }}\n\n" >> $@; done

.PHONY: clean
clean:
	@rm -f templates/_partials.tpl

.PHONY: build
build: clean templates/_partials.tpl

.PHONY: package
package:
	@echo "Packaging Chart $(CURRENT_DIR)"
	helm package $(CURRENT_DIR)

.PHONY: bump
bump:
	@echo "Bumping Version"
	bumpversion ${PART}
	git push
	git push origin --tags
