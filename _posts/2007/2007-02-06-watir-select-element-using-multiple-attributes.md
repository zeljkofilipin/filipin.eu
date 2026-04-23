---
tags:  code ruby
title: 'Watir: Select Element Using Multiple Attributes'
---
There are two links in a page that I am testing.

{% highlight html %}
<a href="1">reply</a>
<a href="2">reply</a>
{% endhighlight %}

I need to get value of href attribute for the second link.

I can not use `:text`, because it will return `href` attribute for the first link.

{% highlight ruby %}
browser.link(:text, "reply").href
#=> "{site}1"
{% endhighlight %}

I can use `:index`, but if anything on that page changes, it could break.

{% highlight ruby %}
browser.link(:index, 2).href
#=> "{site}2"
{% endhighlight %}

[Bret Pettichord](http://www.pettichord.com/) posted posted a solution for this at [wtr-general](httpp//rubyforge.org/pipermail/wtr-general/2006-November/008001.html) a few months ago.

> In 1.5, this syntax works: {% highlight ruby %}
browser.div(:name => 'foo', :index => 2).click
{% endhighlight %} This will find the second `div` with the `name` `foo`.

And it really works.

{% highlight ruby %}
browser.link(:text => "reply", :index => 2).href
#=> "{site}2"
{% endhighlight %}
