
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
PART ?= "patch"

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
