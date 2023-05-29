---
title: "an ode to fzf"
date: 2023-05-29T00:00:00Z
url: /2023/05/29/an-ode-to-fzf
draft: false
comments: true
categories: 
    - it
    - fzf
    - shell

---
What is `fzf`? How could I've lived without it for so long?! It's just a pretty little fuzzy search tool, written in go. You can find it here: https://github.com/junegunn/fzf

## Important features

- fuzzy search in a list of lines - thanks to that, it's really easy to find something in a considerably big list of items
- it's blazingly fast!
- very nice shell integrations
- many additional features - like preview for files (go here to see examples: https://github.com/junegunn/fzf#preview-window)

## Usages

- shell history
- my git-commit message script
- various CLI python tools, using this wrapper https://github.com/nk412/pyfzf


### Browsing through shell history

This is simply **the** most useful feature for me. Previously, I've extensively used `ctrl+r` to search through the past commands, but doing this with `fzf` is much more powerful!

### Adding `fzf` to all kinds of small scripts

Here are two small shell functions that do some small things, also utilizing `fzf` along the way. 


```sh
function activate-venv() {
  local selected_env
  selected_env=$(ls ~/VirtualEnvs/ | fzf)

  if [ -n "$selected_env" ]; then
    source "$HOME/VirtualEnvs/$selected_env/bin/activate"
  fi
}

function delete-branches() {
  local branches_to_delete
  branches_to_delete=$(git branch | fzf --multi)

  if [ -n "$branches_to_delete" ]; then
    git branch --delete --force $branches_to_delete
  fi
}
```
