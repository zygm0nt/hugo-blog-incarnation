---
title: "Hugo sections can have custom list layouts"
date: 2026-03-13
tags: ["hugo", "blogging"]
---

You can override a section's list template by placing a `list.html` under `layouts/<section-name>/`. Hugo will pick it up automatically, no frontmatter needed.

This makes it easy to create compact, title-only indexes for sections like TIL — different from the default card-style post listing.
