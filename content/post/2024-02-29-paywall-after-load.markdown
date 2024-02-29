---
title: "Payload after load, really"
date: 2024-02-29T00:00:00Z
url: /2024/02/29/payload-after-load
draft: false
comments: true
categories: 
    - it
    - ramblings
    - security

---

![Alt text](/post_images/Pasted image 20240218223426.png])
"source: Dall-E, prompt: generate an image for blogpost titled "breaking a paywall", about exploiting newssite paywall using browser extension"

Today's internet is progressively becoming more and more hostile. It is actually a bunch of walled gardens, in the form of Facebook, Instagram, Linkedin, all the other social media outlets. Now, also news sites are increasingly becoming a payed instances. 

I totally get it, authoring all that content is not cheap. If I want to read quality content, I also want authors to be paid adequately. That's totally fine, and I'm paying for a myriad of news-related sites that are out there.

But funnily enough, there are some paywalls that seem really stupid in the way they're implemented. I'm specifically talking here about some javascript based paywalls. At least that's what it seems to me. 

Let's take http://wired.com as an example. Some of its content is free - but it usually means it is either an "advertisement", listing a bunch of products to buy on such-and-such promotion, or some preview content, like most recent movies to see on Netflix. I'd classify those articles as rather low quality content. Fast-food for your mind.

But Wired.com has a lot more to offer, some of its articles are really good and insightful. Those are the long-reads you can immerse yourself into. Eg. https://www.wired.com/story/mirai-untold-story-three-young-hackers-web-killing-monster 

If you don't have an account on Wired.com and you've used up your quota of free articles for the time being, the main contents of the article it quickly gets blocked with the following message:

![Alt text](/post_images/Pasted image 20240218222350.png)

The only thing visible then is article's header and a few first sentences:


![Alt text](/post_images/Pasted image 20240218222610.png)

However, there's one neat trick to be used here. 

First, try to refresh the page again and quickly scroll down the page - it actually has the full contents of the article there, which are replaced by the paywall information after a second or sth like that.

This "paywall" can be exploited by simply installing some "Read later" browser plugin, like [Pocket](https://getpocket.com/home), or [InstaPaper](https://www.instapaper.com/), etc. I personally use Pocket. 

So, as the page loads, just click the appropriate icon for your reader in the browser bar, but you need to do that before the paywall loads.

What's interesting to me, and I personally regard that as some kind of error, or omission - why would the site owners want me to have a glimpse at the full content for just a second? Is this some elaborate psychological barrier, which should make people buy a subscription?

Is it for search sites, to suffice the Gods of SEO? That would be misguided? What happened with sites serving different content to search robots?

Maybe there's some deeper sense in that, that I don't get right now? If so, let me know about that. Drop a message through my socials, or leave a comment below!

