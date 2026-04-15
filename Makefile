HUGO ?= hugo
DATE := $(shell date +%Y-%m-%d)

.PHONY: drafts build new-post new-til check-post check-drafts

run:
	$(HUGO) server -D
drafts:
	$(HUGO) list drafts

init: prepare run

prepare:
	git submodule update  --init

build:
	$(HUGO) --minify --buildDrafts=false

update-themes:
	git submodule foreach git pull origin master

new-post:
	@read -p "Slug (e.g. my-new-post): " slug; \
	file="content/post/$(DATE)-$$slug.markdown"; \
	printf -- "---\ntitle: \"\"\ndate: $(DATE)T00:00:00Z\ndraft: true\ncomments: true\ncategories:\n    - \ntags:\n    - \n---\n" > $$file; \
	echo "Created $$file"

check-post:
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make check-post FILE=content/post/your-post.markdown"; \
	else \
		vale $(FILE); \
	fi

check-drafts:
	@$(HUGO) list drafts | while read f; do \
		echo "=== $$f ==="; \
		vale "$$f"; \
	done

new-til:
	@read -p "Slug (e.g. my-til): " slug; \
	file="content/til/$(DATE)-$$slug.markdown"; \
	printf -- "---\ntitle: \"\"\ndate: $(DATE)\ntags:\n    - \n---\n" > $$file; \
	echo "Created $$file"

