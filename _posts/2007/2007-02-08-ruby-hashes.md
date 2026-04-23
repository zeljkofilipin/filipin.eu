---
tags:  code ruby
title: Ruby Hashes
---
I have seen Ruby hashes in use, but I never needed them. Until today. I was testing edit community feature. I started with editing title.

{% highlight ruby %}
edit(title)
{% endhighlight %}

I created class `Community` and method `edit`.

{% highlight ruby %}
def edit(title)
  prepare_for_edit
  edit_title(title)
  check_after_edit
end
{% endhighlight %}

Then I tested editing other community properties. Sometimes I need to edit just one property, sometimes a few of them and sometimes all properties. The only way I could think of how to do it is to make all arguments of `edit` method optional.

{% highlight ruby %}
def edit(title = nil, url = nil, mail = nil,
           description = nil, membership = nil,
           status = nil, security = nil)
  prepare_for_edit
  edit_title(title) if title
  edit_url(url) if url
  edit_mail(mail) if mail
  edit_description(description) if description
  edit_membership(membership) if membership
  edit_status(status) if status
  edit_security(security) if security
  check_after_edit
end
{% endhighlight %}

But that caused ugly code when calling `edit` method if, for example, I only wanted to change security property.

{% highlight ruby %}
edit(nil, nil, nil, nil, nil, nil, security)
{% endhighlight %}

I could make `edit_security` (and `edit_title`, `edit_url`...).

{% highlight ruby %}
edit_security(security)

def edit_security(security)
  prepare_for_edit
  set_security(security)
  check_after_edit
end
{% endhighlight %}

Better, but I wanted to try hashes, and it worked great.

{% highlight ruby %}
edit({"security" => "low"})
edit({"security" => "low", "status" => "offline"})

def edit(properties)
  prepare_for_edit
  edit_title(properties["title"]) if properties["title"]
  edit_url(properties["url"]) if properties["url"]
  edit_mail(properties["mail"]) if properties["mail"]
  edit_description(properties["description"]) if properties["description"]
  edit_membership(properties["membership"]) if properties["membership"]
  edit_status(properties["status"]) if properties["status"]
  edit_security(properties["security"]) if properties["security"]
  check_after_edit
end
{% endhighlight %}
