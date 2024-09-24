
---
title: "Convenient search in my Obsidian notes"
date: 2024-09-24T00:00:00Z
url: /2024/09/24/convenient-search-in-my-obsidian-notes
draft: false
comments: true
categories:
    - it
    - til
    - fzf
    - obsidian

---

I came across this idea of better search in Obsidian notes: https://simplyexplained.com/blog/how-i-use-alfred-to-search-obsidian-notes/

This should work nicely, but:
- it would require installing an additional tool Alfred, 
- would bind even more to MacOS ecosystem - what if I want to use the same workflow on Linux,
- would not be too VCS friendly - hard to version those UI wizards

So I've figured I can do better, with just CLI tools. That resulted in the following short script:

```shell

RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
INITIAL_QUERY=$1
export FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'"

selected_file=`fzf --bind "change:reload:$RG_PREFIX {q} || true" \
      --ansi --disabled --query "$INITIAL_QUERY" | awk -F : '{ print $1 }'`

set -x
encoded_url=`python3 -c "import urllib.parse; import sys; print(urllib.parse.quote(sys.argv[1]))" "$selected_file"`
open "obsidian://open?vault=obsidian-notes&file=$encoded_url"

```

Steps done here:
- make `ripgrep` preserve colors when piping its output to `fzf`
- prepare `ripgrep` output in a specific way, for `fzf` to digest
- encode file name, so that MacOS `open` is comfortable with 

What would make this script more bullet-proof:
- check if tools are installed - `fzf` and `ripgrep`
- some parameter checking
- use some other version of `open` on non-Mac systems.

