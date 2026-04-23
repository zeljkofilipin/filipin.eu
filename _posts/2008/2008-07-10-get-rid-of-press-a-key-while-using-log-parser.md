---
tags:  code
title: Get rid Of "Press a key..." While Using Log Parser
---
As I said before, [I use Log Parser a lot](/log-parser-and-batch-files).

One thing that really annoyed me is `Press a key...` that would appear after each screen of results.

{% highlight shell %}
C:\>LogParser "SELECT text FROM errors.log"
...
Press a key...
...
{% endhighlight %}

It took me some time to get rid of it, so maybe this helps somebody. Use `-rtp:-1` switch and there will be no more `Press a key...`

{% highlight shell %}
C:\>LogParser -rtp:-1 "SELECT text FROM errors.log"
{% endhighlight %}
