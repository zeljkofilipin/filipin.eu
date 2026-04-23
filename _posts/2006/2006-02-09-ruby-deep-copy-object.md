---
tags:  code ruby
title: Ruby (Deep) Copy Object
---
I wanted to make an object. Then copy it. Then change that copy and leave original object intact. But I did not know how to do it. When I do not know how to do something, I always ask [wtr-general](http://www.mail-archive.com/wtr-general%40rubyforge.org/) mailing list. I [posted](http://www.mail-archive.com/wtr-general%40rubyforge.org/msg02650.html) my question. Then I though it would be nice if I explained why I want to copy an object. But it got pretty long, so I put it at my [blog](/watir-ruby-objects-and-variables).

I got a reply.

> Try `Object#clone`.

Could it be that easy?! It could be. After all, this is Ruby. But no, it is not that easy. It did not work. Original object was changing with it's duplicate.

{% highlight ruby %}
class Page
  attr_accessor :texts
  def initialize(url, texts)
    @url, @texts = url, texts
  end
end

page_view = Page.new("app.com/view.aspx", ["File > View"])
page_view_after_add = page_view.clone
page_view_after_add.texts << "File added."

puts page_view.inspect
puts page_view_after_add.inspect
{% endhighlight %}

Output:

{% highlight shell %}
#<Page:0x2820ae0 @url="app.com/view.aspx", @texts=["File > View", "File added."]>
#<Page:0x2820a98 @url="app.com/view.aspx", @texts=["File > View", "File added."]>
{% endhighlight %}

But now I new where to look. So I typed `ri Object#clone` and `ri Object#dup` at Command Prompt (and even looked at [ruby-doc.org/core](http://www.ruby-doc.org/core/)). It said (at both places, for both `Object#clone` and `Object#dup`):

> Produces a shallow copy of obj—the instance variables of obj are copied, but not the objects they reference.

So, it creates a "shallow" copy. I do not need this. I need a "real" copy.

Google helped me. I searched for "ruby copy object" and found the solution. Secret word is "deep" copy.

I added this to `class Page` (and replaced `page_view.clone` with `page_view.deep_clone`) and got what I needed!

{% highlight ruby %}
def deep_clone
  Marshal::load(Marshal.dump(self))
end
{% endhighlight %}

Output:

{% highlight shell %}
#<Page:0x4c1dd10 @url="app.com/view.aspx", @texts=["File > View"]>
#<Page:0x4c1dc50 @url="app.com/view.aspx", @texts=["File > View", "File added."]>
{% endhighlight %}

I do not understand how it works, and I do not care, as long as it works.
