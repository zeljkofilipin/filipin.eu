---
tags:  book image
title: Jenkins The Definitive Guide by John Ferguson Smart
---
![Jenkins: The Definitive Guide](/assets/2011/jenkins-the-definitive-guide.png "Jenkins: The Definitive Guide")

I have finished reading [Jenkins: The Definitive Guide](http://www.wakaleo.com/books/jenkins-the-definitive-guide) book today. It took me a while to realize there is free pdf version of the book (and $34.99-$49.49 print and ebook versions).

What is [Jenkins](http://jenkins-ci.org/)? From their web site:

> In a nutshell Jenkins CI (formerly known as Hudson) is the leading open-source continuous integration server.

The book covers everything you need to know. How to install, use and maintain it. There is also a few chapters about [continuous integration](http://en.wikipedia.org/wiki/Continuous_integration) in general. I have just scanned chapters on Java specific topics.

I was reading the book and working on setting up Jenkins, just the way I like to learn. First in a virtual machine on my laptop, then on a real server somewhere in Switzerland.

Almost in every chapter I was surprised to learn how powerful Jenkins is. It can do almost anything you need, and all of it can be done from your favorite browser. I plan to write more about how I use Jenkins as soon as I get more experience with it.

At the moment, Jenkins is checking our Git repository every minute. If there are new commits it pulls them and builds the application. If the build is successful it runs a suite of Watir tests. For a while, it was sendin e-mail if build fails to the person that made the last check in. I have disabled it because links in e-mail messages were broken, since Jenkins was installed in a virtual machine on my laptop. I will also investigate distributed builds, if this machine becomes too busy.

The goal is to have automatic builds and one click deploy to production.

At the end, I did not have a lot of trouble installing or using Jenkins, it is pretty straightforward. I had some [Git problems](/jenkins-windows-and-git/), but managed to resolve them. The majority of the work was in adjusting our rake build script to work with Jenkins.

In short, if you need a continuous integration server, I would recommend Jenkins. If you want to read a book about it, I would recommend this book.
