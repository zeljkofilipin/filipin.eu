---
tags:  TODO watir
title: FireWatir (WATiR on Firefox) Alpha v1.0 Works!
---
I found the reason why FireWatir was [not working](/firewatir-watir-on-firefox-alpha-v10-released/) at my machine.

Installation guide for FireWatir in step 2.e. says:

> Close Firefox. Restart it again using command “\[Firefox installation directory\]/firefox.exe –jssh” from command prompt.

I opened Command Prompt at Firefox installation directory and copy/pasted "firefox.exe –jssh" (of course, without quotes) there. Pressed enter.

The next step (2.f.) is:

> To check if JSSh is listening on port 9997 run command “telnet localhost 9997” from command prompt.

I copy/pasted "telnet localhost 9997" (also without quotes) to command prompt, pressed enter and got error message.

It took some time and a pretty long conversation at wtr-general mailing list to find the solution to my problem. At the end, I found it myself.

It seems that Word Replaces hypen (shorter -) with dash (longer –).

You can find that setting here:

Word (2003, service pack 2) &gt; Tools &gt; AutoCorrect Options... &gt; AutoFormat &gt; Replace &gt; Hypens (--) with dash (–).

When I replaced dash (longer –) with hypen (shorter -) in "firefox.exe –jssh", everything worked just fine.

What have I learned? Never write documentation in Word. Do it in Notepad.

The whole conversation is [here](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg02974.html).
