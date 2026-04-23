---
tags:  macos podcast
title: Recording a Podcast with Skype on Mac Using Only Free Software
---
I have a small podcast on [Watir](http://wtr.rubyforge.org/) called Watir Podcast.

When I was recording podcasts on Windows XP machine, it was easy to do it using all open source or free software. All you had to do is install [Skype](http://www.skype.com/) (free, voice over Internet), [Audacity](http://audacity.sourceforge.net/) (open source, audio recording and editing) and play a bit with Windows XP audio settings. To be true, it took me a few podcasts to figure out how to set audio just right, as you will surely notice if you listen to the first few of my podcasts.

A few months ago I got a Mac and I thought it would be as easy to record podcasts there. I was wrong. I have been trying and trying and only a few days ago I was able to record a Skype conversation on Mac.

What was the problem? I installed Skype and Audacity (both have Mac versions) and, to my great surprise, there was no option in Audacity to record both audio from Skype and from my microphone, as there is on Windows XP. I browsed around, tried a bunch of software and could not find anything that would work. At the moment, I think it is the limitation of sound card, but I could be wrong. (I used Boot Camp to install Windows XP on Mac, and could not record all audio even then.)

Then I found a great article, [Recording Skype calls on GarageBand with LineIn and SoundFlower (Mac)](http://www.360east.com/?p=133). It showed me that there is a way to record Skype on Mac using only free software. But it got me only 90% of the way. I was able to record both Skype and my audio, but I did not hear Skype audio. Asking a question and not being able to hear the answer is usually a problem in an interview. In the end, I found the solution in article's comments, but it took me a while (and some luck) to figure out how to fix the problem.

So, how to record a Skype conversation?

Install [Soundflower](https://github.com/tap/Soundflower/downloads) (open source), [LineIn](http://www.rogueamoeba.com/freebies/) (free) and [Skype](http://www.skype.com/) (free).

To record and edit audio, you can use [GarageBand](http://www.apple.com/ilife/garageband/) (free, I got GarageBand '08 with Mac OS X, but you have to pay for GarageBand '09) or [Audacity](http://audacity.sourceforge.net/) (open source).

**System Preferences** &gt; Sound  
- Output: Headphones - Built-in Audio (always use headphones when recording so your microphone does not catch sound from the speakers)  
- Input: Internal microphone - Built-in (check 'Use ambient noise reduction' and move microphone input volume slider to the right)

![sound](/assets/sound-300x219.jpg "sound")

**Skype** &gt; Preferences &gt; Audio  
- Audio output: Soundflower (2ch)  
- Audio input: Soundflower (2ch)

![audio](/assets/audio-300x107.jpg "audio")

While configuring Skype for the first use, you should uncheck option that Skype automatically adjusts microphone volume and move the slider to the right, but I can not find that configuration wizard, even after reinstalling.

**LineIn**  
Input from: Build-in Microphone: Internal microphone  
Output to: Soundflower (2ch)

![linein](/assets/linein-300x106.jpg "linein")

**GarageBand**  
Audio output: Built-in Output  
Audio Input: Soundflower (2ch)

![audio\_midi](/assets/audio_midi-300x94.jpg "audio_midi")

Create New Podcast Episode &gt; Male/Female Voice &gt; Monitor: On  
Make sure you turn monitor "On", or you will not hear the other person speaking. I heard my voice with about one second delay, so the next time I will try "On with Feedback Protection" instead of "On" setting.

![1band](/assets/1band-300x195.jpg "1band")

**Audacity**  
Output: Core Audio: Built-in Output  
Input: Core Audio: Soundflower (2ch)

![audacity](/assets/audacity-300x96.jpg "audacity")

Preferences &gt; Audio I/O &gt; Playthrough &gt; Hardware Playthrough: Play new track while recording it &gt; check  
With software playthrough I heard my voice with about one second delay, but it was fine with hardware playthrough.

![audacity-preferences](/assets/audacity-preferences-300x169.jpg "audacity-preferences")

Start Skype conversation and when you want to record, click ‘Pass Thru’ button in LineIn and click record button in GarageBand or Audacity.

Software versions I used:  
Mac OS X 10.5.6.  
Soundflower 1.4.3  
LineIn 2.0.3  
GarageBand '08 4.1.2 (248.7)  
Audacity 1.3.7  
Skype 2.8.0.324
