---
title: "I don't do backups"
date: 2020-02-26T00:00:00Z
url: /2020/02/26/i-dont-do-backups/
draft: false
comments: true
categories: 
- it
---

I tend to not do backups. I used to but just didn’t like it. I wasn’t
diligent enough, didn’t have a routine setup. It all felt fragile and
error prone in the end. So I stopped. You probably wonder when this will
actually hit me - I sometimes do, too. 

![please do backups](/post_images/do_backups.jpg)

But the truth is I do have backups. I just don’t keep them by myself, I
delegate.

I use the computer mainly to do web browsing, photo management,
programming, exploration. Sometimes gaming. Sometimes document browsing
or editing. This positions me in a pretty good place where I don’t need
to worry about files taking a lot of space. Most of my creativity ends
up as a text - one form or the other.

As for Photos - I them keep in the cloud. With the advent of modern
phones with their ubiquitous connected platforms and my lack of
ability/interest in the intricacies of semi-pro photo taking - that’s
more than enough for. Me I just let my photos be synced into cloud
providers. 

Most of my creativity is in programming and exploration. And those are
the things I care deeply not to lose. These range from simple code
snippets, testing out new libraries, to personal projects etc. You name
it. Sometimes it even contains just random notes - I keep my notes as a
versioned repository nowadays. 

The strategy I currently use is to have all those small projects,
directories with notes, etc. stored as Git repositories. Since there are
many public Git providers I just use those. Be it Github, or anything
else - they’re just Git repos. They might have different access methods,
but as long as I use the standard Git repository paths - I’m safe with
normal git tools to be able to access them. And so as long as I remember
to push my changes into those repos after finishing my work, or at least
from time to time - I’m on the safe side here.

But there’s a problem with that. Having that repositories checked out in
different places all along my home directory always ends up as major
PITA. I had a few approaches into trying to write scripts, just for
exploring all the directory structures and checking if my git repos,
that I care so much about, are actually synced with upstream. Always, in
the end the sources for those scripts were lost, in the end. Pity.

And then came the enlightenment! Why not go with using Git facilities
all along! Use submodules Marcin!


![please do backups](/post_images/luke_submodules.png)


And so I did!

I now use Git submodules to create a nested repo. This not only lets me
easily keep track of the sync state of all the projects, but also is a
kind of workspace. I can add or remove projects from this workspace and
when switching to different machine still have the same layout of
directories in my workspace.

My workflow for starting a new project:



1. Either start with a fresh directory, but elsewhere than my git-based
   workspace, or just create an empty repo somewhere.
2. Clone the repo into git-based workspace by doing: git submodule add
   &lt;repo_link> dir/in/workspace
3. Start working on the project

Storing projects like this, using just the workflow above gives me a lot
of benefits

*   Single place to check for my projects and track their progress,
*   Before I used to create projects and then after not working on them
    just completely forgot where’s the newest version, or even how the
project is named - the problem with funnily named pet-projects. Now this
problem is mostly gone.
*   Peace of mind, serenity, good sleep at night ;-) - because it’s git,
    it gives me the great benefit of being usable. As one of the
problems with backups, is to actually be able to recover data from them
in case of emergency.

With that in place, the only fragile part of my non-backup approach is
web browsing. As I tend to have lots of [browsers, browser’s windows,
tabs open](http://marcin.cylke.com.pl/2016/07/24/it-minimalist/) I would
just be very unhappy if all this mess would get lost in some disaster -
like hardware failure or software error. But there is hope for this too,
and I’m working to solve this one according to my liking :)

Actually, there’s one category of things I do backups of. And they are
cryptographic keys. Different ones. Obviously I store my ~/.ssh
directory, but there are others. I store them in at least one location,
just for the sake of safety and ease of life in the future.

And what are your thoughts about backuping current work, and real-life
backuping

Useful links about submodules:

*   https://medium.com/@porteneuve/mastering-git-submodules-34c65e940407
*   [https://medium.com/@porteneuve/mastering-git-subtrees-943d29a798ec](https://medium.com/@porteneuve/mastering-git-subtrees-943d29a798ec)

Other approaches to backups:

*   [https://hackaday.com/2020/01/20/new-year-habits-what-do-you-do-for-data-storage/](https://hackaday.com/2020/01/20/new-year-habits-what-do-you-do-for-data-storage/)
