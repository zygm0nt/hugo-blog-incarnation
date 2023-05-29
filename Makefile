HUGO ?= hugo

.PHONY:  drafts

run:
	$(HUGO) server
drafts:
	$(HUGO) list drafts

prepare:
	git submodule update  --init

update-themes:
	git submodule foreach git pull origin master

