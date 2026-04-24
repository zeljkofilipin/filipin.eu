---
tags:  code ruby
title: Ruby Mail on CRuby, JRuby and IronRuby
---
Today I tried Mikel Lindsaar's [Mail](http://github.com/mikel/mail) gem on [CRuby](http://www.ruby-lang.org/en/), [JRuby](http://jruby.org/) and [IronRuby](http://www.ironruby.net/).

Installation of each Ruby version and Mail gem was really easy so I will not describe it here. What interested me was how fast was Mail on each Ruby implementation.

I have created a simple mail and saved it as `1.eml`.

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

This script will read the file, display subject and time elapsed (in seconds).

{% highlight ruby %}
time = Time.now
require "rubygems"
require "mail"
mail = Mail.read("1.eml")
puts mail.subject.to_s
puts Time.now - time
{% endhighlight %}

I have executed the script three times for each Ruby implementation. It looks to me that CRuby and JRuby are similar in speed, and IronRuby is way slower.

| Test Run | CRuby | JRuby | IronRuby |
|----------|-------|-------|----------|
| 1 | 2.594 | 3.0 | 9.8125 |
| 2 | 2.109 | 2.016 | 7.796875 |
| 3 | 2.11 | 2.0 | 7.6875 |

## Environment
Tests were run in VMware Fusion 2.0.6 virtual machine, 512 MB RAM, Microsoft Windows Sever 2003 R2 (Standard Edition, Service pack 2).

Host machine is MacBook Pro, 2.4 GHz Intel Core 2 Duo, Mac OS X 10.6.2, 4 GB RAM.

HIGHLIGHTPLACEHOLDER2ENDPLACEHOLDER

Mail version 1.3.4 on all platforms.
