---
title: "running gamecube emulator on Linux"
date: 2020-11-19T00:00:00Z
url: /2020/11/19/running-gamecube-on-linux
draft: true
comments: true
categories: 
    - it
    - retro
    - nintendo
    - gamecube
---

I have a fondness for all the retro things in tech, and try to hone this when I have time with exploring old tech. This time I tried running one of the retro consoles' emulators. I chose Nintendo Gamecube - because of many reasons, but one of them being I own a quite recent incarnation of the Nintendo spirit, namely Nintendo Switch. So with the older one I've wanted to see how the games look like back than and how much the landscape of gaming on Nintendo has changed with that big of an age gap.

The only Gamecube emulator I know of is called [Dolphin](https://dolphin-emu.org/).

Since my current retro gaming machine is linux-based and there is no prebuilt version for my os version I've just compiled it from sources. Pretty astonished that for such a big project, with lots of changes there are only 5 major tags in the repo. And so since I didn't want to have a lagging version by building from 5.0 stable tag I've decided to go full-on on build from the top of master branch.

Following the build instructions, the whole process went rather smoothly. Starting games is easy and as long as they're well supported by the emulator there really aren't any issues with them.

My main problem however is with the controls. The original controller for Gamecube is quite an elaborate one. Emulating that behavior with the keyboard seems too cumbersome, too inconvenient. That's why I've tried using Xbox 360 controller I had lying around. Which proved to be somewhat of a success but not a complete one. There is an implemented way to do it in Dolphin, there's even a very nice tool to assign keys. But unfortunately stick calibration does not work, at least for me, at least not now.

After asking on the DolphinEmu forums about this "glitch" it actually came out as my error. I should have chosen the "keys" for the sticks first. This not being that obvious in the first place now seems like something obvious considering other steps of the calibration process :D



