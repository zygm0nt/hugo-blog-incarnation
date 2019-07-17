---
title: "Screen shortcuts for split experience"
date: 2019-07-17T00:00:00Z
url: /2019/07/17/screen-split-experience/
comments: true
categories: 
- screen
- it
---

## Most useful shortcuts to operate screen

Aside from basic screen shortcuts for moving around, creating and
changing windows there are things that create more of a window manager
feel for terminal usage. And these are splits.

You can *create a split* with `Ctrl-a |` - which creates a vertical split.
There is also `Ctrl-A S` to *create a horizontal split*. To *cycle* between
your open splits just use `Ctrl-a <Tab>`. To close the active split - just
press `Ctrl-a X`

## Keep regions saved after detach

Unfortunately screen does not remember splits between detaches. So to
fix this behavior there is one fix:

```
source .screen_layout // read and execute commands from $HOME/.screen_layout
Regions now created.
layout save def // save current regions as layout to keep it when you detach.
```

## Other useful for me

I have a screen config that displays a list of all open windows with
their names. This helps me figure out what's happening and where I'm at
given point in time. I also like to change windows' names to reflect my
current usage. Do this with `Ctrl-a Shift-a` and than enter the desired
name.

There are frequent times when I have a long running screen but have
*just* found a new fancy option I want to put into my `.screenrc`. To
reload it and apply to current screen instance I do `Ctrl-a :source
~/.screenrc`.





