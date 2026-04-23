---
tags:  code ruby
title: Find Element by XPath
---
I had to click a h4 headline.

{% highlight html %}
<h4 id="addproject">Create a new project</h4>
{% endhighlight %}

This did not work.

{% highlight ruby %}
browser.h4(:id, "addproject").click
{% endhighlight %}

I posted a question to [wtr-general](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg09457.html) mailing list and [Angrez Singh](http://angrez.blogspot.com/) was kind enough to help.

This will click h4 headline.

{% highlight ruby %}
browser.element_by_xpath("//h4[@id='addproject']").click
{% endhighlight %}
