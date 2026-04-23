---
tags:  code ruby
title: 'Watir Has A New Method: after?'
---
Imagine that you have two links. Both links are the same.

{% highlight html %}
<a>text</a>
{% endhighlight %}

The only thing that makes them different is that the second one is located after an image.

{% highlight html %}
<a>text</a>
<img src="image.png" />
<a>text</a>
{% endhighlight %}

Of course, you just *have to* click the second link. You have already tried this.

{% highlight ruby %}
browser.link(:text, "text").click
{% endhighlight %}

But, it always clicks the first link. There is a way.

{% highlight ruby %}
browser.link(:after?, browser.image(:src, /image/)).click
{% endhighlight %}

This is *so cool*.

You will need Watir 1.5. Bret Pettichord [posted that at wtr-general](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg08829.html).
