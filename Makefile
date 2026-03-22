HUGO ?= hugo
DATE := $(shell date +%Y-%m-%d)

.PHONY: drafts new-post new-til

run:
	$(HUGO) server -D
drafts:
	$(HUGO) list drafts

init: prepare run

prepare:
	git submodule update  --init

update-themes:
	git submodule foreach git pull origin master

new-post:
	@read -p "Slug (e.g. my-new-post): " slug; \
	file="content/post/$(DATE)-$$slug.markdown"; \
	printf -- "---\ntitle: \"\"\ndate: $(DATE)T00:00:00Z\ndraft: true\ncomments: true\ncategories:\n    - \ntags:\n    - \n---\n" > $$file; \
	echo "Created $$file"

new-til:
	@read -p "Slug (e.g. my-til): " slug; \
	file="content/til/$(DATE)-$$slug.markdown"; \
	printf -- "---\ntitle: \"\"\ndate: $(DATE)\ntags:\n    - \n---\n" > $$file; \
	echo "Created $$file"

