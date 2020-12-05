---
title: "awesome WM and how to handle multiple monitors"
date: 2020-11-24T00:00:00Z
url: /2020/11/24/awesomewm-multiple-monitors
draft: true
comments: true
categories: 
    - it
    - linux
    - window-manager
    - awesomeWM
---

Recently I've started using new window manager. Since I've always wanted to try some kind of tiling window manager I thought that a fresh installation of an OS on a new machine is good time to have a go at that. 

From the multitude of possibilities I've chosen [AwesomeWM](https://awesomewm.org/). It's reasonable enough in its standard configuration so I've decided to stick with it at least for the time being.
In fact the only important feature I look for in a tiling window manager is the tiling behavior. All the other features are somewhat... uninteresting. Even more' the multitude of config options is rather too much for me as I don't want to focus on configuring my work environment.

But since I've already made a step towards using tiling window manager why not make that thing usable for me? And as I said earielr - the defaults are quite sane for me. But there is a major issue with the default `rc.lua` - which is that the file does not handle multi-monitor setup in any way. I use currently a laptop with external monitor and since it's a laptop I sometimes just disconnect the thing' even if only to hibernate it for the night. After waking up, all the windows I so meticolously spread on the workspaces are put on the first one. And so I need to start over and before coming back to work I've interrupted, first I need to reprepare the windows. Daunting task to say the least.


So I've started to look for a solution for that matter. There are many solutions for that' I'm sure that the one I chose is not the best one neither the most elegant. But it works somewhat ok. The only real problem being the windows are not aligned as before. They are still assigned to correct workspaces (same ones as before disconnect), so it's good enough.

https://stackoverflow.com/questions/42056795/awesomewm-how-to-prevent-migration-of-clients-when-screen-disconnected?rq=1

To conclude - I still treat me using AwesomeWM as somewhat of an experiment. I like the tiling behavior, but I'm quite unhappy with the need to have 