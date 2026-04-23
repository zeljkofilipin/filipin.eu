---
tags:  code ruby
title: Watir, Ruby, Objects and Variables
---
I test web applications for living. I use Ruby and Watir for automating functional tests. My scripts have grown, so I made a little framework to make them simpler (all code in this post is simplified and not tested).

Class `Page` makes checking page URL and text(s) easier.

{% highlight ruby %}
class Page
  def initialize(ie, url, texts)
    @ie, @url, @texts = ie, url, texts
  end
  def check
    @texts.each do |text|
      assert(@ie.contains_text(text))
    end
    assert_equal(@url, @ie.url)
  end
end
{% endhighlight %}

View item page at application under test has text (breadcrumb) `{item_type} > View` (example: `File > View`).

After item is added/edited, at that page there is also text `{item_type} {action}` (example: `File added.`).

Class `File` tests files, of course.

{% highlight ruby %}
class File
  def initialize
    @page_view = Page.new(
        "app.com/view.aspx",
        ["File > View"])
    @page_view_after_add = Page.new(
        "app.com/view.aspx",
        ["File > View", "File added."])
    @page_view_after_edit = Page.new(
        "app.com/view.aspx",
        ["File > View", "File edited."])
  end
  def add
    # add file
    @page_view_after_add.check
  end
  def edit
    # edit file
    @page_view_after_edit.check
  end
  def view
    # go to file
    @page_view.check
  end
end
{% endhighlight %}

And it works just nice. All I have to write is this.

{% highlight ruby %}
file = File.new
file.add
file.edit
file.view
{% endhighlight %}

There are three objects. One for each (`@page_view...`) variable. `id` in `Page:{id}` is different for each variable.

{% highlight shell %}
#<Page:0x2b5ac28 @url="app.com/view.aspx", @texts=["File > View"]>
#<Page:0x2b5ab98 @url="app.com/view.aspx", @texts=["File > View", "File added."]>
#<Page:0x2b5ab08 @url="app.com/view.aspx", @texts=["File > View", "File edited."]>
{% endhighlight %}

But, duplication bugs me.

I would like that `File#initialize` looks like this.

{% highlight ruby %}
@page_view = @page_view_after_add = @page_view_after_edit = Page.new(
  "app.com/view.aspx",
  ["File > View"])
@page_view_after_add.texts < < "File added."
@page_view_after_edit.texts << "File edited."
{% endhighlight %}

But (surprise!), it does not work. Well, I am pretty new in object oriented world, so this was not really a surprise for me.

This way only one `Page` object is created, and all three variables point to it. No matter which variable I change, it changes the object it points to. Result is that all three variables are the same. Not what I wanted to do.

{% highlight shell %}
#<Page:0x2820048 @url="app.com/view.aspx", @texts=["File > View", "File added.", "File edited."]>
#<Page:0x2820048 @url="app.com/view.aspx", @texts=["File > View", "File added.", "File edited."]>
#<Page:0x2820048 @url="app.com/view.aspx", @texts=["File > View", "File added.", "File edited."]>
{% endhighlight %}

I have tried a few alternatives, but none worked. I will live with duplication for now, but I would like to remove it from my scripts.
