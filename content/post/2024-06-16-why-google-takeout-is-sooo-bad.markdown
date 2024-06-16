
---
title: "Why Google Takeout is sooo bad!"
date: 2024-06-16T00:00:00Z
url: /2024/06/16/why-google-takeout-is-sooo-bad
draft: false
comments: true
categories:
    - it

---


![Image](/post_images/why-google-takeout-is-sooo-bad-0.png)
*Author: [IdeogramAI](https://ideogram.ai) Prompt: The image shows a typical Google Takeout interface with a large error message indicating that the service is unavailable. In the background, there are frustrated users trying to download their data with unsuccessful attempts, represented by repeated "Failed" and "Retry" notifications.*

---- 

My current data setup is centered around Google Cloud as a place where I store my data. That's also related to how I use the whole vendor ecosystem.

The main issue I have with keeping the data only in Google Cloud is data safety. I just don't want either identity theft or accidental block on my account (by Google) to cut me off from all of my previous photos. You might think it's something close to impossible, but there are numerous examples of that happening to people - eg. look here https://www.nytimes.com/2022/08/21/technology/google-surveillance-toddler-photo.html And ok, this might be a reasonable approach from Google, but who knows what else can trigger that kind of blockage.

So, to be safe against anything similar or just any other data lose, it would be good to have some backup in place.

An ideal solution right now would be to:
- copy all the photos to some other cloud
- have an offline copy of those files/photos

Ideally both of those should happen automatically, according to some predefined schedule. Of course be as maintenance-free as possible.

I have ~200GB of data that I would like backed up on a regular basis. I'd imagine this is not the biggest set of photos a person can have stored there. 
## First attempts

My first approach was to synchronize all the files and all the photos using some syncing tools. Store them on a local hard drive, for future use. But that was less then satisfying. Mainly due to how long the process would take for my size of data.

There's this open-source python tool https://github.com/gilesknap/gphotos-sync - but I'm yet to try that. Although they also note on their project page issues with the backup process. Citing from there:
- Videos are transcoded to lower quality
- Raw or Original photos are converted to 'High Quality'
- GPS info is removed from photos metadata

Bad, but I could live with that, if treating this as a backup.

There's also a paid tool https://photovaultone.com/ - but it's just another small vendor lock-in. I'd like to avoid getting deeper into other vendor to be protected from Google.

## So there's Google Takeout

And yet, there's this Google-offered option, that's designed as a way to take all your data out of Google Cloud and potentially go to some other vendor, or host that on your own. Great idea! Of course Google, as other BigTech companies was coherced to implement it mainly due to GDPR restrictions - so that any user can take the data he/she owns and move out to other place.
Naturally, I thought I'd use this approach to backup my data.
This seemed even more amazing, as there's an option to backup directly to other providers - the options are Dropbox, Microsoft OneDrive, Box.

I thought that using Microsoft OneDrive is a good alternative! Especially in terms of provider diversification. Also, the options of the backup would allow me to create a couple of bigger files - and copying those to my local backup would be much easier then doing so with hundreds of thousands of photos.

Choosing Microsoft OneDrive as an intermediate solution is just using another vendor. But the goal is to:
- have the data backed up in another cloud
- be able to download the data in bigger chunks

On the surface, it looks nice. You can create a scheduled backup process - that may happen at specified intervals, or you can do it one-time.
You can select data you want to export - be it just Photos, or maybe whole Google Drive, and Calendar, Gmail. Everything is there.

But when it actually needs to happen - that's where the issues happen.
## Issues

- the process always fails - no matter what's the size of a chunk I choose
- the logs are kept only for some time, afer 7 days I'm not able to see what happened with the chunks. It's easy to spot missing files - when you have parts from 1 to 10, but there's a 7th missing. But what if there are 10 parts but should be 11?
- no logs of the process 
- errors are very cryptic "Failed to backup"
- tech support is non-existent - I've reached out to the tech support, but they were just passing my issue between different support divisions. Ultimately there were hints like "reinstall your operating system", "turn it off and on"

All in all I don't see this whole process as **extremely** hard. Also, I totally understand those things may fail. But we, as an industry, know what to do with that. There are retries, informative logging. And here I got none of the above. 

So for me, this broadly looks like Google just does not want people to backup their data outside of their cloud, which is super bad!

## Important considerations that I may have missed

I share my photo collection with my closest family. I suspect that Google Takeout won't backup those shared photos. But my purpose **is** to do also copy those.

If I'll be able to make this process reliable, I'd need to think of data retention on target.

Right now I backup just Google Photos - wanted to move to other parts of the ecosystem, when the backup issues are sorted out.
## Follow-up actions

- try other providers - I don't want to use Dropbox, but perhaps Box would work better then OneDrive?
- are there tools that I've missed that might actually work?
- schedule separate backup processes for other parts of the data stored in Google - they'll be smaller and maybe that will result in successful backups
- monitor the backup process state - based on target drive contents

## Closing notes

So, for know I still do the backups. I accept the issues with Google Takeout. It's just better to have majority of my data, then to not have any of that.

## Do you have any recommendations on better backup solutions for Google Photos? Leave your thoughts in the comments!