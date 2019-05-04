---
title: "My Vim Setup"
date: 2019-05-05T00:00:00Z
url: /2019/05/05/my-vim-setup/
comments: true
categories: 
- vim
- it
---
I use some plugins for my vim, they’re mainly some random, interesting additions. I’ve never really got to building whole language environment with vim plugins - like, say, complete Scala-lang ecosystem.

So treat those as a bunch of semi-interesting plugins, that you may also find interesting.

![Slightly modified vim pane](/post_images/vim_nerdtree.png)

<!-- more -->

Usefulness
-----

__Nerdtree__ (https://github.com/scrooloose/nerdtree) - *the* most basic plugin, enables convenient file browsing in a separate vim pane.

__Nerdcommenter__ (https://github.com/scrooloose/nerdcommenter) - a pretty ubiquitus tool for commenting stuff out

__Vim-sessions__ (https://github.com/xolox/vim-session) - I recently started to use sessions _a lot_. They’re super useful and they allow to save the whole context of my edits, reads, etc. And of course easily restore it :) There is also a good introductory post into the world of sessions: http://peterodding.com/code/vim/session/

__Tabline__ (https://github.com/mkitt/tabline.vim) - just a simple script to handle tabs in vim

__Ultisnips__ (https://github.com/SirVer/ultisnips) - a snippets plugin - borrowed from this splendid blogpost: https://castel.dev/post/lecture-notes-1/ This post is a treasure trove of interesting editing techniques and plugins to take from as you like. Also, there is part 2 available https://castel.dev/post/lecture-notes-2/ - equally wonderful.

__Syntastic__ (https://github.com/vim-syntastic/syntastic) - this one is nice! Universal (as in “support a lot of languages”) syntax checker. If it doesn’t support you choice of programming language out of the box - check for associated plugins.

Beautifiers
-------

__Landscape__ (https://github.com/itchyny/landscape.vim) - my colorscheme of choice

| With default colorscheme |
|:--|
| ![With default colorscheme](/post_images/vim_default_colorscheme.png) |

| With landscape |
|:--|
| ![With landscape](/post_images/vim_landscape_colorscheme.png) |

__Vim-airline__ (https://github.com/vim-airline/vim-airline) - beautiful and very useful statusline, just have a look at the project page

__Vim-devicons__ (https://github.com/ryanoasis/vim-devicons) - adds icons to specific file types in nerdtree

__Vim-startify__ (https://github.com/mhinz/vim-startify) - adds a startup screen to vim, with recently closed files, sessions. Pretty convenient to use, I must say.

Clojure related
-----
I lied about not trying to build a complete language env with vim. I did. And it was Clojure.

So plugins I’ve used were:

* https://github.com/tpope/vim-fireplace - for running REPL and having constant code checks
* https://github.com/kien/rainbow_parentheses.vim - useful for matching nested parentheses - so useful with clojure
*  https://github.com/guns/vim-sexp - used to edit S-expressions (? is it? check!)

https://github.com/tpope/vim-sexp-mappings-for-regular-people - just a couple key-bindings to ease the pains of working with vanilla vim-sexp.

Markdown
-----

Since I’m doing a lot of note-taking and editing in vim, I’ve recently settled on using Markdown. I also have multiple plugins for that

* https://github.com/plasticboy/vim-markdown - the most basic plugin that handles almost all the necessary things regarding markdown support

* https://github.com/mzlogin/vim-markdown-toc - quickly produces table-of-contents for a given Markdown file. Very convenient, and does not use javascript for that, as other tools of this kind do!

Latex
----

From time to time I need to edit some Latex file, so my vim contains also a plugin for that world, which is https://github.com/lervag/vimtex - overaly it’s easy to use, although I’m completely sure I’ve just scratched the surface of its possibilities.


Parting words
=====

All my configs can be found in this repo: https://github.com/zygm0nt/dotvim

I use pathogen as my plugin manager. Which is super cool to use. It’s really a no-ceremony tool to install new plugins :)

If you have some advice as to my setup - please, feel free to leave those in the comments’ section.

Also, don’t treat this as a complete list of plugins to use, just wander around and explore. Find your own way. During researching for this blogpost I’ve stumbled upon many more interesting plugins. For example, things I want to checkout in near future are:

* https://github.com/gcmt/taboo.vim - supposedly eases tab management
* https://github.com/mbbill/undotree - an undo manager - thou I’m not sure if I really need one


