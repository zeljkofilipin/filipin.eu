---
tags:  code ruby
title: Internet Explorer Puts map Tag inside head Tag
---
I have ported *Support for XPATH in Watir* by [Angrez Singh](http://angrez.blogspot.com/) to wiki format.

I was trying example from *What to do for elements not having class in Watir* section and for this HTML:

{% highlight html %}
<map name="chart">
  <area shape="poly" coords="150,16,159,17,168,20,175,25,182,32,150,56,150,56" />
  <area shape="poly" coords="182,32,188,43,190,56,150,56,150,56" ref="PieChart.html?category=Critical&pieIndex=0" />
</map>
{% endhighlight %}

Watir always returned `nil`:

{% highlight ruby %}
ie.element_by_xpath("//area[contains(@href , 'PieChart.html')]/")
# => nil
{% endhighlight %}

I asked Angrez am I doing something wrong and he replied to check if generated HTML (that is rendered in the browser) is the same as source HTML.

Brilliant!

There seems to be a bug in Internet Explorer 7 (IE). If you create HTML file with above HTML (only that code, do not add anything else) IE puts `map` tag inside `head` tag. Firefox 2 puts it inside `body` tag, of course. The workaround is to put `map` tag explicitly inside `body` tag.
