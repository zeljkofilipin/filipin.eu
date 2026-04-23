---
tags:  code ruby
title: 'Watir: Select Element Using Custom Attribute'
---
Paul Rogers and Prema Arya just started a very interesting thread at [wtr-general](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg06769.html).

If you have text field

{% highlight html %}
<input custom_attribute="so cool" type="text" />
{% endhighlight %}

you can get value of `custom_attribute`

{% highlight ruby %}
browser.text_field(:index, 1).attribute_value("custom_attribute")
#=> "so cool"
{% endhighlight %}

and you can set value of that text field using `custom_attribute`

{% highlight ruby %}
browser.text_field(:xpath , "//input[@custom_attribute='so cool']/").set("even more cool")
{% endhighlight %}
