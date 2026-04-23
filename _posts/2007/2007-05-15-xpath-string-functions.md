---
tags:  code ruby
title: XPath String Functions
---
I have XML that looks like this.

{% highlight xml %}
<tokens>
  <shorturl url="resetpassword.aspx?m=7fb83717-9606-4022-bd4e-67b6f6582ada&amp;code=2271ad0e-d627-4e6c-bdfb-2b11d354e9ac" hash="BF8E8F60E722E92C7ED8303916591AB4" />
</tokens>
{% endhighlight %}

I need to get value of `hash` attribute (`BF8E8F60E722E92C7ED8303916591AB4`). I know the value of `m` url parameter (inside `url` attribute) (`7fb83717-9606-4022-bd4e-67b6f6582ada`), but I do not know the value of `code` url parameter.

I know how to get attribute of a tag when I know another attribute of that tag. For example, if I knew `hash` attribute and needed `url` attribute, I would do it like this:

{% highlight ruby %}
e = REXML::Document.new(ie.text).root.elements
e["/tokens/ShortUrl[@hash='BF8E8F60E722E92C7ED8303916591AB4']"].attributes["url"]
#=> "resetpassword.aspx?m=7fb83717-9606-4022-bd4e-67b6f6582ada&code=2271ad0e-d627-4e6c-bdfb-2b11d354e9ac"
{% endhighlight %}

But, I know only part of `url` attribute. Of course, this does not work (because `e[...]` returns `nil`).

{% highlight ruby %}
e["/tokens/ShortUrl[@url='resetpassword.aspx?m=7fb83717-9606-4022-bd4e-67b6f6582ada&code=']"].attributes["hash"]
#=> NoMethodError: undefined method `attributes' for nil:NilClass
{% endhighlight %}

I have heard that there are [XPath string functions](http://www.w3.org/TR/xpath#section-String-Functions), but I did not understand how to use them, or would it even help in this case.

I have solved this problem with regular expressions, but I guess there must be XPath solution.

Also, I have already asked my colleague to simplify that XML, so I can use it, but that has low priority because I have already solved the problem.

[Angrez Singh](http://angrez.blogspot.com/) was kind enough to help me. This is the solution.

{% highlight ruby %}
e["/tokens/ShortUrl[starts-with(@url, 'resetpassword.aspx?m=7fb83717-9606-4022-bd4e-67b6f6582ada&code=')]"].attributes["hash"]
#=> "BF8E8F60E722E92C7ED8303916591AB4"
{% endhighlight %}

You can find [this thread at wtr-general](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg08521.html).
