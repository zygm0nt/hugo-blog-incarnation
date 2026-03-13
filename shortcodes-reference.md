---
title: "Custom Shortcodes Reference"
date: 2026-03-13
draft: true
tags: ["meta", "documentation"]
---

This post documents all custom Hugo shortcodes available in this blog.

---

## `book_review`

Renders a two-column book review card with a cover image on the left and review text on the right.

**Parameters**

| Parameter    | Required | Description                          |
|--------------|----------|--------------------------------------|
| `title`      | yes      | Book title                           |
| `author`     | yes      | Author name                          |
| `book_cover` | yes      | Path to cover image (relative to `static/`) |

**Inner content** is rendered as Markdown (the review body).

**Example**

```
{{</* book_review title="Dune" author="Frank Herbert" book_cover="/post_images/dune-cover.jpg" */>}}
A towering sci-fi epic about politics, religion, and ecology on a desert planet.
Still unmatched in scope and world-building after 60 years.
{{</* /book_review */>}}
```

---

## `img`

A wrapper around an HTML `<figure>` element with optional caption, attribution link, and CSS class.

**Parameters**

| Parameter   | Required | Description                                      |
|-------------|----------|--------------------------------------------------|
| `src`       | yes      | Image path                                       |
| `alt`       | no       | Alt text (falls back to `caption` if omitted)    |
| `title`     | no       | Title shown above the caption                    |
| `caption`   | no       | Caption text below the image                     |
| `attr`      | no       | Attribution text                                 |
| `attrlink`  | no       | URL to wrap around attribution text              |
| `link`      | no       | Wraps the image in an `<a>` tag                  |
| `class`     | no       | CSS class on the `<figure>` element              |

**Example**

```
{{</* img src="/post_images/my-photo.png" title="Sunset over the lake"
         caption="Taken in August 2025" class="blog-post-image" */>}}
```

---

## `sidenote`

Places a marginal note beside the text. On wide screens the note floats to the left or right margin; on narrow screens it collapses to a toggle.

**Positional parameters** (all required)

| Position | Description                                              |
|----------|----------------------------------------------------------|
| `0`      | Side — `left` or `right`                                 |
| `1`      | Unique ID string used to link the label and the checkbox |
| `2`      | Short inline label shown next to the anchor              |

**Inner content** is the full text of the sidenote.

**Example**

```
The algorithm runs in O(n log n) time{{</* sidenote right "sn-complexity" "why not O(n)?" */>}}
Achieving linear time would require a perfect hash, which is impractical for
arbitrary input.
{{</* /sidenote */>}}, which is acceptable for our use case.
```

Left-side variant:

```
{{</* sidenote left "sn-aside" "a left note" */>}}
This appears to the left on wide viewports.
{{</* /sidenote */>}}
```

---

## `tooltip`

Wraps inline text in a click-to-reveal tooltip. The trigger text is the inner content; the tooltip body is the first positional parameter. Supports Markdown in the tooltip text.

**Parameters**

| Position | Description                                  |
|----------|----------------------------------------------|
| `0`      | Tooltip body text (Markdown is supported)    |

**Inner content** is the visible trigger text.

**Example**

```
I used {{</* tooltip "A branch of mathematics dealing with continuous change." */>}}calculus{{</* /tooltip */>}} to solve this.
```

Multiple tooltips on the same page work without extra configuration — each gets a unique ID via `.Ordinal`.
