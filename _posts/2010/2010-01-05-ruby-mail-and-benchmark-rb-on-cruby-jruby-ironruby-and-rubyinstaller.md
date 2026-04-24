---
tags:  code ruby
title: Ruby Mail and benchmark.rb on CRuby, JRuby, IronRuby and RubyInstaller
---
**Update: Steve suggested I should try the script also with [RubyInstaller](http://rubyinstaller.org/), and I did it.**

This blog post is update of my recent [Ruby Mail on CRuby, JRuby and IronRuby](/ruby-mail-on-cruby-jruby-and-ironruby/) post. Mikel and Jimmy have commented on the post saying I did a poor job, and I would agree. I decided to do a better job this time. Please let me know if measurements can be further improved.

So, I have an e-mail file called `1.eml`:

{% highlight plaintext %}
Date: Thu, 24 Dec 2009 14:37:34 Central European Standard Time
From: from@test.com
To: to@test.com
Message-ID: <4b336e9e762a0_a1014263a4689d3@2003-ie7.mail>
Subject: This is a test email
Mime-Version: 1.0
Content-Type: text/plain;
charset="US-ASCII";
Content-Transfer-Encoding: 7bit

Some text for mail body
{% endhighlight %}

## The First Try

This is the test from the first post. (RubyInstaller was not included in the first post.) It is included here so all code and numbers are at the same page, I guess it is easier to compare that way. Read the file, display subject and total time elapsed (in seconds).

{% highlight ruby %}
time = Time.now
require "rubygems"
require "mail"
mail = Mail.read("1.eml")
puts mail.subject.to_s
puts Time.now - time
{% endhighlight %}

Executed the script three times for each Ruby implementation. RubyInstaller the fastest, CRuby and JRuby were similar in speed, IronRuby was way slower.

| Test Run | 1 | 2 | 3 |
|----------|---|---|---|
| CRuby | 2.594 | 2.109 | 2.11 |
| JRuby | 3.0 | 2.016 | 2.0 |
| IronRuby | 9.8125 | 7.796875 | 7.6875 |
| RubyInstaller | 1.21875 | 1.203125 | 1.203125 |

## The Second Try

Since both Mikel and Jimmy said `require` could take the majority of the time, and I was not really interested in measuring that, I excluded it from the measurement.

HIGHLIGHTPLACEHOLDER2ENDPLACEHOLDER

Times were way shorter. RubyInstaller the fastest (can not get much faster that 0.0 seconds), CRuby and JRuby in the same order of magnitude, IronRuby order of magnitude slower. JRuby has surprisingly the same numbers every time.

| Test Run | 1 | 2 | 3 |
|----------|---|---|---|
| CRuby | 0.015 | 0.016 | 0.0 |
| JRuby | 0.047 | 0.047 | 0.047 |
| IronRuby | 0.5 | 0.46875 | 0.484375 |
| RubyInstaller | 0.0 | 0.0 | 0.0 |

## Benchmark

Mikel and Jimmy have suggested that I should use [benchmark.rb](http://ruby-doc.org/stdlib/libdoc/benchmark/rdoc/index.html), so I took a look. I have slightly modified the script. This time the file was read 1000 times.

HIGHLIGHTPLACEHOLDER3ENDPLACEHOLDER

This measurement said JRuby was the fastest, followed closely by RubyInstaller and CRuby, IronRuby again order of magnitude slower.

| Test Run | user | system | total | real |
|----------|------|--------|-------|------|
| CRuby | 11.000000 | 0.657000 | 11.657000 | 13.485000 |
| JRuby | 6.187000 | 0.000000 | 6.187000 | 6.187000 |
| IronRuby | 69.984375 | 7.140625 | 77.125000 | 60.656250 |
| RubyInstaller | 7.297000 | 0.766000 | 8.063000 | 9.953125 |

## Environment

Tests were run in VMware Fusion 2.0.6 virtual machine, 512 MB RAM, Microsoft Windows Sever 2003 R2 (Standard Edition, Service pack 2).  
Host machine is MacBook Pro, 2.4 GHz Intel Core 2 Duo, Mac OS X 10.6.2, 4 GB RAM.

{% highlight shell %}
>ruby -v
ruby 1.8.6 (2007-09-24 patchlevel 111) [i386-mswin32]

>jruby -v
jruby 1.4.0 (ruby 1.8.7 patchlevel 174) (2009-11-02 69fbfa3) (Java HotSpot(TM) Client VM 1.6.0_10) [x86-java]

>ir -v
IronRuby 0.9.3.0 on .NET 2.0.0.0

>ruby -v
ruby 1.8.6 (2009-08-04 patchlevel 383) [i386-mingw32]
{% endhighlight %}

Mail version 1.3.4 on all platforms.
