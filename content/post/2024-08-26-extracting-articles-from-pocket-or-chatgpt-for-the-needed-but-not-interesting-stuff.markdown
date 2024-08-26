
---
title: "Extracting articles from Pocket - or ChatGPT for the needed but not interesting stuff"
date: 2024-08-26T00:00:00Z
url: /2024/08/26/extracting-articles-from-pocket-or-chatgpt-for-the-needed-but-not-interesting-stuff
draft: false
comments: true
categories:
    - it

---

![Prompt: An illustrated medium shot of a man with a backpack starting an adventure into a land of wild newspaper articles. The man is standing in a forest of newspaper stands. The background has an old-fashioned town with buildings made of bricks. The overall image has a warm hue.](/post_images/extracting-articles-from-pocket-or-chatgpt-for-the-needed-but-not-interesting-stuff-0.png)

[Pocket](https://getpocket.com) is a nice service. It can save articles from the web for you to read later. Nice. It can even help in bypassing annoying paywalls (more on this [here](/2024/02/29/payload-after-load/)). With the ease of using it, I can quickly end up with a substantial backlog of articles to go through. Since reading long articles on a screen feels like a chore, I came up with the idea of exporting articles into EPub format and reading them on an e-reader.

My first approach to solving this was with Zapier. I hadn't used it before but had read that it was possible to create an integration that would connect to Pocket, check for articles marked with a specific tag, and then export the contents of the article into a PDF using some external service. This required multiple sites to cooperate, new accounts, and API keys, etc. It all seemed fragile, and in the end, it didn’t work.

But maybe there are others ways to do that? 
### First try

The first attempt was to use the Pocket API to fetch the articles:

> generate a python script that fetches saved articles from Pocket 

But how do I get the access token? I need to login and authorize!

> generate python code that performs login into pocket via api

That was quick!

On the plus side 
* no need to go through an API that brings little new things to me.
* the code worked almost immediately 

Unfortunately, even with the tokens, the first script did not work. 

```python
Traceback (most recent call last):
  File "/Users/xyx/projects/library_tools/pocket-to-epub.py", line 68, in <module>
    main()
  File "/Users/xyx/projects/library_tools/pocket-to-epub.py", line 64, in main
    create_epub(article)
  File "/Users/xyx/projects/library_tools/pocket-to-epub.py", line 38, in create_epub
    c1.content = article['article']
                 ~~~~~~~^^^^^^^^^^^
KeyError: 'article'
```

After examining the output from API, there was no `article` field - obviously. Maybe it existed at some point, but according to online documentation, Pocket no longer offers document retrieval. Fair enough; it’s their core business.

### Let's try Something Else

For a brief period of time I just wanted to handle the transformation process on my own, using some additional library like `readability`, or `Goose`. The flow would be:
1. fetch article metadata from API
2. get URL of the article from the metadata
3. transform

But this has a serious flaw. In my Pocket Saves, I have a bunch of articles that are either not available anymore or are behind a paywall, etc. And these are the ones I'd still want to read. So this approach was no good.

This was a separate ChatGPT session - just an exploration.

### Pivot!

So maybe I can just use some Javascript code for that? 

> write a javascript function that looks for element \<div lang="en"> and copies everything in it (whole html structure) to clipboard

The element mentioned in the message is exactly what keeps article contents - explored in the browser.

I tested that in Firefox console. Well, something worked. But my clipboard was empty, apparently because Firefox was blocking clipboard operations from some random code. Well done in terms of security!

But probably Firefox extensions should be able to alleviate this limitation!

> wrap that in a firefox extension

And Bam! I got all the necessary code snippets to create a Firefox extension, along with the instructions on how to load that into the browser.

With that approach it just worked. I had the copy of the article in my clipboard.

Well, fine—but going through many articles, copying them into the clipboard, and then saving them to an external file by hand would still be tedious!

It would be much nicer to have the extension preparing the files for me!

> Modify the extraction function so as it takes article title from first \<h1> element in first \<header> element. Use that title to name a file to which the contents of the copied \<div> will be stored. The file should be offered as a download.

And it did just that! Worked beautifully!


## Conclusion

If it was not for the LLM-based conversation I would not accomplish in such a short amount of time. The whole thing took me ~15 minutes. I'd also need to learn a bit to accomplish that:
* I'm pretty weak at Javascript
* I know nothing about building Firefox extensions
* I'd probably have give up after exploring the first dead-end with Python app accessing API

I must say, that this coding session with ChatGPT worked out really well!


## Afterthoughts - LLMs are good for side-quests

There are often situations where I'm using a specific application, usually through a browser or some online service with API access. It probably works okay, but there are some aspects that can be improved.

Then comes an idea, like:
* "Damn, I use Strava - but I'm not 100% OK with them having all my data, what if they end up like Endomondo or other similar services and close their doors at one point?" -> I want to backup or have my own copy of the data 
* "I'd like to have this backup for all the open tabs I have right now. How to do that? It would be cool to write this single browser extension just for that." -> I'd use that again, for backing up, or tracking the number of opened tabs. So, for fun and as a way to keep my hunter-gatherer mind satisfied.
* I have this need and habit of reading code - eg. take big pile of code, from an open source project and read it. In the process, I tend to make notes. I've always wanted to add some annotations to the code. But haven't found a plugin for that. So I've resorted to ChatGPT for that. And it delivered! It generated Visual Studio Code plugin exactly for this use-case


Or any other quite wacky idea, that's not that hard to implement but would require learning a new set of libraries or tools that I'm not that fond of learning on my own. 

That's the perfect niche that I may use ChatGPT! These tools are pretty small and end easy to describe, even if I need to refine my prompts a few times.

In the examples above, the common pattern emerges. LLMs are a good tool to take an idea that is just a nicety and make it happen. They’re even more useful if I’m not too proficient in some environment—e.g., I don’t know how to write VS Code plugins, and I don’t want to dive deep into that. But I miss this one particular functionality.

Other good write-ups on the matter:
- [How I Use ChatGPT Daily](https://bartwronski.com/2024/01/22/how-i-use-chatgpt-daily-scientist-coder-perspective/) - A Scientist-Coder Perspective
- [Building C Extensions for SQLite with ChatGPT Code Interpreter](https://simonwillison.net/2024/Mar/23/building-c-extensions-for-sqlite-with-chatgpt-code-interpreter/)
- [Claude and ChatGPT: Case Study](https://simonwillison.net/2024/Mar/22/claude-and-chatgpt-case-study/)
