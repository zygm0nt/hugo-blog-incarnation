
---
title: "Youtube video - generate summary"
date: 2024-09-17T00:00:00Z
url: /2024/09/17/youtube-video-generate-summary
draft: false
comments: true
categories:
    - it

---

![Image](/post_images/maciej-je-generate-summary-0.png)


I really like watching some culinary channels on Youtube. Those can be roughly divided into two categories:
- people cooking some specific recipe
- people doing a review of a restaurant or a bunch of them

It's nice to watch, but after that not too much I can keep from that. If I like a specific recipe, and I'd like to cook that think it's really counter productive to try cooking from the video. I'd constantly need to pause, rewind, replay specific fragments.

Same for review videos - suppose I've watched an interesting video about food recommendations from Rome, with a set of places and a bunch of dishes per restaurant. I won't remember all that. 

This simple idea came out of the proliferation of various advanced models:
- fast transcription models
- good enough language models

I thought about this simple workflow:
1. download a video
2. extract audio path
3. transcribe it
4. prepare a prompt to extract interesting information.

Download source video from Youtube:

```
yt-dlp "https://www.youtube.com/watch?v=9v677cZ4Ias"
```

Extract wav file from the video:

```
ffmpeg -i video_file -ar 16000 -ac 1 -c:a pcm_s16le output.wav
```

Use [whisper.cpp](https://github.com/ggerganov/whisper.cpp) to do the transcription:

```
git clone https://github.com/ggerganov/whisper.cpp.git
make
```

An interesting feature of `whisper.cpp` is that it can now color-code confidence of the transcription. Just add `--print-colors`:

```
./main -f ../output.wav -m models/ggml-small.bin -l pl
```

or 

```
./main -m models/ggml-base.en.bin -f samples/gb0.wav --print-colors
```

Summarize the transcription using some LLM - here, I've tried mostly models from OpenAI. A simple prompt for that is:

```
This file is a transcription of a video review of multiple restaurants, group that into restaurant + recommended food in each of those restaurants. There's a timestamp at the begining of each line, omit it.
```

And that's it! It just worked.

Not the most streamlined approach, as it would have been better to stitch all those commands into one coherent script. But that is a matter of future improvements.

Future ideas:
* create an ebook from the contents of the videos
* this would require selecting key frames from the video to illustrate the articles

