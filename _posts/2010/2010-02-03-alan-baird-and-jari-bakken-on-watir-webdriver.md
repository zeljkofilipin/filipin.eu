---
tags:  watir
title: Alan Baird and Jari Bakken on watir-webdriver
---
On January 28, 2010, [Alan Baird](http://twitter.com/bluegrasscoder) (*&lt;alan\_baird&gt;*) and [Jari](http://github.com/jarib) [Bakken](http://twitter.com/jarib) (**&lt;jarib&gt;**) had a chat about [watir-webdriver](/watir-on-webdriver/) on [\#watir IRC channel at freenode.net](http://wiki.openqa.org/display/WTR/The+IRC+Channel). Published with permission.

> \[14:29\] *&lt;alan\_baird&gt;* jarib: if you are still around I have a follow up webdriver question for you  
> \[14:36\] **&lt;jarib&gt;** alan\_baird: shoot  
> \[14:36\] *&lt;alan\_baird&gt;* ok  
> \[14:36\] *&lt;alan\_baird&gt;* so, in the podcast, Simon says that Webdriver is built on top of html unit  
> \[14:37\] *&lt;alan\_baird&gt;* is that correct?  
> \[14:38\] **&lt;jarib&gt;** it has several backends  
> \[14:39\] **&lt;jarib&gt;** htmlunit being one of them  
> \[14:39\] **&lt;jarib&gt;** in addition it drives IE, Firefox, Chrome, with support for Opera, iPhone and Android on the way  
> \[14:39\] *&lt;alan\_baird&gt;* ok  
> \[14:40\] **&lt;jarib&gt;** was the podcast that confusing? ouch :/  
> \[14:40\] *&lt;alan\_baird&gt;* so, it seems kind of analagous to what a JVM does for different operating systems?  
> \[14:40\] **&lt;jarib&gt;** i guess we ended up talking too much about HtmlUnit  
> \[14:40\] *&lt;alan\_baird&gt;* well, I don't know that it was all that confusing  
> \[14:40\] **&lt;jarib&gt;** you might say that  
> \[14:40\] *&lt;alan\_baird&gt;* but, in trying to type up the show notes I've come up with my own questions  
> \[14:41\] **&lt;jarib&gt;** it gives you a common interface to the various browsers  
> \[14:41\] *&lt;alan\_baird&gt;* ok  
> \[14:41\] *&lt;alan\_baird&gt;* so, that common interface is written in Java right?  
> \[14:41\] **&lt;jarib&gt;** not really - there's bindings in java, ruby, c# and python  
> \[14:42\] **&lt;jarib&gt;** the java and ruby bindings are the most complete  
> \[14:42\] *&lt;alan\_baird&gt;* ok  
> \[14:42\] *&lt;alan\_baird&gt;* i guess I'm not real familiar with the bindings concept, but I guess I can get the gist of it  
> \[14:43\] *&lt;alan\_baird&gt;* but basically there is this thing at the core (webdriver) which can talk to the browsers natively  
> \[14:43\] **&lt;jarib&gt;** alan\_baird: these slides may be helpful: <http://docs.google.com/present/view?id=dgpzbjs_33cxsxd9dd>  
> \[14:43\] **&lt;jarib&gt;** check slide 11+  
> \[14:44\] *&lt;alan\_baird&gt;* k  
> \[14:44\] *&lt;alan\_baird&gt;* looking...  
> \[14:44\] **&lt;jarib&gt;** also slide 27 is telling :)  
> \[14:44\] **&lt;jarib&gt;** although the c# side is mostly complete as well now  
> \[14:45\] **&lt;jarib&gt;** alan\_baird: there's not really a "core" - webdriver speaks to each browser through the mechanism that fits that particular browser the best  
> \[14:45\] **&lt;jarib&gt;** so for firefox and chrome it's through their extension system  
> \[14:45\] **&lt;jarib&gt;** for IE it's C++  
> \[14:46\] **&lt;jarib&gt;** for opera (when it's released) it's using their scope protocol (which is also used by their built-in JS debugger)  
> \[14:46\] **&lt;jarib&gt;** etc.  
> \[14:48\] *&lt;alan\_baird&gt;* seems like this webdriver.h is kind of at the core of all of this?  
> \[14:48\] **&lt;jarib&gt;** only for IE  
> \[14:48\] *&lt;alan\_baird&gt;* ok  
> \[14:49\] **&lt;jarib&gt;** for FF, there's a firefox extension, for example  
> \[14:49\] *&lt;alan\_baird&gt;* so, when you wrote selenium-webdriver, you didn't have to worry about all of the different browsers though did you?  
> \[14:49\] *&lt;alan\_baird&gt;* (cause, that's what webdriver's supposed to do right?)  
> \[14:50\] **&lt;jarib&gt;** alan\_baird: nope, i had to worry about them  
> \[14:51\] *&lt;alan\_baird&gt;* hmm  
> \[14:51\] *&lt;alan\_baird&gt;* well, how did having webdriver make things easier?  
> \[14:52\] **&lt;jarib&gt;** before i started, they had code that would bridge java-&gt;firefox extension, java-&gt;C++ IE driver, java-&gt;chrome extension etc.  
> \[14:52\] *&lt;alan\_baird&gt;* (btw - I'm typing this in the middle of an ice storm, so if I suddenly disappear and don't come back it's probably cause the power went out)  
> \[14:52\] **&lt;jarib&gt;** so i basically ported the java parts to ruby  
> \[14:52\] **&lt;jarib&gt;** so now you also have ruby-&gt;firefox extension, ruby-&gt;C++ etc  
> \[14:53\] *&lt;alan\_baird&gt;* ic  
> \[14:53\] *&lt;alan\_baird&gt;* and that's what selenium-webdriver is right?  
> \[14:53\] **&lt;jarib&gt;** it made it easier since i could reuse those browser-specific parts  
> \[14:53\] **&lt;jarib&gt;** yes  
> \[14:54\] *&lt;alan\_baird&gt;* so, i looked at some of the examples in selenium-webdriver, would it be correct to say that that gem's api follows selenium's existing api?  
> \[14:54\] **&lt;jarib&gt;** how the "language bindings" talk to the browser still differs somewhat from browser to browser  
> \[14:54\] **&lt;jarib&gt;** alan\_baird: it's more correct to say the webdriver API  
> \[14:54\] *&lt;alan\_baird&gt;* ok  
> \[14:54\] **&lt;jarib&gt;** although "webdriver API" =~ "selenium 2 api"  
> \[14:54\] *&lt;alan\_baird&gt;* got it  
> \[14:55\] **&lt;jarib&gt;** however "webdriver API" != "selenium 1 api"  
> \[14:55\] **&lt;jarib&gt;** most people associate "selenium" with the selenium 1 api  
> \[14:55\] *&lt;alan\_baird&gt;* cool...ok now how does webdriver remote come into the picture  
> \[14:55\] *&lt;alan\_baird&gt;* is it required?  
> \[14:55\] *&lt;alan\_baird&gt;* why would you use it?  
> \[14:56\] **&lt;jarib&gt;** the remote is basically two parts: a java web server, and a client driver  
> \[14:57\] **&lt;jarib&gt;** the server will accept commands like "click", "findElement" (using a REST-like JSON-over-HTTP interface)  
> \[14:57\] **&lt;jarib&gt;** before they had java client-&gt;java server  
> \[14:57\] **&lt;jarib&gt;** now we also have a ruby client for that server, so ruby client-&gt;java server  
> \[14:57\] **&lt;jarib&gt;** does that make sense?  
> \[14:58\] **&lt;jarib&gt;** it's not required, but it's useful if you want to run your tests launch the browser on another machine  
> \[14:58\] *&lt;alan\_baird&gt;* is that kind of the replacement for Selenium Grid?  
> \[14:59\] **&lt;jarib&gt;** say, if you're developing on linux, you could easily run your tests on IE on windows, firefox on mac etc. using the remote driver  
> \[14:59\] **&lt;jarib&gt;** no, Selenium Grid is more than that  
> \[14:59\] *&lt;alan\_baird&gt;* ok  
> \[14:59\] **&lt;jarib&gt;** but the webdriver remote stuff could be used to build a similar system  
> \[14:59\] *&lt;alan\_baird&gt;* well, right now, I think I kind of have the same thign  
> \[14:59\] *&lt;alan\_baird&gt;* i have a bunch of VMs that I execute tests on  
> \[14:59\] *&lt;alan\_baird&gt;* and a system that tells the vms when to run the tests  
> \[15:00\] *&lt;alan\_baird&gt;* but, it seems like the remote would be one computer telling the other computers what to do  
> \[15:00\] *&lt;alan\_baird&gt;* as opposed to having it be independent the way I do it now  
> \[15:00\] **&lt;jarib&gt;** right - with the remote, you wouldn't need to distribute your test scripts - each command to the browser would go over the network  
> \[15:00\] **&lt;jarib&gt;** so it's a long-running server process  
> \[15:01\] *&lt;alan\_baird&gt;* thats pretty nifty  
> \[15:01\] *&lt;alan\_baird&gt;* is that the main way people would use that kind of feature for?  
> \[15:02\] **&lt;jarib&gt;** yeah - also makes it easier to test on various combinations of browsers/platforms  
> \[15:03\] *&lt;alan\_baird&gt;* i'm just noticing the slide that says Webdriver has a "lovely API", but apparently we didn't consider it lovely enough so we made watir-webdriver  
> \[15:03\] *&lt;alan\_baird&gt;* :)  
> \[15:03\] **&lt;jarib&gt;** haha  
> \[15:04\] **&lt;jarib&gt;** well, compare it to the selenium api  
> \[15:04\] *&lt;alan\_baird&gt;* i guess that's mainly so people could backport their watir tests without a major rewrite  
> \[15:04\] **&lt;jarib&gt;** yeah, for my part it's mainly because we have a lot invested in the watir api  
> \[15:04\] *&lt;alan\_baird&gt;* right  
> \[15:04\] *&lt;alan\_baird&gt;* same here  
> \[15:04\] *&lt;alan\_baird&gt;* :)  
> \[15:05\] *&lt;alan\_baird&gt;* ok, well thank you very much for letting me bug you  
> \[15:05\] **&lt;jarib&gt;** if i were starting from scratch with experienced developers, i'd probably use the webdriver api directly  
> \[15:05\] **&lt;jarib&gt;** no problem  
> \[15:05\] *&lt;alan\_baird&gt;* i'm going to forward this conversation to zeljko  
> \[15:05\] **&lt;jarib&gt;** yep  
> \[15:05\] **&lt;jarib&gt;** do that  
> \[15:05\] *&lt;alan\_baird&gt;* maybe we might do a little follow up
