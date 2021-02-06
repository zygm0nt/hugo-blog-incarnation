HUGO ?= hugo

run:
	$(HUGO) server
drafts:
	$(HUGO) list drafts
