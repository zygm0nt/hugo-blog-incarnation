
---
title: "Getting things done in a distracted world"
date: 2025-03-13T00:00:00Z
url: /2025/03/13/getting-things-done-in-a-distracted-world
draft: false
comments: true
categories:
    - it

---

Many years ago I've written somewhat similar piece about navigating all the distractions of my life. You can read it here: https://marcin.cylke.com.pl/2016/07/24/it-minimalist/
Years have passed, and I want to revisit the topic. Let this post be a reflection on how my habits changed, but also a summary of techniques that work for me right now.

Let's try to recap my stats for this day, as compared to year 2016 (noted in brackets)

* rss channels 120 (164)
* opened browser tabs ~150 (47)
* movies to watch 45 (29)
* notes in google keep 21 (44)
* books to read 15 (78)

One could say that things have deteriorated a lot in at least a few domains, whereas in some - improved.
Although this might seem silly to show that kind of stats, for me it's a data point of a kind. It gives insight into how my habits improve/deteriorate.

From the tools I've been using then, there are also slight changes. I still use some variant of bullet journaling method. As for notes - I use Google Keep from time to time, but have migrated since to a self-hosted instance of ??
Pocket - yeah, still in use. But I've noticed there's little incentive to come back to those saved articles.

## Browsing the web

The biggest increase in my stats is probably the number of opened tabs. Yeah, that one can get out of hand pretty quickly. 

A few viable solutions for that are:
- do a routine check of those tabs 
	- try to close those no longer of interest to me
	- send to pocket those that seem worth a read - this mostly applies to non-tech content
- "schedule" some of the tabs - save for future reference (more on this below)

The most important change here is my approach to saving tabs for future reference.

It mainly means two things: either create a task in Todoist, that links to it, or put the link in a semi-structured mindmap.

Semi-structured mindmap is often nothing more then an inter-linked Markdown file. Just for organizing useful links into notes. This can have actually any form, that is readable and descriptive enough. 

If I decide to put something in Todoist - it is probably related to a thing I want to do: a project, a link referencing some future task to do, etc. This way, the link would be close to the actual thing I intend to do, and where I want to apply it.
## How to read all those "saved-for-later" articles (Pocket)

This again is the case of creating some kind of workflow around that saved content. I still keep things in there, but the web has gotten significantly more hostile. It's not that easy to read on the web as it was in 2016. A lot of content is paywalled now, not all of that can be easily dumped to Pocket. Maybe some other tools of that kind can handle those missing sites, but branching to them just to save more seems like a bad choice.
So I stick with Pocket.

After saving some content to Pocket, during an occasional moderation session I decide which articles seem like still worth the time to read them. On the opposite side - if I notice some articles are no longer of interest - I just remove them.
Those selected for future reading I'd like to have migrated to some e-book reader, for a convenient reading experience, away from the screen. For that I've prepared a relatively simple script that takes the contents of the saved article and generates an EPub from that. 
This can later by imported to Calibre, if you are into an easy ebook management, or uploaded directly to the reader of your choice.
The thing with Calibre is, that it actually shows what things are already on the reader, and which are not. Also it takes care of the conversion process. I own an Amazon Kindle, and for it to put EPub on it, they need to be converted to Kindle proprietary format. Calibre deals with that.

You can find my script for dealing with exporting to EPub here: TODO make it public

## Task handling

I tend to have a lot of ideas constantly floating around.
My current strategy for dealing with them is keeping a task list. And my current tool of choice for that is Todoist. I'm using a free tier right now. It's sufficient for now. Also, I try not to explore too many advanced features of Todoist, so that a potential migration would not be too cumbersome.

As for the tasks - I have a few recurring "ritual"-like tasks, morning and evening routines. I try to keep there only tasks that are work-related or things I plan to do for my personal development. That's why I put there professional-related articles that I'd like to read, videos that seem worth watching, etc.

Things like normal, day-to-day habits don't end up there.

A thing that I like and enjoy keeping is a group of tasks with subtasks named "Consumption". They are specifically used as a dump of things I found online (articles, videos), or in some other places (book titles, movies), that I'd like to read, watch in the near future.

Later, say, once a week - when I plan things to do for the coming week, I try to pick a few things from those lists.
This approach helps me manyfold:
- for web content - like articles and videos - I can finally go through them in some finite amount of time
- for books and movies - I can resort to those lists as inspiration for when I have this nudge to pick up another book, or see some movie on one of the streaming services. To some degree it frees me from mindlessly browsing the recommendation feeds of those platforms.

### Todoist, Taskwarrior, etc

Why Todoist and not something else?

I've tried setting up an alternative, in the form of Taskwarrior. But this proved to be very inconvenient. The way I use Todoist is I usually past some web content to it, even images. Doing the same with Taskwarrior is rather hard. Taskwarrior seems like a very nice backend for task management, but lacks a good, modern frontend - with keyboard shortcuts, easy task arrangement, etc. 
I plan to keep an eye on that, and I'm even in the process of creating a migration tool. I'd like to keep an up-to-date database of my Todoist tasks in Taskwarrior. Maybe at some point I'll be able to switch completely to this new tool.
Right now I don't want to focus too much on just mastering any new tool. I really appreciate that Todoist does not get in the way, and just allows me to create and manage tasks.

## All those notifications

I tend to be very conservative about notifications. I try to disable as much of them as possible. This is especially applicable to phone-related distractions. 

One common strategy you can devise is just putting your phone in the furthest corner of your room, switched to silent mode. True, this would work. This seems like a real hindrance for me. I'd much rather have the phone in a hands reach, just to not break out of my thinking loop too much if there's some activity on it I need to attend.  

As for the notifications - most of the apps I have installed have notifications disabled. Some of them have notifications allowed either in the morning or in the evening (this is just IOS and its scheduled summary).

Each specific ecosystem - be it IOS or Android have its own way of switching modes. It's very convenient to switch phone to Do Not Disturb mode, when in need of focus.

## Videos

That mainly involves watching stuff on YouTube. It's become my main source of video content. There are of course streaming services for watching movies and series, they're just easier to manage.

### So, let me start with movies

I keep a list of movies and series that I'd like to watch, because what I've observed before was that if time comes when I want to spend the evening watching something it can be daunting to go through the whole catalog of a certain provider and choose something. Even if I settle on something relatively fast, it can be a really shitty movie (looking at you, Netflix). 
That's why, a curated list of movies-to-watch is a convenient cheat-sheet for me.

### .. and YouTube

To tame the constant stream of YouTube videos I do the following:
- try to watch videos just on the weekends
- if a video can be classified as an audio-mostly, audio-only, I put that into a separate playlist. Those I listen to when cleaning the apartment, or running, doing sports.
- if a video catches my attention, I put that on `Watch Later`, then at some point I go through that list and cleanup those, that are actually not interesting any more
- cooking videos often clog my watch queue - before I kept them very long in my queues as reminder to cook those specific recipes, or perhaps because they had some interesting cooking techniques. Nowadays, if I don't watch the video pretty quickly, I just decided to remove them. 

That leaves me with much smaller backlog of videos to watch. 

## Conclusion

Why do all that? Mainly to free the mind from all the distractions around me.

This whole post might seem like a Hoarders 101 manual, but actually it is a lengthy description of rather quick steps for filtering content. I find it really non-intrusive, but rather beneficial.

I'm able to read more of the things that interest me, but also I don't feel flooded with constantly incoming new things.
