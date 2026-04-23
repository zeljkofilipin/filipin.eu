---
tags:  code ruby
title: MatchData
---
Sapna asked [how to extract id from this link](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg09099.html).

{% highlight html %}
<a href="MessageDetail.aspx?id=1303&messageToUser=True">
  RE: Check Copy Request
</a>
{% endhighlight %}

The solution includes using [MatchData](http://phrogz.net/ProgrammingRuby/ref_c_matchdata.html). I use it rarely, and I always forget how it is used. So, every time I need it, I have to read documentation. I have decided to make a note here, so I could easily find it later.

This is how you can get href attribute of that link. I will assumed that he knows text `RE: Check Copy Request`.

{% highlight ruby %}
ie.link(:text, "RE: Check Copy Request").href
=> "MessageDetail.aspx?id=1303&messageToUser=True"
{% endhighlight %}

This will extract 1303.

{% highlight ruby %}
m = /id=(1303)/.match(ie.link(:text, "RE: Check Copy Request").href)
=> #<matchdata :0x2d147b8>

m[1]
=> "1303"
{% endhighlight %}
