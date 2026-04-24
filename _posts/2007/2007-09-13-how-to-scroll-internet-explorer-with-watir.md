---
tags:  code image ruby
title: How to Scroll Internet Explorer with Watir
---
This is another gem from Watir General Google group.

[How to scroll Internet Explorer with Watir?](http://groups.google.com/group/watir-general/browse_thread/thread/a0504c3358716dbb/b3d09c8cca522ec8)

{% highlight ruby %}
require 'watir'
browser = Watir::IE.start('http://www.google.com')
browser.link(:text, 'About Google').document.scrollintoview
{% endhighlight %}

![scrollintoview.png](/assets/2007/how-to-scroll-internet-explorer-with-watir.png)
