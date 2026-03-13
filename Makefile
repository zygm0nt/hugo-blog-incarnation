HUGO ?= hugo

.PHONY:  drafts

run:
	$(HUGO) server -D
drafts:
	$(HUGO) list drafts

init: prepare run

prepare:
	git submodule update  --init

update-themes:
	git submodule foreach git pull origin master

