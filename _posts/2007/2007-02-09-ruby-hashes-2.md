---
tags:  code ruby
title: Ruby Hashes (2)
---
Yesterday I wrote about [Ruby hashes](/ruby-hashes). Use it and you can write nice looking code.

{% highlight ruby %}
edit({"security" => "low"})

def edit(properties)
  prepare_for_edit
  edit_title(properties["title"]) if properties["title"]
  # ...
  edit_security(properties["security"]) if properties["security"]
  check_after_edit
end
{% endhighlight %}

Instead of ugly code.

{% highlight ruby %}
edit(nil, nil, nil, nil, nil, nil, security)

def edit(title = nil, url = nil, mail = nil, description = nil, membership = nil, status = nil, security = nil)
  prepare_for_edit
  edit_title(title) if title
  # ...
  edit_security(security) if security
  check_after_edit
  end
{% endhighlight %}

I got interested when I saw this at wtr-general

> {% highlight ruby %}
ie.div(:name => 'foo', :index => 2).click
{% endhighlight %}
>
> This will find the second div with the name `foo`.

I tried to do something like that, but this was the best I could think of.

{% highlight ruby %}
div(:name => 'foo', :index => 2)

def div(first, second)
  hash = {first, second}
  puts hash[:name]
  puts hash[:index]
end
{% endhighlight %}

And, of course, it did not work.

{% highlight shell %}
ArgumentError: wrong number of arguments (1 for 2)
{% endhighlight %}

I posted my problem to wtr-general and Charley Baker was kind enough to help me. A link to Collecting Hash Arguments from Programming Ruby said it all.

{% highlight ruby %}
div(:name => 'foo', :index => 2)

def div(properties)
  puts properties[:name]
  puts properties[:index]
end
{% endhighlight %}
