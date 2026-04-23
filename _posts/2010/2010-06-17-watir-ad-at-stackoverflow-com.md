---
tags:  code ruby
title: Watir ad at stackoverflow.com
---
[![watir-so-2-1](/assets/2010/watir-ad-at-stackoverflow-com.jpg "watir-so-2-1")](http://meta.stackoverflow.com/questions/53346/open-source-advertising-sidebar-2h-2010/53544#53544)

New round of free advertising of open source projects at [stackoverflow.com](http://stackoverflow.com) has just started.

We had [17 votes](http://meta.stackoverflow.com/questions/31913/open-source-advertising-sidebar-1h-2010/38414#38414) the last time, 6 were needed to be displayed at stackoverflow.com. The ad got a few complaints about not having any text. (I just copied our logo.)

This time I took a [Creative Commons](http://creativecommons.org/) [photo](http://www.flickr.com/photos/snapr/484776493) and added some text:

{% highlight ruby %}
browser.goto 'watir.com'
# to learn more

browser.goto 'github.com/bret/watir'
browser.span(:text=>'Fork').click
# to contribute
{% endhighlight %}

Feel free to vote or comment for [Watir ad at stackoverflow.com](http://meta.stackoverflow.com/questions/53346/open-source-advertising-sidebar-2h-2010/53544#53544).

If anybody has an idea for different photo or text, please let me know.

Even better, read [the stackoverflow.com blog post](http://blog.stackoverflow.com/2010/06/free-vote-based-advertising-launches-second-round/), create an add and submit it. Then let us know so we can vote for it. (There can be more that one proposal.)
